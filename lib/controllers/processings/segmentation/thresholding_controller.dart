import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pdi_flutter/utils/convolution_kernel.dart';
import 'package:scidart/numdart.dart';

import '../../../constants/img_default.dart';
import '../../../utils/image_filter_utils/image_filter_utils.dart';
import '../../../utils/image_segmentation_utils/image_segmentation_utils.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/math_utils.dart';
import '../../home/grid_controller.dart';

class ThresholdingController extends GetxController {
  final GridController _gridController = Get.find();

  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? result;

  var str = "";

  Future<void> ridlerCalvard() async {
    await _imagePreProcessing();

    // threshold
    double t = 0;
    // threshold 1
    double t1 = 0;
    // initial value
    double t0 = ImageSegmetationUtils.getImageMean(decodedBytes1!);

    t1 = t0;

    var temp1 = Uint8List.fromList(decodedBytes1!);
    var temp2 = Uint8List.fromList(decodedBytes1!);
    List<int> r1 = [];
    List<int> r2 = [];

    while (t1 != t) {
      t = t1;
      print("t: " + t.toString());
      double m1 = 0;
      double m2 = 0;
      // R1 & R2
      int ctrlRBG = 0; // rgb aux
      int length = decodedBytes1!.length;
      for (var i = 0; i < length; i++) {
        if (++ctrlRBG > 3) {
          ctrlRBG = 0;
        } else {
          if (temp1[i] < t) {
            r1.add(decodedBytes1![i]);
            r2.add(-1);
          } else {
            r2.add(decodedBytes1![i]);
            r1.add(-1);
          }
        }
      }
      m1 = ImageSegmetationUtils.getImageMean(Uint8List.fromList(r1));
      m2 = ImageSegmetationUtils.getImageMean(Uint8List.fromList(r2));
      t1 = (m1 + m2) / 2;
      r1.clear();
      r2.clear();
      print("m1: " + m1.toString());
      print("m2: " + m2.toString());
      // R2
    }
    print("final t: " + t1.toString());
    int ctrlRBG = 0;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (++ctrlRBG > 3) {
        ctrlRBG = 0;
        result![i] = decodedBytes1![i];
      } else {
        if (decodedBytes1![i] < t1) {
          result![i] = 0;
        } else {
          result![i] = 255;
        }
      }
    }
    // print(str);
    await _addImageToGrid();
  }

  Future<void> mean(int regions) async {
    await _imagePreProcessing();
    int regionsAux = pow(4, regions).toInt();
    var matrix =
        ImageUtils.listTo2dList(ImageUtils.toGreyScale(decodedBytes1!));

    var side = (image1!.width / sqrt(regionsAux)).round();

    // image iteration
    for (int i = 0; i < image1!.width; i += side) {
      for (int j = 0; j < image1!.height; j += side) {
        // region init
        var regionPixels = <int>[];
        // region iteration
        for (int k = i; k < i + side; k++) {
          for (int l = j; l < j + side; l++) {
            regionPixels.add(matrix[k][l]);
          }
        }
        // calc mean
        var mean = MathUtils.mean(regionPixels);

        // threshold
        for (int k = i; k < i + side; k++) {
          for (int l = j; l < j + side; l++) {
            if (matrix[k][l] < mean) {
              matrix[k][l] = 0;
            } else {
              matrix[k][l] = 255;
            }
          }
        }
      }
    }

    result = ImageUtils.greyScaleToRgb(
        Uint8List.fromList(ImageUtils.u2dListToList(matrix)));
    await _addImageToGrid();
  }

  Future<void> minimum(int regions) async {
    await _imagePreProcessing();
    int regionsAux = pow(4, regions).toInt();
    var matrix =
        ImageUtils.listTo2dList(ImageUtils.toGreyScale(decodedBytes1!));

    var side = (image1!.width / sqrt(regionsAux)).round();

    // image iteration
    for (int i = 0; i < image1!.width; i += side) {
      for (int j = 0; j < image1!.height; j += side) {
        // region init
        var regionPixels = <int>[];
        // region iteration
        for (int k = i; k < i + side; k++) {
          for (int l = j; l < j + side; l++) {
            regionPixels.add(matrix[k][l]);
          }
        }
        // calc mean
        var minimum = regionPixels.reduce(min);

        // threshold
        for (int k = i; k < i + side; k++) {
          for (int l = j; l < j + side; l++) {
            if (matrix[k][l] <= minimum) {
              matrix[k][l] = 0;
            } else {
              matrix[k][l] = 255;
            }
          }
        }
      }
    }

    result = ImageUtils.greyScaleToRgb(
        Uint8List.fromList(ImageUtils.u2dListToList(matrix)));
    await _addImageToGrid();
  }

  Future<void> maximum(int regions) async {
    await _imagePreProcessing();
    int regionsAux = pow(4, regions).toInt();
    var matrix =
        ImageUtils.listTo2dList(ImageUtils.toGreyScale(decodedBytes1!));

    var side = (image1!.width / sqrt(regionsAux)).round();

    // image iteration
    for (int i = 0; i < image1!.width; i += side) {
      for (int j = 0; j < image1!.height; j += side) {
        // region init
        var regionPixels = <int>[];
        // region iteration
        for (int k = i; k < i + side; k++) {
          for (int l = j; l < j + side; l++) {
            regionPixels.add(matrix[k][l]);
          }
        }
        // calc mean
        var maximum = regionPixels.reduce(max);

        // threshold
        for (int k = i; k < i + side; k++) {
          for (int l = j; l < j + side; l++) {
            if (matrix[k][l] < maximum) {
              matrix[k][l] = 0;
            } else {
              matrix[k][l] = 255;
            }
          }
        }
      }
    }

    result = ImageUtils.greyScaleToRgb(
        Uint8List.fromList(ImageUtils.u2dListToList(matrix)));
    await _addImageToGrid();
  }

  Future<void> maxmin(int regions) async {
    await _imagePreProcessing();
    int regionsAux = pow(4, regions).toInt();
    var matrix =
        ImageUtils.listTo2dList(ImageUtils.toGreyScale(decodedBytes1!));

    var side = (image1!.width / sqrt(regionsAux)).round();

    // image iteration
    for (int i = 0; i < image1!.width; i += side) {
      for (int j = 0; j < image1!.height; j += side) {
        // region init
        var regionPixels = <int>[];
        // region iteration
        for (int k = i; k < i + side; k++) {
          for (int l = j; l < j + side; l++) {
            regionPixels.add(matrix[k][l]);
          }
        }
        // calc mean
        var maxmin = (regionPixels.reduce(max) + regionPixels.reduce(min)) / 2;

        // threshold
        for (int k = i; k < i + side; k++) {
          for (int l = j; l < j + side; l++) {
            if (matrix[k][l] < maxmin) {
              matrix[k][l] = 0;
            } else {
              matrix[k][l] = 255;
            }
          }
        }
      }
    }

    result = ImageUtils.greyScaleToRgb(
        Uint8List.fromList(ImageUtils.u2dListToList(matrix)));
    await _addImageToGrid();
  }

  Future<void> niblack(int regions, double k) async {
    await _imagePreProcessing();
    int regionsAux = pow(4, regions).toInt();
    var matrix =
        ImageUtils.listTo2dList(ImageUtils.toGreyScale(decodedBytes1!));

    var side = (image1!.width / sqrt(regionsAux)).round();

    // image iteration
    for (int i = 0; i < image1!.width; i += side) {
      for (int j = 0; j < image1!.height; j += side) {
        // region init
        var regionPixels = <int>[];
        // region iteration
        for (int k = i; k < i + side; k++) {
          for (int l = j; l < j + side; l++) {
            regionPixels.add(matrix[k][l]);
          }
        }
        // calc mean
        var niblackV = MathUtils.mean(regionPixels) +
            (k * MathUtils.standardDeviation(regionPixels));

        // threshold
        for (int k = i; k < i + side; k++) {
          for (int l = j; l < j + side; l++) {
            if (matrix[k][l] < niblackV) {
              matrix[k][l] = 0;
            } else {
              matrix[k][l] = 255;
            }
          }
        }
      }
    }

    result = ImageUtils.greyScaleToRgb(
        Uint8List.fromList(ImageUtils.u2dListToList(matrix)));
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
