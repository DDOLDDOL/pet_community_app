import 'package:flutter/material.dart';

class DialogForm extends StatelessWidget {
  const DialogForm({super.key, required this.title,});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(20)),
      ],
    );
  }
}
