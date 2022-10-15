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

  // ordered dithering 2 x 3
  Future<void> ordered2x3() async {
    await _imagePreProcessing();

    List<int> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i]);
    }

    var greyScalePixels = Uint8List.fromList(greyScaleList);
    var normalizedGreyScalePixels =
        MathUtils.normalizeList(greyScalePixels, 0, 255, 0, 6);

    List<List<double>> twoDList = [];
    twoDList = ImageUtils.listTo2dDoubleList(normalizedGreyScalePixels);

    /*
    3 0 4
    5 2 1
    */
    for (int i = 0; i < imgDefault; i += 2) {
      for (int j = 0; j < imgDefault; j += 3) {
        // 3
        var q3 = twoDList[i][j] <= 3 ? 0 : 255;
        resultBefore.add(q3);
        resultBefore.add(q3);
        resultBefore.add(q3);
        resultBefore.add(254);

        // 0
        if (j + 1 < imgDefault) {
          var q0 = twoDList[i][j + 1] <= 0 ? 0 : 255;
          resultBefore.add(q0);
          resultBefore.add(q0);
          resultBefore.add(q0);
          resultBefore.add(254);
        }

        // 4
        if (j + 2 < imgDefault) {
          var q4 = twoDList[i + 1][j + 2] <= 4 ? 0 : 255;
          resultBefore.add(q4);
          resultBefore.add(q4);
          resultBefore.add(q4);
          resultBefore.add(254);
        }
      }
      for (int j = 0; j < imgDefault; j += 3) {
        // 5
        var q5 = twoDList[i + 1][j] <= 5 ? 0 : 255;
        resultBefore.add(q5);
        resultBefore.add(q5);
        resultBefore.add(q5);
        resultBefore.add(254);

        // 2
        if (j + 1 < imgDefault) {
          var q2 = twoDList[i + 1][j + 1] <= 2 ? 0 : 255;
          resultBefore.add(q2);
          resultBefore.add(q2);
          resultBefore.add(q2);
          resultBefore.add(254);
        }

        // 1
        if (j + 2 < imgDefault) {
          var q1 = twoDList[i + 1][j + 2] <= 2 ? 0 : 255;
          resultBefore.add(q1);
          resultBefore.add(q1);
          resultBefore.add(q1);
          resultBefore.add(254);
        }
      }
    }
    // print(str);
    result = Uint8List.fromList(resultBefore);
    await _addImageToGrid();
  }

  // ordered dithering 3 x 3
  Future<void> ordered3x3() async {
    await _imagePreProcessing();

    List<int> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i]);
    }

    var greyScalePixels = Uint8List.fromList(greyScaleList);
    var normalizedGreyScalePixels =
        MathUtils.normalizeList(greyScalePixels, 0, 255, 0, 9);

    List<List<double>> twoDList = [];
    twoDList = ImageUtils.listTo2dDoubleList(normalizedGreyScalePixels);

    /*
    6 8 4
    1 0 3
    5 2 7
    */
    for (int i = 0; i < imgDefault; i += 3) {
      for (int j = 0; j < imgDefault; j += 3) {
        // 6
        var q6 = twoDList[i][j] <= 6 ? 0 : 255;
        resultBefore.add(q6);
        resultBefore.add(q6);
        resultBefore.add(q6);
        resultBefore.add(254);

        // 8
        if (j + 1 < imgDefault) {
          var q8 = twoDList[i][j + 1] <= 8 ? 0 : 255;
          resultBefore.add(q8);
          resultBefore.add(q8);
          resultBefore.add(q8);
          resultBefore.add(254);
        }

        // 4
        if (j + 2 < imgDefault) {
          var q4 = twoDList[i][j + 2] <= 4 ? 0 : 255;
          resultBefore.add(q4);
          resultBefore.add(q4);
          resultBefore.add(q4);
          resultBefore.add(254);
        }
      }
      for (int j = 0; j < imgDefault; j += 3) {
        // 1
        if (i + 1 < imgDefault) {
          var q1 = twoDList[i + 1][j] <= 1 ? 0 : 255;
          resultBefore.add(q1);
          resultBefore.add(q1);
          resultBefore.add(q1);
          resultBefore.add(254);
        }

        // 0
        if (i + 1 < imgDefault && j + 1 < imgDefault) {
          var q0 = twoDList[i + 1][j + 1] <= 0 ? 0 : 255;
          resultBefore.add(q0);
          resultBefore.add(q0);
          resultBefore.add(q0);
          resultBefore.add(254);
        }

        // 3
        if (i + 1 < imgDefault && j + 2 < imgDefault) {
          var q3 = twoDList[i + 1][j + 2] <= 3 ? 0 : 255;
          resultBefore.add(q3);
          resultBefore.add(q3);
          resultBefore.add(q3);
          resultBefore.add(254);
        }
      }

      for (int j = 0; j < imgDefault; j += 3) {
        // 5
        if (i + 2 < imgDefault) {
          var q5 = twoDList[i + 2][j] <= 5 ? 0 : 255;
          resultBefore.add(q5);
          resultBefore.add(q5);
          resultBefore.add(q5);
          resultBefore.add(254);
        }

        // 2
        if (i + 2 < imgDefault && j + 1 < imgDefault) {
          var q2 = twoDList[i + 2][j + 1] <= 2 ? 0 : 255;
          resultBefore.add(q2);
          resultBefore.add(q2);
          resultBefore.add(q2);
          resultBefore.add(254);
        }

        // 7
        if (i + 2 < imgDefault && j + 2 < imgDefault) {
          var q7 = twoDList[i + 2][j + 2] <= 7 ? 0 : 255;
          resultBefore.add(q7);
          resultBefore.add(q7);
          resultBefore.add(q7);
          resultBefore.add(254);
        }
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
