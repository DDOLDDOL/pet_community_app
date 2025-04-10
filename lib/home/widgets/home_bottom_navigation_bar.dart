import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(_iconUri(0, 'home'), height: 24),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/bottom-nav-bar-icons/photo-upload.png',
            height: 32,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(_iconUri(2, 'user'), height: 24),
          label: '',
        ),
      ],
    );
  }

  String _iconUri(int index, String iconName) {
    final selectedFlag = index == currentIndex ? 'filled' : 'outlined';
    return 'assets/images/bottom-nav-bar-icons/$iconName-$selectedFlag.png';
  }
}
