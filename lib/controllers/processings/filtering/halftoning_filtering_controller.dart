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
        resultBefore.addAll(ImageUtils.greyScale(q0));

        // 2
        var q2 = twoDList[i][j + 1] <= 2 ? 0 : 255;
        resultBefore.addAll(ImageUtils.greyScale(q2));
      }
      for (int j = 0; j < imgDefault; j += 2) {
        // 3
        var q3 = twoDList[i + 1][j] <= 3 ? 0 : 255;
        resultBefore.addAll(ImageUtils.greyScale(q3));

        // 1
        var q1 = twoDList[i + 1][j + 1] <= 1 ? 0 : 255;
        resultBefore.addAll(ImageUtils.greyScale(q1));
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
        resultBefore.addAll(ImageUtils.greyScale(q3));

        // 0
        if (j + 1 < imgDefault) {
          var q0 = twoDList[i][j + 1] <= 0 ? 0 : 255;
          resultBefore.addAll(ImageUtils.greyScale(q3));
        }

        // 4
        if (j + 2 < imgDefault) {
          var q4 = twoDList[i + 1][j + 2] <= 4 ? 0 : 255;
          resultBefore.addAll(ImageUtils.greyScale(q4));
        }
      }
      for (int j = 0; j < imgDefault; j += 3) {
        // 5
        var q5 = twoDList[i + 1][j] <= 5 ? 0 : 255;
        resultBefore.addAll(ImageUtils.greyScale(q5));

        // 2
        if (j + 1 < imgDefault) {
          var q2 = twoDList[i + 1][j + 1] <= 2 ? 0 : 255;
          resultBefore.addAll(ImageUtils.greyScale(q2));
        }

        // 1
        if (j + 2 < imgDefault) {
          var q1 = twoDList[i + 1][j + 2] <= 2 ? 0 : 255;
          resultBefore.addAll(ImageUtils.greyScale(q1));
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
        resultBefore.addAll(ImageUtils.greyScale(q6));

        // 8
        if (j + 1 < imgDefault) {
          var q8 = twoDList[i][j + 1] <= 8 ? 0 : 255;
          resultBefore.addAll(ImageUtils.greyScale(q8));
        }

        // 4
        if (j + 2 < imgDefault) {
          var q4 = twoDList[i][j + 2] <= 4 ? 0 : 255;
          resultBefore.addAll(ImageUtils.greyScale(q4));
        }
      }
      for (int j = 0; j < imgDefault; j += 3) {
        // 1
        if (i + 1 < imgDefault) {
          var q1 = twoDList[i + 1][j] <= 1 ? 0 : 255;
          resultBefore.addAll(ImageUtils.greyScale(q1));
        }

        // 0
        if (i + 1 < imgDefault && j + 1 < imgDefault) {
          var q0 = twoDList[i + 1][j + 1] <= 0 ? 0 : 255;
          resultBefore.addAll(ImageUtils.greyScale(q0));
        }

        // 3
        if (i + 1 < imgDefault && j + 2 < imgDefault) {
          var q3 = twoDList[i + 1][j + 2] <= 3 ? 0 : 255;
          resultBefore.addAll(ImageUtils.greyScale(q3));
        }
      }

      for (int j = 0; j < imgDefault; j += 3) {
        // 5
        if (i + 2 < imgDefault) {
          var q5 = twoDList[i + 2][j] <= 5 ? 0 : 255;
          resultBefore.addAll(ImageUtils.greyScale(q5));
        }

        // 2
        if (i + 2 < imgDefault && j + 1 < imgDefault) {
          var q2 = twoDList[i + 2][j + 1] <= 2 ? 0 : 255;
          resultBefore.addAll(ImageUtils.greyScale(q2));
        }

        // 7
        if (i + 2 < imgDefault && j + 2 < imgDefault) {
          var q7 = twoDList[i + 2][j + 2] <= 7 ? 0 : 255;
          resultBefore.addAll(ImageUtils.greyScale(q7));
        }
      }
    }
    // print(str);
    result = Uint8List.fromList(resultBefore);
    await _addImageToGrid();
  }

  // Error Diffusion Dithering Rogers
  Future<void> rogers() async {
    await _imagePreProcessing();

    List<double> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i].toDouble());
    }

    List<List<double>> originalGreyScales2d = [];
    originalGreyScales2d = ImageUtils.listTo2dDoubleList(greyScaleList);

    /*
    <>  3/8
    3/8 2/8
    */
    double error;
    List<List<int>> resultGreyScales = List.generate(
        imgDefault, (i) => List.filled(imgDefault, 0, growable: false),
        growable: false);
    for (int i = 0; i < imgDefault; i++) {
      for (int j = 0; j < imgDefault; j++) {
        if (originalGreyScales2d[i][j] < 128) {
          resultBefore.addAll(ImageUtils.greyScale(0));
          resultGreyScales[i][j] = 0;
        } else {
          resultBefore.addAll(ImageUtils.greyScale(255));
          resultGreyScales[i][j] = 1;
        }

        error = originalGreyScales2d[i][j] - resultGreyScales[i][j] * 255;

        // 3/8
        if (j + 1 < imgDefault) {
          originalGreyScales2d[i][j + 1] =
              originalGreyScales2d[i][j + 1] + ((3 / 8) * error);
        }

        // 3/8
        if (i + 1 < imgDefault) {
          originalGreyScales2d[i + 1][j] =
              originalGreyScales2d[i + 1][j] + ((3 / 8) * error);
        }
        // 2/8
        if (i + 1 < imgDefault && j + 1 < imgDefault) {
          originalGreyScales2d[i + 1][j + 1] =
              originalGreyScales2d[i + 1][j + 1] + ((2 / 8) * error);
        }
      }
    }
    // print(str);
    result = Uint8List.fromList(resultBefore);
    await _addImageToGrid();
  }

  // Error Diffusion Dithering Floyd & Steinberg
  Future<void> floydSteinberg() async {
    await _imagePreProcessing();

    List<double> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i].toDouble());
    }

    List<List<double>> originalGreyScales2d = [];
    originalGreyScales2d = ImageUtils.listTo2dDoubleList(greyScaleList);

    /*
    -     <>    7/16
    3/16  5/16  1/16
    */
    double error;
    List<List<int>> resultGreyScales = List.generate(
        imgDefault, (i) => List.filled(imgDefault, 0, growable: false),
        growable: false);
    for (int i = 0; i < imgDefault; i++) {
      for (int j = 0; j < imgDefault; j++) {
        if (originalGreyScales2d[i][j] < 128) {
          resultBefore.addAll(ImageUtils.greyScale(0));
          resultGreyScales[i][j] = 0;
        } else {
          resultBefore.addAll(ImageUtils.greyScale(255));
          resultGreyScales[i][j] = 1;
        }

        error = originalGreyScales2d[i][j] - resultGreyScales[i][j] * 255;

        // 7/16
        if (j + 1 < imgDefault) {
          originalGreyScales2d[i][j + 1] =
              originalGreyScales2d[i][j + 1] + ((7 / 16) * error);
        }
        // 3/16
        if (i + 1 < imgDefault && j - 1 >= 0) {
          originalGreyScales2d[i + 1][j - 1] =
              originalGreyScales2d[i + 1][j - 1] + ((3 / 16) * error);
        }

        // 5/16
        if (i + 1 < imgDefault) {
          originalGreyScales2d[i + 1][j] =
              originalGreyScales2d[i + 1][j] + ((5 / 16) * error);
        }
        // 1/16
        if (i + 1 < imgDefault && j + 1 < imgDefault) {
          originalGreyScales2d[i + 1][j + 1] =
              originalGreyScales2d[i + 1][j + 1] + ((1 / 16) * error);
        }
      }
    }
    // print(str);
    result = Uint8List.fromList(resultBefore);
    await _addImageToGrid();
  }

  // Error Diffusion Dithering Jarvis, Judice & Ninke
  Future<void> jarvisJudiceNinke() async {
    await _imagePreProcessing();

    List<double> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i].toDouble());
    }

    List<List<double>> originalGreyScales2d = [];
    originalGreyScales2d = ImageUtils.listTo2dDoubleList(greyScaleList);

    /*
    -     -     <>    7/48    5/48
    3/48  5/48  7/48  5/48    3/48
    1/48  3/48  5/48  3/48    1/48
    */
    double error;
    List<List<int>> resultGreyScales = List.generate(
        imgDefault, (i) => List.filled(imgDefault, 0, growable: false),
        growable: false);
    for (int i = 0; i < imgDefault; i++) {
      for (int j = 0; j < imgDefault; j++) {
        if (originalGreyScales2d[i][j] < 128) {
          resultBefore.addAll(ImageUtils.greyScale(0));
          resultGreyScales[i][j] = 0;
        } else {
          resultBefore.addAll(ImageUtils.greyScale(255));
          resultGreyScales[i][j] = 1;
        }

        error = originalGreyScales2d[i][j] - resultGreyScales[i][j] * 255;

        // 7/48
        if (j + 1 < imgDefault) {
          originalGreyScales2d[i][j + 1] =
              originalGreyScales2d[i][j + 1] + ((7 / 48) * error);
        }
        // 5/48
        if (j + 2 < imgDefault) {
          originalGreyScales2d[i][j + 2] =
              originalGreyScales2d[i][j + 2] + ((5 / 48) * error);
        }

        // 3/48
        if (i + 1 < imgDefault && j - 2 >= 0) {
          originalGreyScales2d[i + 1][j - 2] =
              originalGreyScales2d[i + 1][j - 2] + ((3 / 48) * error);
        }
        // 5/48
        if (i + 1 < imgDefault && j - 1 >= 0) {
          originalGreyScales2d[i + 1][j - 1] =
              originalGreyScales2d[i + 1][j - 1] + ((5 / 48) * error);
        }
        // 7/48
        if (i + 1 < imgDefault) {
          originalGreyScales2d[i + 1][j] =
              originalGreyScales2d[i + 1][j] + ((7 / 48) * error);
        }
        // 5/48
        if (i + 1 < imgDefault && j + 1 < imgDefault) {
          originalGreyScales2d[i + 1][j + 1] =
              originalGreyScales2d[i + 1][j + 1] + ((5 / 48) * error);
        }
        // 3/48
        if (i + 1 < imgDefault && j + 2 < imgDefault) {
          originalGreyScales2d[i + 1][j + 2] =
              originalGreyScales2d[i + 1][j + 2] + ((3 / 48) * error);
        }

        // 1/48
        if (i + 2 < imgDefault && j - 2 >= 0) {
          originalGreyScales2d[i + 2][j - 2] =
              originalGreyScales2d[i + 2][j - 2] + ((1 / 48) * error);
        }
        // 3/48
        if (i + 2 < imgDefault && j - 1 >= 0) {
          originalGreyScales2d[i + 2][j - 1] =
              originalGreyScales2d[i + 2][j - 1] + ((3 / 48) * error);
        }
        // 5/48
        if (i + 2 < imgDefault) {
          originalGreyScales2d[i + 2][j] =
              originalGreyScales2d[i + 2][j] + ((5 / 48) * error);
        }
        // 3/48
        if (i + 2 < imgDefault && j + 1 < imgDefault) {
          originalGreyScales2d[i + 2][j + 1] =
              originalGreyScales2d[i + 2][j + 1] + ((3 / 48) * error);
        }
        // 1/48
        if (i + 2 < imgDefault && j + 2 < imgDefault) {
          originalGreyScales2d[i + 2][j + 2] =
              originalGreyScales2d[i + 2][j + 2] + ((1 / 48) * error);
        }
      }
    }
    // print(str);
    result = Uint8List.fromList(resultBefore);
    await _addImageToGrid();
  }

  // Error Diffusion Dithering stucki
  Future<void> stucki() async {
    await _imagePreProcessing();

    List<double> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i].toDouble());
    }

    List<List<double>> originalGreyScales2d = [];
    originalGreyScales2d = ImageUtils.listTo2dDoubleList(greyScaleList);

    /*
    -     -     <>    8/42    4/42
    2/42  4/42  8/42  4/42    2/42
    1/42  2/42  4/42  2/42    1/42
    */
    double error;
    List<List<int>> resultGreyScales = List.generate(
        imgDefault, (i) => List.filled(imgDefault, 0, growable: false),
        growable: false);
    for (int i = 0; i < imgDefault; i++) {
      for (int j = 0; j < imgDefault; j++) {
        if (originalGreyScales2d[i][j] < 128) {
          resultBefore.addAll(ImageUtils.greyScale(0));
          resultGreyScales[i][j] = 0;
        } else {
          resultBefore.addAll(ImageUtils.greyScale(255));
          resultGreyScales[i][j] = 1;
        }

        error = originalGreyScales2d[i][j] - resultGreyScales[i][j] * 255;

        // 8/42
        if (j + 1 < imgDefault) {
          originalGreyScales2d[i][j + 1] =
              originalGreyScales2d[i][j + 1] + ((8 / 42) * error);
        }
        // 4/42
        if (j + 2 < imgDefault) {
          originalGreyScales2d[i][j + 2] =
              originalGreyScales2d[i][j + 2] + ((4 / 42) * error);
        }

        // 2/42
        if (i + 1 < imgDefault && j - 2 >= 0) {
          originalGreyScales2d[i + 1][j - 2] =
              originalGreyScales2d[i + 1][j - 2] + ((2 / 42) * error);
        }
        // 4/42
        if (i + 1 < imgDefault && j - 1 >= 0) {
          originalGreyScales2d[i + 1][j - 1] =
              originalGreyScales2d[i + 1][j - 1] + ((4 / 42) * error);
        }
        // 8/42
        if (i + 1 < imgDefault) {
          originalGreyScales2d[i + 1][j] =
              originalGreyScales2d[i + 1][j] + ((8 / 42) * error);
        }
        // 4/42
        if (i + 1 < imgDefault && j + 1 < imgDefault) {
          originalGreyScales2d[i + 1][j + 1] =
              originalGreyScales2d[i + 1][j + 1] + ((4 / 42) * error);
        }
        // 2/42
        if (i + 1 < imgDefault && j + 2 < imgDefault) {
          originalGreyScales2d[i + 1][j + 2] =
              originalGreyScales2d[i + 1][j + 2] + ((2 / 42) * error);
        }

        // 1/42
        if (i + 2 < imgDefault && j - 2 >= 0) {
          originalGreyScales2d[i + 2][j - 2] =
              originalGreyScales2d[i + 2][j - 2] + ((1 / 42) * error);
        }
        // 2/42
        if (i + 2 < imgDefault && j - 1 >= 0) {
          originalGreyScales2d[i + 2][j - 1] =
              originalGreyScales2d[i + 2][j - 1] + ((2 / 42) * error);
        }
        // 5/42
        if (i + 2 < imgDefault) {
          originalGreyScales2d[i + 2][j] =
              originalGreyScales2d[i + 2][j] + ((5 / 42) * error);
        }
        // 2/42
        if (i + 2 < imgDefault && j + 1 < imgDefault) {
          originalGreyScales2d[i + 2][j + 1] =
              originalGreyScales2d[i + 2][j + 1] + ((2 / 42) * error);
        }
        // 1/42
        if (i + 2 < imgDefault && j + 2 < imgDefault) {
          originalGreyScales2d[i + 2][j + 2] =
              originalGreyScales2d[i + 2][j + 2] + ((1 / 42) * error);
        }
      }
    }
    // print(str);
    result = Uint8List.fromList(resultBefore);
    await _addImageToGrid();
  }

  // Error Diffusion Dithering stucki
  Future<void> stevenson() async {
    await _imagePreProcessing();

    List<double> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i].toDouble());
    }

    List<List<double>> originalGreyScales2d = [];
    originalGreyScales2d = ImageUtils.listTo2dDoubleList(greyScaleList);

    double error;
    List<List<int>> resultGreyScales = List.generate(
        imgDefault, (i) => List.filled(imgDefault, 0, growable: false),
        growable: false);
    for (int i = 0; i < imgDefault; i++) {
      for (int j = 0; j < imgDefault; j++) {
        if (originalGreyScales2d[i][j] < 128) {
          resultBefore.addAll(ImageUtils.greyScale(0));
          resultGreyScales[i][j] = 0;
        } else {
          resultBefore.addAll(ImageUtils.greyScale(255));
          resultGreyScales[i][j] = 1;
        }

        error = originalGreyScales2d[i][j] - resultGreyScales[i][j] * 255;

        // 32/200
        if (j + 2 < imgDefault) {
          originalGreyScales2d[i][j + 2] =
              originalGreyScales2d[i][j + 2] + ((32 / 200) * error);
        }

        // 12/200
        if (i + 1 < imgDefault && j - 3 >= 0) {
          originalGreyScales2d[i + 1][j - 3] =
              originalGreyScales2d[i + 1][j - 3] + ((12 / 200) * error);
        }
        // 26/200
        if (i + 1 < imgDefault && j - 1 >= 0) {
          originalGreyScales2d[i + 1][j - 1] =
              originalGreyScales2d[i + 1][j - 1] + ((26 / 200) * error);
        }
        // 30/200
        if (i + 1 < imgDefault && j + 1 < imgDefault) {
          originalGreyScales2d[i + 1][j + 1] =
              originalGreyScales2d[i + 1][j + 1] + ((30 / 200) * error);
        }
        // 30/200
        if (i + 1 < imgDefault && j + 3 < imgDefault) {
          originalGreyScales2d[i + 1][j + 3] =
              originalGreyScales2d[i + 1][j + 3] + ((16 / 200) * error);
        }

        // 12/200
        if (i + 2 < imgDefault && j - 2 >= 0) {
          originalGreyScales2d[i + 2][j - 2] =
              originalGreyScales2d[i + 2][j - 2] + ((12 / 200) * error);
        }
        // 26/200
        if (i + 2 < imgDefault) {
          originalGreyScales2d[i + 2][j] =
              originalGreyScales2d[i + 2][j] + ((26 / 200) * error);
        }
        // 12/200
        if (i + 2 < imgDefault && j + 2 < imgDefault) {
          originalGreyScales2d[i + 2][j + 2] =
              originalGreyScales2d[i + 2][j + 2] + ((12 / 200) * error);
        }

        // 5/200
        if (i + 1 < imgDefault && j - 3 >= 0) {
          originalGreyScales2d[i + 1][j - 3] =
              originalGreyScales2d[i + 1][j - 3] + ((5 / 200) * error);
        }
        // 12/200
        if (i + 1 < imgDefault && j - 1 >= 0) {
          originalGreyScales2d[i + 1][j - 1] =
              originalGreyScales2d[i + 1][j - 1] + ((12 / 200) * error);
        }
        // 12/200
        if (i + 1 < imgDefault && j + 1 < imgDefault) {
          originalGreyScales2d[i + 1][j + 1] =
              originalGreyScales2d[i + 1][j + 1] + ((12 / 200) * error);
        }
        // 5/200
        if (i + 1 < imgDefault && j + 3 < imgDefault) {
          originalGreyScales2d[i + 1][j + 3] =
              originalGreyScales2d[i + 1][j + 3] + ((5 / 200) * error);
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
