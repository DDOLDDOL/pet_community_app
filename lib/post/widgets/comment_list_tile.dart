import 'package:flutter/material.dart';
import 'package:pet_community_app/common/common.dart';
import 'package:pet_community_app/post/post.dart';

class CommentListTile extends StatelessWidget {
  const CommentListTile({
    super.key,
    required this.comment,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.borderRadius,
    this.backgroundColor,
  });

  final CommentDetail comment;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: backgroundColor,
      ),
      child: DefaultTextStyle(
        style: TextStyles.textMedium,
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(
              userProfileImageUrl:
                  'https://s3-alpha-sig.figma.com/img/b87a/16fc/96e5e0fb798690a2f6546e55c79060e4?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=EuKyMfBGHddM9ZEECKXpEp-8Q~-7BtIYVmsPOYEytqCZXFE4cBBvhU29GljBR--Xkt~ONXpca-aVpu8xMlJF-8AbKizJQE1aWUoikLMkgZ~EDAhilwx0~~SM45EwiRc7JpfA6z1lUXG8moewS5ZLypzreHCaHsMhC-LfhJXNWdyqcu3uBHJh-UtUFyDbFc4NEv6iHrXXbhPBRpoiSFMem2H7QggQe4FL5E5rg55hFS~5Y5Si-2MplRFnBtQrYw6mtPz4O8TsxKC539NeIDHeE~scM5LSG7KLfjRfggEstyN4qGqqTc~ymfBALv5fOOwoFymYPwxAUxXFRUdeyP76aQ__',
              username: 'username',
              createdAt: DateTime.now(),
            ),
            Text(comment.text, style: TextStyles.textMedium),
            InkWell(
              onTap: () {},
              child: const Text(
                '답글 달기',
                style: TextStyle(color: Color(0xFF888888)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
    required this.userProfileImageUrl,
    required this.username,
    required this.createdAt,
  });

  final String userProfileImageUrl;
  final String username;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            userProfileImageUrl,
            width: 20,
            height: 20,
          ),
        ),
        const SizedBox(width: 4),
        Text(username, style: TextStyles.textBig),
        const SizedBox(width: 4),
        const Spacer(),
        const SizedBox(width: 4),
        Text(
          '3시간 전',
          style: const TextStyle(color: Color(0xFFC1BCBC)),
        ),
        const SizedBox(width: 4),
        InkWell(
          onTap: () {},
          child: Icon(Icons.more_horiz_outlined),
        )
      ],
    );
  }
}
