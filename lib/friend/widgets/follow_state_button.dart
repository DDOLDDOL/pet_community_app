import 'package:flutter/material.dart';
import 'package:pet_community_app/common/common.dart';

class FollowStateButton extends StatelessWidget {
  const FollowStateButton({
    super.key,
    this.isFollowing,
    this.buttonText,
    this.onTap,
  });

  final bool? isFollowing; // 내가 팔로우하고 있는지 여부
  final String? buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: _backgroundColor,
        ),
        child: Text(
          buttonText ?? (isFollowing ?? false ? '팔로잉' : '팔로우'),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: _foregroundColor,
          ),
        ),
      ),
    );
  }

  Color get _backgroundColor {
    return isFollowing ?? true ? const Color(0xFFEAEAEA) : Palette.themeColor;
  }

  Color get _foregroundColor {
    if (isFollowing == null) return const Color(0xFF17181A);
    return isFollowing! ? const Color(0xFF9C9FAC) : Colors.white;
  }
}
