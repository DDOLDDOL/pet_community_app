import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/common/cubits/fetch_request_cubit.dart';
import 'package:pet_community_app/pet/pet.dart';

class MyPetListFetchCubit extends FetchRequestCubit<List<PetDetail>> {
  MyPetListFetchCubit(this._repository);

  factory MyPetListFetchCubit.create(BuildContext context) {
    return MyPetListFetchCubit(context.read<PetRepository>());
  }

  factory MyPetListFetchCubit.of(BuildContext context) {
    return context.read<MyPetListFetchCubit?>() ??
        MyPetListFetchCubit.create(context);
  }

  final PetRepository _repository;

  Future<void> fetchMyPetList() {
    return fetch(
      () => _repository.fetchMyPetList(),
      errorMessage: '나의 반려동물 조회에 실패했습니다',
    );
  }
}
