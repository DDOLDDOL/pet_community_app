import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_community_app/post/post.dart';

part 'comment_fetch_state.dart';
part 'comment_fetch_cubit.freezed.dart';

class CommentFetchCubit extends Cubit<CommentFetchState> {
  CommentFetchCubit(this._repository)
      : super(const CommentFetchState.initial());

  final PostRepository _repository;
  late List<CommentDetail> _comments = [];

  // Future<void> fetchComments(int postId) async {
  //   emit(const CommentFetchState.loading());
  //
  //   try {
  //     final comments = await _repository.fetchCommentsByPostId(postId);
  //     emit(CommentFetchState.loaded(comments));
  //   } on Exception catch (error) {
  //     emit(
  //       CommentFetchState.error(
  //         '댓글을 불러올 수 없습니다',
  //         error.toString().split('Exception: ').last,
  //       ),
  //     );
  //   }
  // }

  Future<void> fetchComments({CommentDetail? newComment}) async {
    emit(const CommentFetchState.loading());

    try {
      final comments = await _repository.fetchCommentsByPostId(1);
      _comments = newComment == null ? comments : [..._comments, newComment];
      emit(CommentFetchState.loaded(_comments));
    } on Exception catch (error) {
      emit(
        CommentFetchState.error(
          '댓글을 불러올 수 없습니다',
          error.toString().split('Exception: ').last,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _comments.clear();
    return super.close();
  }
}
