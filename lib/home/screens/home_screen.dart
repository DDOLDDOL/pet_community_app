import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/auth/auth.dart';
import 'package:pet_community_app/common/common.dart';
import 'package:pet_community_app/home/home.dart';
import 'package:pet_community_app/pet/widgets/pet_selector.dart';
import 'package:pet_community_app/post/screens/post_upload_screen.dart';
import 'package:pet_community_app/post/views/scrap_view.dart';
import 'package:pet_community_app/setting/screens/screens.dart';

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
          appBar: switch (viewIndex) {
            0 => AppBar(
                leadingWidth: 0,
                titleSpacing: 20,
                title: PetSelector(
                  fontSize: 20,
                  onSelect: (pet) {},
                ),
                centerTitle: false,
                actions: [
                  ThemeIconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/notice-icon.png'),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            3 => AppBar(
                title: const Text('앨범북'),
              ),
            4 => AppBar(
                title: const Text('마이페이지'),
                actions: [
                  ThemeIconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/notice-icon.png'),
                  ),
                  ThemeIconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => SettingScreen(),
                        ),
                      );
                    },
                    icon: Image.asset('assets/images/settings-icon.png'),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            _ => null,
          },
          bottomNavigationBar: HomeBottomNavigationBar(
            currentIndex: viewIndex,
            onTap: (index) {
              if (index != 2) {
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
              3 => const ScrapView(),
              4 => const ProfileView(),
              _ => Container(),
            },
          ),
        );
      },
    );
  }
}
