import 'package:flutter/material.dart';
import 'package:pet_community_app/friend/friend.dart';

class RecommendedListTile extends StatelessWidget {
  const RecommendedListTile({
    super.key,
    required this.recommended,
  });

  final Friend recommended;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              recommended.profileImageUrl,
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            recommended.name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Text(
            recommended.name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF8A8E99),
            ),
          ),
        ],
      ),
    );
  }
}
