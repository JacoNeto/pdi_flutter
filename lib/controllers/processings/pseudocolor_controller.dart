import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;

import '../../utils/image_utils.dart';
import '../home/grid_controller.dart';

class PseudoColorController extends GetxController {
  final GridController _gridController = Get.find();

  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? result;

  var str = "";

  Future<void> pseudoColor() async {
    await _imagePreProcessing();
    int ctrlGray = 0;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      switch (++ctrlGray) {

        ///RED
        case 1:
          if (decodedBytes1![i] < 70) {
            result![i] = 200;
          } else if (decodedBytes1![i] < 140) {
            result![i] = 0;
          } else {
            result![i] = 0;
          }
          break;

        ///BLUE
        case 2:
          if (decodedBytes1![i] < 70) {
            result![i] = 0;
          } else if (decodedBytes1![i] < 140) {
            result![i] = 200;
          } else {
            result![i] = 0;
          }
          break;

        ///GREEN
        case 3:
          if (decodedBytes1![i] < 70) {
            result![i] = 0;
          } else if (decodedBytes1![i] < 140) {
            result![i] = 0;
          } else {
            result![i] = 200;
          }
          break;

        ///OPACITY
        case 4:
          result![i] = 255;
          ctrlGray = 0;
          break;
        default:
      }
      // str += " ${decodedBytes1![i]}\n";
    }
    // print(str);
    await _addImageToGrid();
  }

  Future<void> realce() async {
    await _imagePreProcessing();

    await _addImageToGrid();
  }

  Future<void> _imagePreProcessing() async {
    list1 = _gridController.selectedChildren.toList().elementAt(0)!;
    image1 = img.decodeImage(list1!);
    image1 = ImageUtils.resizeImage(image1!, width: 220, height: 220);
    decodedBytes1 = image1!.getBytes(format: img.Format.rgba);

    result = Uint8List(decodedBytes1!.length);
  }

  Future<void> _addImageToGrid() async {
    Completer<Image> c = Completer<Image>();

    decodeImageFromPixels(
        result!, image1!.width, image1!.height, PixelFormat.rgba8888, (image) {
      c.complete(image);
    });

    var imagem = await c.future;
    var bytes = await imagem.toByteData(format: ImageByteFormat.png);

    _gridController.addChildToGrid(bytes!.buffer.asUint8List());
  }
}
