import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/fetch_request_bloc_builder.dart';
import '../../home/widgets/empty_follower_section.dart';
import '../cubits/post_list_fetch_cubit.dart';
import '../models/post_detail.dart';
import '../widgets/post_card.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return PostListFetchCubit.create(context)..fetchPostListByPetId(0);
      },
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return FetchRequestBlocBuilder<PostListFetchCubit, List<PostDetail>>(
      onLoading: (_) {
        return const Center(child: CircularProgressIndicator());
      },
      onLoaded: (_, postDetails) {
        if (postDetails.isEmpty) return const EmptyFollowerView();

        return ListView(
          physics: const ClampingScrollPhysics(),
          children: postDetails
              .map((postDetail) => PostCard(postDetail: postDetail))
              .toList(),
        );
      },
      onError: (_, message, reason) {
        return Container();
      },
    );
  }
}
