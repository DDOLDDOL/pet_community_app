import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/common/cubits/cubits.dart';
import 'package:pet_community_app/post/post.dart';

class PostListFetchCubit extends FetchRequestCubit<List<PostDetail>> {
  PostListFetchCubit(this._repository);

  factory PostListFetchCubit.create(BuildContext context) {
    return PostListFetchCubit(context.read<PostRepository>());
  }

  factory PostListFetchCubit.of(BuildContext context) {
    return context.read<PostListFetchCubit?>() ??
        PostListFetchCubit.create(context);
  }

  final PostRepository _repository;

  Future<void> fetchPostListByPetId(int petId) {
    return fetch(
      () => _repository.fetchPostListByPetId(petId),
      errorMessage: '나의 게시물을 불러오는 데 오류가 발생했습니다',
    );
  }
}
