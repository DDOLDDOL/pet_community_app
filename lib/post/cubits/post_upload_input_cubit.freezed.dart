// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_upload_input_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostUploadInputState {
  List<XFile> get imageDataList => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String> get hashTags => throw _privateConstructorUsedError;

  /// Create a copy of PostUploadInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostUploadInputStateCopyWith<PostUploadInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostUploadInputStateCopyWith<$Res> {
  factory $PostUploadInputStateCopyWith(PostUploadInputState value,
          $Res Function(PostUploadInputState) then) =
      _$PostUploadInputStateCopyWithImpl<$Res, PostUploadInputState>;
  @useResult
  $Res call({List<XFile> imageDataList, String content, List<String> hashTags});
}

/// @nodoc
class _$PostUploadInputStateCopyWithImpl<$Res,
        $Val extends PostUploadInputState>
    implements $PostUploadInputStateCopyWith<$Res> {
  _$PostUploadInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostUploadInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageDataList = null,
    Object? content = null,
    Object? hashTags = null,
  }) {
    return _then(_value.copyWith(
      imageDataList: null == imageDataList
          ? _value.imageDataList
          : imageDataList // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      hashTags: null == hashTags
          ? _value.hashTags
          : hashTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostUploadInputStateImplCopyWith<$Res>
    implements $PostUploadInputStateCopyWith<$Res> {
  factory _$$PostUploadInputStateImplCopyWith(_$PostUploadInputStateImpl value,
          $Res Function(_$PostUploadInputStateImpl) then) =
      __$$PostUploadInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<XFile> imageDataList, String content, List<String> hashTags});
}

/// @nodoc
class __$$PostUploadInputStateImplCopyWithImpl<$Res>
    extends _$PostUploadInputStateCopyWithImpl<$Res, _$PostUploadInputStateImpl>
    implements _$$PostUploadInputStateImplCopyWith<$Res> {
  __$$PostUploadInputStateImplCopyWithImpl(_$PostUploadInputStateImpl _value,
      $Res Function(_$PostUploadInputStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostUploadInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageDataList = null,
    Object? content = null,
    Object? hashTags = null,
  }) {
    return _then(_$PostUploadInputStateImpl(
      imageDataList: null == imageDataList
          ? _value._imageDataList
          : imageDataList // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      hashTags: null == hashTags
          ? _value._hashTags
          : hashTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$PostUploadInputStateImpl extends _PostUploadInputState {
  const _$PostUploadInputStateImpl(
      {final List<XFile> imageDataList = const [],
      this.content = '',
      final List<String> hashTags = const []})
      : _imageDataList = imageDataList,
        _hashTags = hashTags,
        super._();

  final List<XFile> _imageDataList;
  @override
  @JsonKey()
  List<XFile> get imageDataList {
    if (_imageDataList is EqualUnmodifiableListView) return _imageDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageDataList);
  }

  @override
  @JsonKey()
  final String content;
  final List<String> _hashTags;
  @override
  @JsonKey()
  List<String> get hashTags {
    if (_hashTags is EqualUnmodifiableListView) return _hashTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashTags);
  }

  @override
  String toString() {
    return 'PostUploadInputState(imageDataList: $imageDataList, content: $content, hashTags: $hashTags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostUploadInputStateImpl &&
            const DeepCollectionEquality()
                .equals(other._imageDataList, _imageDataList) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._hashTags, _hashTags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_imageDataList),
      content,
      const DeepCollectionEquality().hash(_hashTags));

  /// Create a copy of PostUploadInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostUploadInputStateImplCopyWith<_$PostUploadInputStateImpl>
      get copyWith =>
          __$$PostUploadInputStateImplCopyWithImpl<_$PostUploadInputStateImpl>(
              this, _$identity);
}

abstract class _PostUploadInputState extends PostUploadInputState {
  const factory _PostUploadInputState(
      {final List<XFile> imageDataList,
      final String content,
      final List<String> hashTags}) = _$PostUploadInputStateImpl;
  const _PostUploadInputState._() : super._();

  @override
  List<XFile> get imageDataList;
  @override
  String get content;
  @override
  List<String> get hashTags;

  /// Create a copy of PostUploadInputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostUploadInputStateImplCopyWith<_$PostUploadInputStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
