import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/common/common.dart';
import 'package:pet_community_app/post/cubits/comment_fetch_cubit.dart';
import 'package:pet_community_app/post/post.dart';
import 'package:useful_widgets/useful_widgets.dart';

class CommentListBottomSheet extends StatelessWidget {
  const CommentListBottomSheet({
    super.key,
    required this.postId,
  });

  final int postId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentFetchCubit(context.read<PostRepository>())
        ..fetchComments(postId),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Header(),
          Expanded(
            child: BlocConsumer<CommentFetchCubit, CommentFetchState>(
              listener: (context, state) {},
              builder: (_, state) {
                return state.maybeWhen(
                  orElse: SizedBox.shrink,
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  loaded: (comments) {
                    return ListView(
                      children: comments
                          .map((comment) => CommentListTile(comment: comment))
                          .toList(),
                    );
                  },
                );
              },
            ),
          ),
          Padding(padding: EdgeInsets.all(20), child: _InputField()),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 48,
      child: Row(
        children: [
          const Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.keyboard_arrow_left_outlined),
            ),
          ),
          Text('댓글', style: TextStyles.accent),
          const Spacer(),
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextInputField(
      enabledBorderSide: const BorderSide(color: Colors.transparent),
      focusedBorderSide: BorderSide(color: Colors.grey.shade600, width: 2),
      backgroundColor: Colors.grey.shade100,
      borderRadiusValue: 12,
      contentPadding: const EdgeInsets.all(16),
      textStyle: TextStyles.textBig.copyWith(
        fontFamily: 'SUIT',
        color: Colors.black,
      ),
      hintText: '댓글을 입력해주세요',
      hintStyle: TextStyles.textBig.copyWith(
        fontFamily: 'SUIT',
        color: Colors.grey.shade400,
      ),
    );
  }
}
