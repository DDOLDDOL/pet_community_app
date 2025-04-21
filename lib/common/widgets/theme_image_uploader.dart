import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ThemeImageUploader extends StatelessWidget {
  const ThemeImageUploader({
    super.key,
    required this.imageFiles,
    this.onImageCaptured,
  });

  final List<XFile> imageFiles;
  final void Function(XFile)? onImageCaptured;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            spacing: 8,
            children: [
              _UploadButton(onImageCaptured: onImageCaptured?.call ?? (_) {}),
              ...imageFiles.map(
                (imageFile) => _UploadedImageListTile(file: imageFile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UploadButton extends StatelessWidget {
  const _UploadButton({
    super.key,
    required this.onImageCaptured,
  });

  final void Function(XFile) onImageCaptured;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () async {
        final imageFile = await ImagePicker().pickImage(
          source: ImageSource.camera,
        );

        if (imageFile != null) onImageCaptured(imageFile);
      },
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: const Color(0xFFD8DCE5)),
        ),
        child: const Center(
          child: Icon(
            Icons.camera_alt_outlined,
            size: 40,
            color: Color(0xFFD8DCE5),
          ),
        ),
      ),
    );
  }
}

class _UploadedImageListTile extends StatelessWidget {
  const _UploadedImageListTile({
    super.key,
    required this.file,
  });

  final XFile file;

  @override
  Widget build(BuildContext context) {
    // TODO: async 처리 혹은 xfile -> image 올바르게 처리
    return FutureBuilder(
      future: _getImageData(file.readAsBytes()),
      builder: (_, snapshot) {
        if(snapshot.data == null || snapshot.data!.$1 == null) {
          return Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
            borderRadius:   BorderRadius.circular(20),
            ),
            child: const Placeholder(),
          );
        }

        final (imageData, isHorizontal) = snapshot.data!;

        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.memory(
            imageData!,
            width: 140,
            height: 140,
            fit: isHorizontal ? BoxFit.fitHeight : BoxFit.fitWidth,
            errorBuilder: (_, __, ___) => const Placeholder(),
          ),
        );
      },
    );
  }

  Future<(Uint8List?, bool)> _getImageData(Future<Uint8List?> imageData) async {
    final data = await imageData;
    if (data == null) return (null, false);

    final codec = await ui.instantiateImageCodec(data);
    final frame = await codec.getNextFrame();

    return (data, frame.image.width > frame.image.height);
  }
}
