import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_community_app/pet/pet.dart';

part 'pet_registration_state.dart';
part 'pet_registration_cubit.freezed.dart';

class PetRegistrationCubit extends Cubit<PetRegistrationState> {
  PetRegistrationCubit(this._repository)
      : super(const PetRegistrationState.initial());

  final PetRepository _repository;

  // Future<void> registerPet(
  //   String name,
  //   String introduction,
  // ) async {
  Future<void> registerPet() async {
    emit(const PetRegistrationState.loading());

    //

    await Future.delayed(Duration(seconds: 2));
    emit(const PetRegistrationState.success());
    return;

    //

    try {
      await _repository.registerPet();
      emit(const PetRegistrationState.success());
    } on Exception catch (error) {
      emit(
        PetRegistrationState.error(
          '반려동물 등록에 실패했습니다',
          error.toString().split('Exception: ').last,
        ),
      );
    }
  }
}
