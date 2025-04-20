import 'package:flutter/material.dart';

class ThemeIconButton extends StatelessWidget {
  const ThemeIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: 24,
          height: 24,
          child: icon,
        ),
      ),
    );
  }
}
