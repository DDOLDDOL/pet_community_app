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
        padding: const EdgeInsets.all(20),
        color: _backgroundColor,
        child: Row(
          spacing: 12,
          children: [
            Image.asset(_iconUrl),
            Expanded(
              child: Text('초롱이님이 콩님을 팔로우 했어요'),
            ),
            notice.maybeWhen(
              orElse: () => ClipRRect(
                borderRadius: BorderRadius.circular(6.4),
                child: Image.network(
                  'https://s3-alpha-sig.figma.com/img/2d11/02a3/a9d11b028beb92303cf9f243099d6e4e?Expires=1746403200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Y0Tk4WguSfpTFsQ1JlTnMwQjiYEqz2iAeuINkcR5OQtQjCxagfkXofFLOmxr-JHV6WIO2IuBZv~zgM8rn-Z~H43GMPiSSTzJowFNHbEmBSg45yrp1jjGYzx0QcJ3Yfc7Jr0Jo6ucuCMEd1UUb8x2iRfOO8ekrVFyIUOeDlBW1K~iBWJKcac27sBjePmy344Oe~Rpx0-Q3uUPZO85TMtOcRJED2XkVTvR6V-OuBFrlQGTxgsHK2YKtf0DX3craWR43ilvwtRQB2U0gu~blVAcNoNLQYzOC2-y8emTlBrUuPSYxUaTpbHCzQIfUwY3PwTJ-myyxS9s8rilyY1LkBxTLQ__',
                  width: 32,
                  height: 32,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _iconUrl {
    final iconString = notice.maybeWhen(
      orElse: () => 'letter',
      warning: () => 'warning',
      following: () => 'heart',
    );

    return 'assets/images/$iconString-icon.png';
  }

  Color get _backgroundColor {
    return notice.maybeWhen(
      orElse: () => Colors.transparent,
      warning: () => const Color(0xFFF5F8FF),
    );
  }
}
