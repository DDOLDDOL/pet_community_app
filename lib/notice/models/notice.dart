import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice.freezed.dart';

@freezed
class Notice with _$Notice {
  const factory Notice.announcement() = _Announcement;
  const factory Notice.notification() = _Notification;
  const factory Notice.warning() = _Warning;
  const factory Notice.following() = _Following;
}