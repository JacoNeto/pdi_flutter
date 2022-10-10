import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pdi_flutter/controllers/home/grid_controller.dart';
import 'package:pdi_flutter/utils/image_utils.dart';

import '../../constants/img_default.dart';

/// this [OperationsController] uses two images selected from
/// [GridController] to make arithmetic and logical operations
/// between them
class OperationsController extends GetxController {
  final GridController _gridController = Get.find();

  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? list2;
  img.Image? image2;
  Uint8List? decodedBytes2;

  Uint8List? result;

  var str = "";

  Future<void> addImages() async {
    await _imagesPreProcessing();
    for (int i = 0; i < decodedBytes1!.length; i++) {
      result![i] = (decodedBytes1![i] + decodedBytes2![i]);
    }
    await _addImageToGrid();
  }

  Future<void> minusImages() async {
    await _imagesPreProcessing();
    int ctrlRBG = 0;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (++ctrlRBG > 3) {
        ctrlRBG = 0;
        result![i] = decodedBytes1![i];
      } else {
        result![i] = (decodedBytes1![i] - decodedBytes2![i]);
      }
    }
    await _addImageToGrid();
  }

  Future<void> multImages() async {
    await _imagesPreProcessing();
    int ctrlRBG = 0;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (++ctrlRBG > 3) {
        ctrlRBG = 0;
        result![i] = decodedBytes1![i];
      } else {
        result![i] = (decodedBytes1![i] * decodedBytes2![i]);
      }
    }
    await _addImageToGrid();
  }

  Future<void> divImages() async {
    await _imagesPreProcessing();
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (decodedBytes2![i] == 0) {
        result![i] = decodedBytes1![i];
      } else {
        result![i] = (decodedBytes1![i] ~/ decodedBytes2![i]);
      }
    }
    await _addImageToGrid();
  }

  Future<void> andImages() async {
    await _imagesPreProcessing();
    for (var i = 0; i < decodedBytes1!.length; i++) {
      result![i] = (decodedBytes1![i] & decodedBytes2![i]);
    }
    await _addImageToGrid();
  }

  Future<void> orImages() async {
    await _imagesPreProcessing();
    for (var i = 0; i < decodedBytes1!.length; i++) {
      result![i] = (decodedBytes1![i] | decodedBytes2![i]);
    }
    await _addImageToGrid();
  }

  Future<void> xorImages() async {
    await _imagesPreProcessing();
    int ctrlRBG = 0;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (++ctrlRBG > 3) {
        ctrlRBG = 0;
        result![i] = decodedBytes1![i];
      } else {
        result![i] = (decodedBytes1![i] ^ decodedBytes2![i]);
      }
    }
    await _addImageToGrid();
  }

  Future<void> _imagesPreProcessing() async {
    list1 = _gridController.selectedChildren.toList().elementAt(0)!;
    image1 = img.decodeImage(list1!);
    image1 =
        ImageUtils.resizeImage(image1!, width: imgDefault, height: imgDefault);
    decodedBytes1 = image1!.getBytes(format: img.Format.rgba);

    list2 = _gridController.selectedChildren.toList().elementAt(1)!;
    image2 = img.decodeImage(list2!);
    image2 =
        ImageUtils.resizeImage(image2!, width: imgDefault, height: imgDefault);
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

    _gridController.addChildToGrid(bytes!.buffer.asUint8List());
  }
}
