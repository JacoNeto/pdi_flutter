import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  // Pick an image from gallery
  static Future<List<XFile>?> getImage() async {
    final ImagePicker picker = ImagePicker();

    var pickedFile = await picker.pickMultiImage();

    return pickedFile;
  }

  /// Verify if an image has the specified dimension given [width] and [height]
  /// If it is not, resize it
  static img.Image resizeImage(img.Image image,
      {required int width, required int height}) {
    if (image.width != width || image.height != height) {
      return img.copyResize(image, width: width, height: height);
    }
    return image;
  }
}
