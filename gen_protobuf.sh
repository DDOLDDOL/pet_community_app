#!/bin/bash


set -e


PROTO_DIR="lib/protobuf"
OUT_DIR="$PROTO_DIR/generated"
MODULES=()


clear_old_files() {
  if [ -d "$OUT_DIR" ]; then rm -rf "$OUT_DIR"
  fi
}


# 옵션을 파싱하여 동작을 수행합니다
assert() {
  case $1 in
    --re-gen)  clear_old_files  ;;
    "")  ;;
    *)
      echo "$1: 잘못된 옵션입니다"
      exit 1
  esac
}


assert "$1"


# MODULES에 lib/protobuf 하의 디렉토리명들을 추가
for dir in "$PROTO_DIR"/*; do
  echo -e "$dir"
  if [ -d "$dir" ]; then
    MODULES+=("$(basename "$dir")")
  fi
done
# generated 디렉이 이미 있었을 경우 MODULES에 추가되므로 제거
MODULES=(${MODULES[@]/generated/})


# generated 디렉토리와 generated/generated.dart 파일 생성
GENERATED_EXPORT="$OUT_DIR/generated.dart"
rm -f "$GENERATED_EXPORT" # 기존 generated/generated.dart 파일 삭제
mkdir -p "$OUT_DIR"
touch "$GENERATED_EXPORT" # 새로 만들기


# generated 디렉토리 하위에 protoc_gen 된 파일들이 들어갈 디렉들 생성
for module in "${MODULES[@]}"; do
  mkdir -p "$OUT_DIR/$module" # dto, request, result 디렉토리 생성
done


# protobuf 파일 컴파일
for module in "${MODULES[@]}"; do
  for proto_file in "$PROTO_DIR/$module"/*.proto; do
    if [ -f "$proto_file" ]; then
      echo "Compiling $proto_file..."
      protoc \
        --dart_out="$OUT_DIR" \
        --proto_path="$PROTO_DIR" \
        "$proto_file"
    fi
  done
done


# 각각의 export 파일에 generated된 파일들의 export문 추가
for module in "${MODULES[@]}"; do
  DIR="$OUT_DIR/$module"
  FILE_EXPORT=""

  if [ -f "$DIR/$module.dart" ]; then
    rm -f "$DIR/$module.dart"
  fi

  for file in "$DIR"/*.dart; do
    FILE_NAME="${file#"$DIR/"}"

    if [ -z "${FILE_EXPORT}" ]; then
      FILE_EXPORT="${FILE_EXPORT}export '$FILE_NAME';"
    else
      FILE_EXPORT="$FILE_EXPORT\nexport '$FILE_NAME';"
    fi
  done

  touch "$DIR/$module.dart" # 각각의 생성된 파일들을 export 할 dart 파일 생성
  echo -e ${FILE_EXPORT} >> "$DIR/$module.dart" # export 파일에 export문 추가
  echo -e "export '$module/$module.dart';" >> "$OUT_DIR/generated.dart" # export 파일에 export문 추가

  FILE_EXPORT=""
done


echo "✅ Protobuf files generated."