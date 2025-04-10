part of 'comment_fetch_cubit.dart';

@freezed
class CommentFetchState with _$CommentFetchState {
  const factory CommentFetchState.initial() = _Initial;
  const factory CommentFetchState.loading() = _Loading;
  const factory CommentFetchState.loaded(
    List<CommentDetail> comments,
  ) = _Loaded;
  const factory CommentFetchState.error(
    String message,
    String reason,
  ) = _Error;
}
