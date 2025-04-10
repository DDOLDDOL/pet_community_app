import 'package:flutter/material.dart';
import 'package:pet_community_app/auth/auth.dart';
import 'package:pet_community_app/common/common.dart';
import 'package:useful_widgets/useful_widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late int _pageIndex;

  @override
  void initState() {
    super.initState();
    _pageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    _welcomeText,
                    style: TextStyles.h1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SubmitButton(
                onPressed: () {
                  if (_pageIndex < 3) return setState(() => _pageIndex++);

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                enabledColor: Palette.themeColor,
                child: Text(_buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get _welcomeText {
    return switch (_pageIndex) {
      0 => '체인지에 오신 걸 환영합니다',
      1 => '당신은 이제 반려동물의 세계관에 빠져들거에요',
      2 => '다양한 동물 친구들을 만날 수 있어요',
      3 => '사람으로 의심받지 않도록 주의하세요!',
      _ => '',
    };
  }

  String get _buttonText {
    return switch (_pageIndex) {
      3 => '입장하기',
      _ => '다음',
    };
  }
}
