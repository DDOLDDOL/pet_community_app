import 'package:flutter/material.dart';
import 'package:pet_community_app/common/common.dart';
import 'package:useful_widgets/useful_widgets.dart';

class EmptyFollowerView extends StatelessWidget {
  const EmptyFollowerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 66),
      child: Center(
        child: IntrinsicWidth(
          child: Column(
            children: [
              const Text(
                '아직 팔로우가 없으신가요?',
                style: TextStyles.textTitle,
              ),
              const Text('팔로우 신청으로 친구들을 만들어보세요', style: TextStyles.textMedium),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SubmitButton(
                  width: 200,
                  height: 36,
                  enabledColor: Palette.themeColor,
                  onPressed: () {},
                  child: Text(
                    '팔로우 추천받기',
                    style: TextStyles.textMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
