import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_community_app/common/common.dart';

class PetImagePicker extends StatelessWidget {
  const PetImagePicker({
    super.key,
    this.onImagePicked,
  });

  final void Function(File)? onImagePicked;

  @override
  Widget build(BuildContext context) {
    return ImageUploader(
      onImagePicked: (image) {
        print('aaaa1: ${image.path}');
        print('aaaa2: ${image.absolute}');
      },
    );
  }
}
