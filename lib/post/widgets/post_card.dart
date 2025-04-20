import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_community_app/common/common.dart';
import 'package:pet_community_app/post/post.dart';
import 'package:provider/provider.dart';
import 'package:useful_widgets/useful_widgets.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.postDetail,
  });

  final PostDetail postDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(postDetail: postDetail),
        const SizedBox(height: 8),
        _Body(postDetail: postDetail),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
    required this.postDetail,
  });

  final PostDetail postDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(bottom: 0),
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(12),
          //   child: CachedNetworkImage(
          //     imageUrl: postDetail.petProfileImageUrl,
          //     width: 24,
          //     height: 24,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/fake/fake-profile.png',
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 4),
          Text(postDetail.petname, style: TextStyles.textSmall),
          const Spacer(),
          const _FollowButton(),
          const SizedBox(width: 12),
          Icon(
            Icons.more_horiz,
            size: 24,
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
    required this.postDetail,
  });

  final PostDetail postDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            // child: CachedNetworkImage(imageUrl: postDetail.imageUrls[0]),
            child: Image.asset(
              'assets/images/fake/fake-pet-model.jpeg',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20).copyWith(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const _CountViewer(
                    iconUrl: 'assets/images/like-icon.png',
                    count: 1123,
                  ),
                  const SizedBox(width: 12),
                  _CountViewer(
                    iconUrl: 'assets/images/comment-icon.png',
                    count: 123,
                    onTap: () {
                      showConstrainedBottomSheet(
                        context: context,
                        showDragHandle: false,
                        expanded: true,
                        maxHeightRate: 0.7,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        isScrollControlled: true,
                        builder: (context) {
                          return Provider.value(
                            value: Scaffold.maybeOf(context),
                            child: CommentListBottomSheet(
                              postId: postDetail.id,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const Spacer(),
                  Image.asset('assets/images/like-icon.png', height: 16),
                ],
              ),
              const SizedBox(height: 12),
              Text(postDetail.content, style: TextStyles.textBig),
            ],
          ),
        ),
      ],
    );
  }
}

class _CountViewer extends StatelessWidget {
  const _CountViewer({
    super.key,
    required this.iconUrl,
    required this.count,
    this.onTap,
  });

  final String iconUrl;
  final int count;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Image.asset(iconUrl, height: 16),
            const SizedBox(width: 4),
            Text(
              NumberFormat('#,###').format(count),
              style: TextStyles.textSmall.copyWith(
                fontWeight: FontWeight.w800,
                // letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FollowButton extends StatelessWidget {
  const _FollowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Palette.themeColor,
        ),
        child: Text(
          '팔로우',
          style: TextStyles.textSmall.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
