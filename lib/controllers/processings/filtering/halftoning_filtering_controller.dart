import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pdi_flutter/utils/convolution_kernel.dart';
import 'package:pdi_flutter/utils/math_utils.dart';

import '../../../constants/img_default.dart';
import '../../../utils/image_filter_utils/image_filter_utils.dart';
import '../../../utils/image_utils.dart';
import '../../home/grid_controller.dart';

class HalftoningFilteringController extends GetxController {
  final GridController _gridController = Get.find();

  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? result;

  var str = "";

  // ordered dithering 2 x 2
  Future<void> ordered2x2() async {
    await _imagePreProcessing();

    List<int> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i]);
    }

    var greyScalePixels = Uint8List.fromList(greyScaleList);
    var normalizedGreyScalePixels =
        MathUtils.normalizeList(greyScalePixels, 0, 255, 0, 3);

    List<List<double>> twoDList = [];
    twoDList = ImageUtils.listTo2dDoubleList(normalizedGreyScalePixels);

    /*
    0 2
    3 1
    */
    for (int i = 0; i < imgDefault; i += 2) {
      for (int j = 0; j < imgDefault; j += 2) {
        // 0
        var q0 = twoDList[i][j] <= 0 ? 0 : 255;
        resultBefore.add(q0);
        resultBefore.add(q0);
        resultBefore.add(q0);
        resultBefore.add(254);

        // 2
        var q2 = twoDList[i][j + 1] <= 2 ? 0 : 255;
        resultBefore.add(q2);
        resultBefore.add(q2);
        resultBefore.add(q2);
        resultBefore.add(254);
      }
      for (int j = 0; j < imgDefault; j += 2) {
        // 3
        var q3 = twoDList[i + 1][j] <= 3 ? 0 : 255;
        resultBefore.add(q3);
        resultBefore.add(q3);
        resultBefore.add(q3);
        resultBefore.add(254);

        // 1
        var q1 = twoDList[i + 1][j + 1] <= 1 ? 0 : 255;
        resultBefore.add(q1);
        resultBefore.add(q1);
        resultBefore.add(q1);
        resultBefore.add(254);
      }
    }
    // print(str);
    result = Uint8List.fromList(resultBefore);
    await _addImageToGrid();
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
