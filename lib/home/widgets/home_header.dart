import 'package:flutter/material.dart';
import 'package:pet_community_app/common/common.dart';
import 'package:pet_community_app/pet/pet.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              PetSelector(
                onSelected: (pet) {},
              ),
              const Spacer(),
              Image.asset('assets/images/notice.png', height: 24),
            ],
          ),
        ),
        DefaultTabController(
          length: 3,
          child: TabBar(
            dividerHeight: 1,
            dividerColor: Palette.gray300,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.symmetric(horizontal: 20),
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelStyle: TextStyles.textMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF050505),
            ),
            unselectedLabelStyle: TextStyles.textMedium.copyWith(
              color: const Color(0xFF8E95A3),
            ),
            indicatorWeight: 2,
            indicatorColor: const Color(0xFF050505),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                height: 32,
                text: '강아지',
              ),
              Tab(
                height: 32,
                text: '고양이',
              ),
              Tab(
                height: 32,
                text: '쇼핑몰',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ extends StatelessWidget {
  const _({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
