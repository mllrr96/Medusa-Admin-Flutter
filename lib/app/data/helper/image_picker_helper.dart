import 'dart:io';
import 'dart:math';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medusa_admin/core/utils/extension.dart';
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
    String imagePath = '${appDocDir.path}/${random.nextIntOfDigits(2)}.jpg';

    XFile? pickedImage = await _picker.pickImage(imageQuality: 20, source: source);
    if (pickedImage == null) {
      return null;
    }
    await pickedImage.saveTo(imagePath);

    CroppedFile? croppedFile = await _imageCropper.cropImage(
        sourcePath: imagePath,
        cropStyle: cropStyle ?? CropStyle.rectangle,
        aspectRatio: cropAspectRatio ?? const CropAspectRatio(ratioX: 3, ratioY: 4));

    if (croppedFile == null) {
      return null;
    }
    await File(imagePath).delete();
    return File(croppedFile.path);
  }
}
