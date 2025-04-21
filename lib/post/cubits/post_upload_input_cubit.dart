import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'post_upload_input_state.dart';
part 'post_upload_input_cubit.freezed.dart';

class PostUploadInputCubit extends Cubit<PostUploadInputState> {
  PostUploadInputCubit() : super(const PostUploadInputState());

  void addImage(XFile xFile) {
    final added = [...state.imageDataList, xFile];
    emit(state.copyWith(imageDataList: added));
  }

  void removeImage(int index) {
    final removed = [
      ...state.imageDataList.sublist(0, index),
      ...state.imageDataList.sublist(index + 1, state.imageDataList.length),
    ];

    emit(state.copyWith(imageDataList: removed));
  }

  void updateContent(String content) => emit(state.copyWith(content: content));

  void addHashTag(String hashTag) {
    print(hashTag);
    final added = [...state.hashTags, hashTag];
    emit(state.copyWith(hashTags: added));
  }

  void removeHashTag(int index) {
    final removed = [
      ...state.hashTags.sublist(0, index),
      ...state.hashTags.sublist(index + 1, state.hashTags.length),
    ];

    emit(state.copyWith(hashTags: removed));
  }
}
