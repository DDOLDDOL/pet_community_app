import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../api/api.dart';
import '../../auth/auth.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  /// 앱 전반에서 [User]의 상태를 관리합니다
  ///
  /// 앱의 Auth 분기는 [UserAuthState]가 아닌 [UserState]에 의해 처리합니다
  UserBloc(this._repository) : super(const UserState()) {
    _userSubscription = _repository
        .watchUser()
        .listen((user) => add(UserEvent.userUpdateRequested(user)));

    on<_UserUpdateRequested>(_onUserUpdate);
    on<_UserFetchRequested>(_onUserFetch);
  }

  factory UserBloc.create(BuildContext context) => UserBloc(
        context.read<AuthRepository>(),
      );

  factory UserBloc.of(BuildContext context) =>
      context.read<UserBloc?>() ?? UserBloc.create(context);

  final AuthRepository _repository;
  late final StreamSubscription<User> _userSubscription;

  Future<void> _onUserFetch(
    _UserFetchRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState());

    try {
      await _repository.fetchUser();
    // } on ApiException catch (exception) {
    //   final errorMessage = exception.when(
    //     apiError: (_, message) => message,
    //     unauthorizedError: () => 'Unauthorized User',
    //     serverError: () => 'Server Error',
    //   );
    //   emit(UserState(user: User.unknown(), errorMessage: errorMessage));
    } on Exception catch (exception) {
      // final errorMessage = exception.toString().split('Exception: ').last;
      // emit(UserState(user: User.unknown(), errorMessage: errorMessage));
    }
  }

  void _onUserUpdate(_UserUpdateRequested event, Emitter<UserState> emit) =>
      emit(UserState(user: event.user));

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
