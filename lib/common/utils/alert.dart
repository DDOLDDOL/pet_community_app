import 'package:flutter/material.dart';
import 'package:pet_community_app/common/common.dart';

Future<void> alert(
  BuildContext context, {
  required String title,
  required String subtitle,
  bool isCancelable = false,
  void Function()? onSubmit,
  String? submitButtonText,
  String? cancelButtonText,
}) {
  return showDialog(
    context: context,
    builder: (_) => ThemeAlertDialog(
      title: title,
      subtitle: subtitle,
      isCancelable: isCancelable,
      onSubmit: onSubmit,
      submitButtonText: submitButtonText,
      cancelButtonText: cancelButtonText,
    ),
  );
}
