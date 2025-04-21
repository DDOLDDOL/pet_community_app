part of 'post_upload_input_cubit.dart';

@freezed
class PostUploadInputState with _$PostUploadInputState {
  const factory PostUploadInputState({
    @Default([]) List<XFile> imageDataList,
    @Default('') String content,
    @Default([]) List<String> hashTags,
  }) = _PostUploadInputState;

  const PostUploadInputState._();

  bool get isValid => imageDataList.isNotEmpty && content.isNotEmpty;
}