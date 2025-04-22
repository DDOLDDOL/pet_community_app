import 'package:flutter/material.dart';
import 'package:pet_community_app/notice/notice.dart';

class NoticeListTile extends StatelessWidget {
  const NoticeListTile({
    super.key,
    required this.notice,
    this.onTap,
    this.backgroundColor = Colors.transparent,
  });

  final Notice notice;
  final void Function()? onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          spacing: 12,
          children: [
            Image.asset(notice.iconUrl)
          ],
        ),
      ),
    );
  }
}
