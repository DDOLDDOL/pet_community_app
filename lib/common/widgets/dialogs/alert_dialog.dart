import 'package:flutter/material.dart';
import 'package:useful_widgets/useful_widgets.dart';

class ThemeAlertDialog extends StatelessWidget {
  const ThemeAlertDialog({
    super.key,
    required this.title,
    required this.subtitle,
    this.isCancelable = false,
    this.onSubmit,
    this.submitButtonText,
    this.cancelButtonText,
  });

  final String title;
  final String subtitle;
  final bool isCancelable;
  final void Function()? onSubmit;
  final String? submitButtonText;
  final String? cancelButtonText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Text(title),
          Text(subtitle),
          Row(
            spacing: 12,
            children: [
              if (isCancelable)
                Expanded(child: _CancelButton(buttonText: cancelButtonText)),
              Expanded(
                  child: _SubmitButton(
                      onPressed: onSubmit, buttonText: submitButtonText)),
            ],
          )
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    super.key,
    this.onPressed,
    required this.buttonText,
  });

  final void Function()? onPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return SubmitButton(
      onPressed: onPressed,
      child: Text(buttonText ?? '확인'),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({
    super.key,
    required this.buttonText,
  });

  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
