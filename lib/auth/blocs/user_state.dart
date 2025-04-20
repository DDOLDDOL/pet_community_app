part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    User? user,
    String? errorMessage,
  }) = _UserState;

  const UserState._();

  bool get hasError => errorMessage != null;
  bool get isFetching => !hasError && user == null;
  // bool get unknownUser => !hasError && user == User.unknown();
}
