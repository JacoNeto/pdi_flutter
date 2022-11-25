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

  Future<void> gammaCorrection(double gamma) async {
    await _imagePreProcessing();
    List<int> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i]);
    }

    var greyScalePixels = Uint8List.fromList(greyScaleList);

    for (int i = 0; i < greyScalePixels.length; i++) {
      resultBefore.addAll(
          ImageUtils.greyScale(GreyScale.gamma(greyScalePixels[i], gamma)));
    }
    result = Uint8List.fromList(resultBefore);
    // print(str);
    await _addImageToGrid();
  }

  Future<void> equ() async {
    await _imagePreProcessing();
    var histogram = Uint32List(256);
    //var normalized = <double>[];
    var probability = Float32List(256);
    var g = Uint32List(256);
    /*await ColorConnect()
        .equalize(_gridController.selectedChildren.toList().elementAt(0)!);*/
    for (int j = 0; j < 256; j++) {
      for (var i = 0; i < decodedBytes1!.length; i += 4) {
        if (decodedBytes1![i] == j) {
          histogram[j]++;
        }
      }
    }
    print(decodedBytes1!.length / 4);

    //normalized = MathUtils.normalizeList(histogram, 0, 255, 0, 1);
    //print(normalized);

    for (int j = 0; j < 256; j++) {
      for (var i = 0; i < decodedBytes1!.length; i += 4) {
        probability[j] = histogram[j] / (image1!.width * image1!.height);
      }
    }
    //print(probability);

    for (int j = 0; j < 256; j++) {
      double cumulate = 0;
      for (int i = 0; i < j; i++) {
        cumulate += probability[i];
      }
      g[j] = (cumulate * 255).round();
    }

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      result![i] = g[decodedBytes1![i]];
      result![i + 1] = g[decodedBytes1![i]];
      result![i + 2] = g[decodedBytes1![i]];
      result![i + 3] = 254;
    }
    // print(str);
    await _addImageToGrid();
  }

  Future<void> loadImage() async {
    await _imagePreProcessing();
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
