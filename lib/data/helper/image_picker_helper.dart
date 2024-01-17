import 'dart:io';
import 'dart:math';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medusa_admin/core/extension/random_extension.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImagePickerHelper {
  final _picker = ImagePicker();
  final _imageCropper = ImageCropper();
  final uuid = const Uuid();

  Future<File?> imagePicker(
      {required ImageSource source, CropStyle? cropStyle, CropAspectRatio? cropAspectRatio}) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final random = Random();
    String imagePath = '${appDocDir.path}/${random.nextIntOfDigits(2)}';

    XFile? pickedImage = await _picker.pickImage(imageQuality: 20, source: source);
    if (pickedImage == null) {
      return null;
    }
    await pickedImage.saveTo(imagePath);

    CroppedFile? croppedFile = await _imageCropper.cropImage(
        sourcePath: imagePath, cropStyle: cropStyle ?? CropStyle.rectangle, aspectRatio: cropAspectRatio);

    if (croppedFile == null) {
      return null;
    }
    await File(imagePath).delete();

    return File(croppedFile.path).rename(croppedFile.path.replaceAll('image_cropper_', ''));
  }

  Future<List<File>> multipleImagePicker({CropStyle? cropStyle, CropAspectRatio? cropAspectRatio}) async {
    List<XFile>? pickedImage = await _picker.pickMultiImage(imageQuality: 20);

    if (pickedImage.isEmpty) {
      return [];
    }
    List<File> images = [];

    for (var element in pickedImage) {
      images.add(File(element.path).renameSync(element.path.replaceAll('image_picker_', '')));
    }
    return images;
  }

  Future<File?> cropImage(File image, {CropStyle? cropStyle, CropAspectRatio? cropAspectRatio}) async {
    CroppedFile? croppedFile = await _imageCropper.cropImage(
        sourcePath: image.path, cropStyle: cropStyle ?? CropStyle.rectangle, aspectRatio: cropAspectRatio);

    if (croppedFile == null) {
      return null;
    }
    return File(croppedFile.path).renameSync(croppedFile.path.replaceAll('image_cropper_', ''));
  }
}
