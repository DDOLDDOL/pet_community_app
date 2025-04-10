import 'package:flutter/material.dart';
import 'package:pet_community_app/auth/auth.dart';
import 'package:pet_community_app/common/common.dart';
import 'package:useful_widgets/useful_widgets.dart';

class OAuthButton extends StatelessWidget {
  const OAuthButton({
    super.key,
    required this.platform,
    required this.onTap,
    required this.loadingWhen,
  });

  final OAuthPlatform platform;
  final void Function(OAuthPlatform)? onTap;
  final bool loadingWhen;

  @override
  Widget build(BuildContext context) {
    return SubmitButton(
      onPressed: () => onTap?.call(platform),
      enabledColor: _backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Image.asset(
            'assets/images/oauth-button-icons/${_platformToString.toLowerCase()}-icon.png',
            width: 20,
          ),
          Text(
            '$_platformToString로 시작하기',
            style: TextStyles.accent.copyWith(color: _foregroundColor),
          ),
        ],
      ),
    );

    // return GestureDetector(
    //   onTap: () => onTap?.call(platform),
    //   child: Container(
    //     height: 52,
    //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(8),
    //       color: Colors.white,
    //     ),
    //     child: loadingWhen
    //         ? Center(
    //             child: SizedBox(
    //               width: 28,
    //               height: 28,
    //               child: CircularProgressIndicator(
    //                 color: _buttonTextStyle.color,
    //               ),
    //             ),
    //           )
    //         : Row(
    //             mainAxisSize: MainAxisSize.max,
    //             children: [
    //               Image.asset('assets/images/${_platformToString.toLowerCase()}-icon.png', height: 28),
    //               const SizedBox(width: 24),
    //               Text(
    //                 'Sign in with $_platformToString',
    //                 style: _buttonTextStyle,
    //               ),
    //             ],
    //           ),
    //   ),
    // );

    // return GestureDetector(
    //   onTap: () => onTap?.call(platform),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(32),
    //     child: Image.asset(
    //       'assets/images/$_platformToString-logo.png',
    //       width: 60,
    //     ),
    //   ),
    // );
  }

  String get _platformToString {
    return switch (platform) {
      OAuthPlatform.google => 'Google',
      OAuthPlatform.kakao => 'Kakao',
      OAuthPlatform.naver => 'Naver',
      _ => 'Unknown',
      // OAuthPlatform.facebook => 'Facebook',
      // OAuthPlatform.apple => 'Apple',
    };
  }

  Color get _backgroundColor {
    return switch (platform) {
      OAuthPlatform.google => Colors.white,
      OAuthPlatform.kakao => const Color(0xFFFEE500),
      OAuthPlatform.naver => const Color(0xFF03C75A),
      // OAuthPlatform.facebook => 'Facebook',
      // OAuthPlatform.apple => 'Apple',
      _ => Colors.black,
    };
  }

  Color get _foregroundColor {
    return switch (platform) {
      OAuthPlatform.google => Colors.black,
      OAuthPlatform.kakao => const Color(0xFF17181A),
      OAuthPlatform.naver => Colors.white,
      // OAuthPlatform.facebook => 'Facebook',
      // OAuthPlatform.apple => 'Apple',
      _ => Colors.white,
    };
  }
}
