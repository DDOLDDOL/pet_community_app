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
              // PetSelector(
              //   onSelected: (pet) {},
              // ),
              const Spacer(),
              Image.asset('assets/images/notice-icon.png', height: 24),
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
