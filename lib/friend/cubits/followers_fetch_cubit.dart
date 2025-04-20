import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_community_app/friend/friend.dart';

part 'followers_fetch_state.dart';
part 'followers_fetch_cubit.freezed.dart';

class FollowersFetchCubit extends Cubit<FollowersFetchState> {
  FollowersFetchCubit(this._repository)
      : super(const FollowersFetchState.initial());

  final FriendRepository _repository;

  Future<void> fetchFollowers() async {
    emit(const FollowersFetchState.loading());

    try {
      final followers = await _repository.fetchFollowers();
      emit(FollowersFetchState.loaded(followers));
    } on Exception catch (error) {
      emit(
        FollowersFetchState.error(
          '팔로워 리스트를 불러올 수 없습니다',
          error.toString().split('Exception: ').last,
        ),
      );
    }
  }
}
