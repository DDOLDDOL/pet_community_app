import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_community_app/friend/friend.dart';

part 'followings_fetch_state.dart';
part 'followings_fetch_cubit.freezed.dart';

class FollowingsFetchCubit extends Cubit<FollowingsFetchState> {
  FollowingsFetchCubit(this._repository)
      : super(const FollowingsFetchState.initial());

  final FriendRepository _repository;

  Future<void> fetchFollowings() async {
    emit(const FollowingsFetchState.loading());

    try {
      final followings = await _repository.fetchFollowings();
      emit(FollowingsFetchState.loaded(followings));
    } on Exception catch (error) {
      emit(
        FollowingsFetchState.error(
          '팔로워 리스트를 불러올 수 없습니다',
          error.toString().split('Exception: ').last,
        ),
      );
    }
  }
}
