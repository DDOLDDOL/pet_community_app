import 'package:flutter/material.dart';

class CommentMenuBottomSheet extends StatelessWidget {
  const CommentMenuBottomSheet({
    super.key,
    required this.commentId,
  });

  final int commentId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            '댓글 관리',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        _MenuListTile(
          iconUri: 'assets/images/edit-icon.png',
          label: '수정',
          onTap: () {},
        ),
        _MenuListTile(
          iconUri: 'assets/images/delete-icon.png',
          label: '댓글 삭제',
          foregroundColor: const Color(0xFFE12323),
          onTap: () {},
        ),
      ],
    );
  }
}

class _MenuListTile extends StatelessWidget {
  const _MenuListTile({
    super.key,
    required this.iconUri,
    required this.label,
    this.foregroundColor = Colors.black,
    this.onTap,
  });

  final String iconUri;
  final String label;
  final Color foregroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        spacing: 12,
        children: [
          Image.asset(iconUri),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)
                .copyWith(color: foregroundColor),
          ),
        ],
      ),
    );
  }
}
