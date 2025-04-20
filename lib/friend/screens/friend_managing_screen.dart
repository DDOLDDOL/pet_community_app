import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/friend/friend.dart';

class FriendManagingScreen extends StatelessWidget {
  const FriendManagingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FollowersFetchCubit(context.read<FriendRepository>())
              ..fetchFollowers();
          },
        ),
        BlocProvider(
          create: (context) {
            return FollowingsFetchCubit(context.read<FriendRepository>())
              ..fetchFollowings();
          },
        ),
      ],
      child: const _FriendManagingView(),
    );
  }
}

class _FriendManagingView extends StatelessWidget {
  const _FriendManagingView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('팔로워 관리'),
          centerTitle: false,
        ),
        body: SafeArea(
          child: Column(
            children: [
              _TabBar(),
              Expanded(child: _TabBarView()),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      // tabAlignment: TabAlignment.start,
      // isScrollable: true,
      indicatorWeight: 2,
      indicatorColor: Color(0xFF050505),
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color(0xFF050505),
        fontFamily: 'Suit',
      ),

      labelPadding: EdgeInsets.symmetric(horizontal: 8),
      tabs: [
        Tab(height: 33, text: '팔로워 99'),
        Tab(height: 33, text: '팔로잉 99'),
      ],
    );
  }
}

class _TabBarView extends StatelessWidget {
  const _TabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        FollowersListView(),
        FollowingsListView(),
      ],
    );
  }
}
