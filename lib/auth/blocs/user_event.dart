part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.userUpdateRequested(User user) = _UserUpdateRequested;
  const factory UserEvent.userFetchRequested() = _UserFetchRequested;
}
