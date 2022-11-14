import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pdi_flutter/utils/convolution_kernel.dart';
import 'package:pdi_flutter/utils/enhancement_utils.dart/grey_scale.dart';
import 'package:pdi_flutter/utils/math_utils.dart';

import '../../../constants/img_default.dart';
import '../../../utils/image_filter_utils/image_filter_utils.dart';
import '../../../utils/image_utils.dart';
import '../../home/grid_controller.dart';

class GeneralTransformationsController extends GetxController {
  final GridController _gridController = Get.find();

  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? result;

  var str = "";

  List<int> bitSlicingPlanes = [
    binToInt("00000001"),
    binToInt("00000010"),
    binToInt("00000100"),
    binToInt("00001000"),
    binToInt("00010000"),
    binToInt("00100000"),
    binToInt("01000000"),
    binToInt("10000000")
  ];
  Future<void> bitsSlicing() async {
    await _imagePreProcessing();
    int ctrlRBG = 0;
    for (int j = 0; j < bitSlicingPlanes.length; j++) {
      for (var i = 0; i < decodedBytes1!.length; i++) {
        if (++ctrlRBG > 3) {
          ctrlRBG = 0;
          result![i] = decodedBytes1![i];
        } else {
          if (decodedBytes1![i] & bitSlicingPlanes[j] == 0) {
            result![i] = 255;
          } else {
            result![i] = 0;
          }
        }
      }
      // print(str);
      await _addImageToGrid();
    }
  }

  Future<void> _imagePreProcessing() async {
    list1 = _gridController.selectedChildren.toList().elementAt(0)!;
    image1 = img.decodeImage(list1!);
    image1 =
        ImageUtils.resizeImage(image1!, width: imgDefault, height: imgDefault);
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
