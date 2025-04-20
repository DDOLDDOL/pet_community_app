part of 'followings_fetch_cubit.dart';

@freezed
class FollowingsFetchState with _$FollowingsFetchState {
  const factory FollowingsFetchState.initial() = _Initial;
  const factory FollowingsFetchState.loading() = _Loading;
  const factory FollowingsFetchState.loaded(List<Friend> friends) = _Loaded;
  const factory FollowingsFetchState.error(
    String message,
    String reason,
  ) = _Error;
}
