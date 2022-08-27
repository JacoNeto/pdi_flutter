import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class ImageUtils {
  // Pick an image from gallery
  static Future<List<XFile>?> getImage() async {
    final ImagePicker picker = ImagePicker();

    var pickedFile = await picker.pickMultiImage();

    return pickedFile;
  }

  static Uint8List pixelToU8List(int pixel) {
    Uint32List list = Uint32List.fromList([pixel]);
    return list.buffer.asUint8List();
  }
}
