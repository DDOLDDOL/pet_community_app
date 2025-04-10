import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/home/home.dart';
import 'package:pet_community_app/post/screens/post_upload_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeViewIndexCubit(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewIndexCubit, int>(
      builder: (_, viewIndex) {
        return Scaffold(
          bottomNavigationBar: HomeBottomNavigationBar(
            currentIndex: viewIndex,
            onTap: (index) {
              if (index != 1) {
                return context
                    .read<HomeViewIndexCubit>()
                    .updateHomeViewIndex(index);
              }

              // index가 1일 때 View를 바꾸지 않고 포스트 등록 화면으로 이동합니다
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PostUploadScreen()),
              );
            },
          ),
          body: SafeArea(
            child: switch (viewIndex) {
              0 => const HomeView(),
              _ => Container(),
            },
          ),
        );
      },
    );
  }
}
