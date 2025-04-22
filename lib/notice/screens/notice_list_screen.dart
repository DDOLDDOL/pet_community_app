import 'package:flutter/material.dart';
import 'package:pet_community_app/notice/notice.dart';

class NoticeListScreen extends StatelessWidget {
  const NoticeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('알림'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Notice.following(),
            Notice.following(),
            Notice.announcement(),
            Notice.announcement(),
            Notice.warning(),
          ].map((notice) => NoticeListTile(notice: notice)).toList(),
        ),
      ),
    );
  }
}
