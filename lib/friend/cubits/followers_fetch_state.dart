part of 'followers_fetch_cubit.dart';

@freezed
class FollowersFetchState with _$FollowersFetchState {
  const factory FollowersFetchState.initial() = _Initial;
  const factory FollowersFetchState.loading() = _Loading;
  const factory FollowersFetchState.loaded(List<Friend> friends) = _Loaded;
  const factory FollowersFetchState.error(
    String message,
    String reason,
  ) = _Error;
}
