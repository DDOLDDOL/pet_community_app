part of 'image_pick_cubit.dart';

@freezed
class ImagePickState with _$ImagePickState {
  const factory ImagePickState.initial() = _Initial;
  const factory ImagePickState.loading() = _Loading;
  const factory ImagePickState.loaded(List<File> images) = _Loaded;
  const factory ImagePickState.error(String message, String reason) = _Error;
}
