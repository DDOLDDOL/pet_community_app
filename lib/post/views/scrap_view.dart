import 'package:flutter/material.dart';

class ScrapView extends StatelessWidget {
  const ScrapView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1.0,
      ),
      children: List.generate(
        32,
        (_) => Image.asset(
          'assets/images/fake/fake-profile.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
