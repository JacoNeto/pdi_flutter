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

  Future<void> addImages() async {
    var list1 = gridController.selectedChildren.toList().elementAt(0)!;
    img.Image? image1 = img.decodeImage(list1);
    final decodedBytes = image1!.getBytes(format: img.Format.rgba);
    var imgArr = <List<List<int>>>[];

    var list2 = gridController.selectedChildren.toList().elementAt(1)!;
    img.Image? image2 = img.decodeImage(list2);
    final decodedBytes2 = image2!.getBytes(format: img.Format.rgba);
    var imgArr2 = <List<List<int>>>[];

    /*for (int i = 0; i < 499; i++) {
      for (int j = 0; j < 499; j++) {
        var pixel = image1!.getPixel(i, j);
        print(ImageUtils.pixelToU8List(pixel).toString());
      }
    }*/
    var result = Uint8List(decodedBytes.length);
    for (int i = 0; i < decodedBytes.length; i++) {
      result[i] = (decodedBytes[i] + decodedBytes2[i]);
    }

    /*for (int i in list1) {
      for (int j in list2) {
        result.add(i + j);
      }
    }
    var list = Uint8List.fromList(result);
    _gridController.addChildToGrid(list);*/
    Completer<Image> c = Completer<Image>();

    decodeImageFromPixels(
        result, image1.width, image2.width, PixelFormat.rgba8888, (image) {
      c.complete(image);
    });

    var imagem = await c.future;
    var bytes = await imagem.toByteData(format: ImageByteFormat.png);

    gridController.addChildToGrid(bytes!.buffer.asUint8List());
  }

  void subImages() {}

  void multImages() {}

  void divImages() {}

  void andImages() {}

  void orImages() {}

  void xorImages() {}
}
