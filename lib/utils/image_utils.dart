import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  // Pick an image from gallery
  static Future<List<XFile>?> getImage() async {
    final ImagePicker picker = ImagePicker();

    var pickedFile = await picker.pickMultiImage();

    return pickedFile;
  }

  // Pick an image file
  static Future<FilePickerResult?> getImageFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
        'jpg',
        'gif',
        'tiff',
        'pgm',
        'bitmap'
      ],
    );

    return result;
  }

  static Future<Uint8List?> pgmToRGB(File pgmFile) async {
    Uint8List? result; // RGBA Values List
    var intList = <int>[]; // Auxiliar RGBA Values List (used to converting)

    var fileLines = await pgmFile.readAsLines(); // file lines from pgm file

    var width = int.parse(fileLines[1].split(' ').first); // image height
    var height = int.parse(fileLines[1].split(' ').last); // image height

    // iterates through all the greyscale values lines
    for (int i = 3; i < width + 3; i++) {
      var str = fileLines[i].split(' ');

      // each greyscale value is converted to RGBA.
      // To achieve this just repeat the grey scale
      // in R, G and B. The A is filled with 254.
      for (String numberString in str) {
        int greyValue = int.parse(numberString);
        intList.add(greyValue);
        intList.add(greyValue);
        intList.add(greyValue);
        intList.add(254);
      }
    }

    result = Uint8List.fromList(intList);
    Completer<Image> c = Completer<Image>();
    decodeImageFromPixels(result, width, height, PixelFormat.rgba8888, (image) {
      c.complete(image);
    });
    var future = await c.future;
    var rgb = await future.toByteData(format: ImageByteFormat.png);
    return rgb!.buffer.asUint8List();
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
