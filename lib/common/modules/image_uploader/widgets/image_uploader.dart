import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_community_app/common/common.dart';

class ImageUploader extends StatefulWidget {
  const ImageUploader({
    super.key,
    this.onImagePicked,
    this.imageUploadLimit = 3,
  });

  // const ImageUploader.builder({
  //   super.key,
  //   this.onImagePicked,
  // });

  final void Function(File)? onImagePicked;
  // final Widget Function(BuildContext) builder;
  final int imageUploadLimit;

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final imageXFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (imageXFile == null) return;

        final imageFile = File(imageXFile.path);
        widget.onImagePicked?.call(imageFile);
        setState(() => _pickedImage = imageFile);
      },
      child: SizedBox(
        width: 90,
        height: 90,
        child: Stack(
          children: [
            _pickedImage == null
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey.shade400,
                        size: 32,
                      ),
                    ),
                  )
                : Image.file(_pickedImage!),
            Positioned(
              bottom: 0,
              right: 0,
              child: _floaingIconBadge(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _floaingIconBadge() {
    return Container(
      width: 25,
      height: 25,
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.5),
          color: Palette.themeColor,
        ),
        child: const Center(
          child: Icon(
            Icons.add_outlined,
            size: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
