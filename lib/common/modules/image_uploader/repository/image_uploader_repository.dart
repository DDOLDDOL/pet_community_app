import 'package:image_picker/image_picker.dart';

class ImageUploaderRepository {
  ImageUploaderRepository() : _imagePicker = ImagePicker();

  final ImagePicker _imagePicker;

  Future<void> pickImage() async {
    final images = _imagePicker.pickMultiImage();
  }
  
  Future<void> takePicture() async {
    final images = _imagePicker.pickImage(source: ImageSource.camera);
  }
}