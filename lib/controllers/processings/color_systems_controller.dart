import 'package:get/get.dart';

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:image/image.dart' as img;

import '../../utils/image_utils.dart';
import '../home/grid_controller.dart';

class ColorSystemsController extends GetxController {
  final GridController _gridController = Get.find();

  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? result;

  var str = "";

  Future<void> redImage() async {
    await _imagePreProcessing();
    int ctrlRGB = 0;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (ctrlRGB == 0 || ctrlRGB == 3) {
        result![i] = decodedBytes1![i];
      } else {
        result![i] = 0;
      }
      ctrlRGB++;
      if (ctrlRGB > 3) {
        ctrlRGB = 0;
      }
    }
    await _addImageToGrid();
  }

  Future<void> greenImage() async {
    await _imagePreProcessing();
    int ctrlRGB = 0;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (ctrlRGB == 1 || ctrlRGB == 3) {
        result![i] = decodedBytes1![i];
      } else {
        result![i] = 0;
      }
      ctrlRGB++;
      if (ctrlRGB > 3) {
        ctrlRGB = 0;
      }
    }
    await _addImageToGrid();
  }

  Future<void> blueImage() async {
    await _imagePreProcessing();
    int ctrlRGB = 0;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (ctrlRGB == 2 || ctrlRGB == 3) {
        result![i] = decodedBytes1![i];
      } else {
        result![i] = 0;
      }
      ctrlRGB++;
      if (ctrlRGB > 3) {
        ctrlRGB = 0;
      }
    }
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
