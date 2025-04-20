import 'package:flutter/material.dart';
import 'package:pet_community_app/friend/friend.dart';
import 'package:pet_community_app/pet/pet.dart';

class FriendListTile extends StatelessWidget {
  const FriendListTile({
    super.key,
    required this.friend,
  });

  final PetDetail friend;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        spacing: 12,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              // 'assets/images/fake/fake-profile.png',
              friend.profileImageUrl,
              width: 40,
              height: 40,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                friend.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          FollowStateButton(
            isFollowing: true,
            onTap: () {
              // 언팔로우
            },
          ),
        ],
      ),
    );
  }
}
