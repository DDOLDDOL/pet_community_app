import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/friend/friend.dart';
import 'package:pet_community_app/friend/widgets/recommended_list_tile.dart';

class FollowingsListView extends StatelessWidget {
  const FollowingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowingsFetchCubit, FollowingsFetchState>(
      builder: (_, state) {
        return state.maybeWhen(
          orElse: SizedBox.shrink,
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (followings) {
            return ListView(
              children: [
                _RecommendedListView(recommended: followings),
                _FollowingsLoadedListView(followings: followings),
              ],
            );
          },
        );
      },
    );
  }
}

class _RecommendedListView extends StatelessWidget {
  const _RecommendedListView({
    super.key,
    required this.recommended,
  });

  final List<Friend> recommended;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '추천 친구들',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF050505),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                spacing: 12,
                children: recommended.map(
                  (recommended) {
                    return RecommendedListTile(recommended: recommended);
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FollowingsLoadedListView extends StatelessWidget {
  const _FollowingsLoadedListView({
    super.key,
    required this.followings,
  });

  final List<Friend> followings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '내가 팔로잉한 친구들',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF050505),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            spacing: 16,
            children: followings.map(
              (following) {
                return _FollowingsLoadedListTile(following: following);
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class _FollowingsLoadedListTile extends StatefulWidget {
  const _FollowingsLoadedListTile({
    super.key,
    required this.following,
  });

  final Friend following;

  @override
  State<_FollowingsLoadedListTile> createState() =>
      _FollowingsLoadedListTileState();
}

class _FollowingsLoadedListTileState extends State<_FollowingsLoadedListTile> {
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
