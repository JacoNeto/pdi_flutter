import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pdi_flutter/controllers/home/grid_controller.dart';
import 'package:pdi_flutter/utils/image_utils.dart';

/// this [OperationsController] uses two images selected from
/// [GridController] to make arithmetic and logical operations
/// between them
class OperationsController extends GetxController {
  final GridController gridController = Get.find();

  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? list2;
  img.Image? image2;
  Uint8List? decodedBytes2;

  Uint8List? result;

  Future<void> addImages() async {
    await _imagesPreProcessing();
    for (int i = 0; i < decodedBytes1!.length; i++) {
      result![i] = (decodedBytes1![i] + decodedBytes2![i]);
    }
    await _addImageToGrid();
  }

  void subImages() {}

  void multImages() {}

  void divImages() {}

  void andImages() {}

  void orImages() {}

  void xorImages() {}

  Future<void> _imagesPreProcessing() async {
    list1 = gridController.selectedChildren.toList().elementAt(0)!;
    image1 = img.decodeImage(list1!);
    image1 = ImageUtils.resizeImage(image1!, width: 220, height: 220);
    decodedBytes1 = image1!.getBytes(format: img.Format.rgba);

    list2 = gridController.selectedChildren.toList().elementAt(1)!;
    image2 = img.decodeImage(list2!);
    image2 = ImageUtils.resizeImage(image2!, width: 220, height: 220);
    decodedBytes2 = image2!.getBytes(format: img.Format.rgba);

    result = Uint8List(decodedBytes1!.length);
  }

  Future<void> _addImageToGrid() async {
    Completer<Image> c = Completer<Image>();

    decodeImageFromPixels(
        result!, image1!.width, image2!.width, PixelFormat.rgba8888, (image) {
      c.complete(image);
    });

    var imagem = await c.future;
    var bytes = await imagem.toByteData(format: ImageByteFormat.png);

    gridController.addChildToGrid(bytes!.buffer.asUint8List());
  }
}
