import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_community_app/common/cubits/fetch_request_cubit.dart';
import 'package:pet_community_app/pet/pet.dart';

part 'my_pet_list_fetch_state.dart';
part 'my_pet_list_fetch_cubit.freezed.dart';

class MyPetListFetchCubit extends Cubit<MyPetListFetchState> {
  MyPetListFetchCubit(this._repository)
      : super(const MyPetListFetchState.initial());

  factory MyPetListFetchCubit.create(BuildContext context) {
    return MyPetListFetchCubit(context.read<PetRepository>());
  }

  factory MyPetListFetchCubit.of(BuildContext context) {
    return context.read<MyPetListFetchCubit?>() ??
        MyPetListFetchCubit.create(context);
  }

  final PetRepository _repository;

  Future<void> fetchMyPetList() async {
    emit(const MyPetListFetchState.loading());

    try {
      final pets = await _repository.fetchMyPetList();
      emit(MyPetListFetchState.loaded(pets));
    } on Exception catch (error) {
      emit(
        MyPetListFetchState.error(
          '나의 반려동물 리스트를 불러올 수 없습니다',
          error.toString().split('Exception: ').last,
        ),
      );
    }
  }
}

// class MyPetListFetchCubit extends FetchRequestCubit<List<PetDetail>> {
//   MyPetListFetchCubit(this._repository);
//
//   factory MyPetListFetchCubit.create(BuildContext context) {
//     return MyPetListFetchCubit(context.read<PetRepository>());
//   }
//
//   factory MyPetListFetchCubit.of(BuildContext context) {
//     return context.read<MyPetListFetchCubit?>() ??
//         MyPetListFetchCubit.create(context);
//   }
//
//   final PetRepository _repository;
//
//   Future<void> fetchMyPetList() {
//     return fetch(
//           () => _repository.fetchMyPetList(),
//       errorMessage: '나의 반려동물 조회에 실패했습니다',
//     );
//   }
// }
