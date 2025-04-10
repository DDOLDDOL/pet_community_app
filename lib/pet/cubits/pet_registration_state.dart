part of 'pet_registration_cubit.dart';

@freezed
class PetRegistrationState with _$PetRegistrationState {
  const factory PetRegistrationState.initial() = _Initial;
  const factory PetRegistrationState.loading() = _Loading;
  const factory PetRegistrationState.success() = _Success;
  const factory PetRegistrationState.error(
    String message,
    String reason,
  ) = _Error;
}
