import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/friend/friend.dart';

class FollowersListView extends StatelessWidget {
  const FollowersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowersFetchCubit, FollowersFetchState>(
      builder: (_, state) {
        return state.maybeWhen(
          orElse: SizedBox.shrink,
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (followers) {
            return _FollowersLoadedListView(followers: followers);
          },
        );
      },
    );
  }
}

class _FollowersLoadedListView extends StatelessWidget {
  const _FollowersLoadedListView({
    super.key,
    required this.followers,
  });

  final List<Friend> followers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '내 팔로워',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF050505),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              spacing: 16,
              children: followers
                  .map(
                      (following) => _FollowersLoadedListTile(following: following))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _FollowersLoadedListTile extends StatefulWidget {
  const _FollowersLoadedListTile({
    super.key,
    required this.following,
  });

  final Friend following;

  @override
  State<_FollowersLoadedListTile> createState() =>
      _FollowersLoadedListTileState();
}

class _FollowersLoadedListTileState extends State<_FollowersLoadedListTile> {
  late bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              // 'assets/images/fake/fake-profile.png',
              widget.following.profileImageUrl,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.following.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          FollowStateButton(
            isFollowing: _isFollowing,
            onTap: () {
              // 언팔로우
              setState(() => _isFollowing = !_isFollowing);
            },
          ),
          if (!_isFollowing)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: FollowStateButton(
                onTap: () {
                  // 삭제
                },
                buttonText: '삭제',
              ),
            ),
        ],
      ),
    );
  }
}
