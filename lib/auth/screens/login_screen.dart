import 'package:flutter/material.dart';
import 'package:pet_community_app/auth/auth.dart';
import 'package:pet_community_app/common/common.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/app-login-icon.png',
                  width: MediaQuery.of(context).size.width * 0.32,
                ),
                Text('change', style: TextStyles.accent.copyWith(fontSize: 48)),
                const Text('은밀한 우리들의 일상', style: TextStyles.accent),
                const SizedBox(height: 40),
                ...OAuthPlatform.values
                    .sublist(0, OAuthPlatform.values.length - 1)
                    .map(
                      (platform) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: OAuthButton(
                          platform: platform,
                          onTap: (_) {},
                          loadingWhen: false,
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
