import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pdi_flutter/utils/convolution_kernel.dart';
import 'package:pdi_flutter/utils/image_filter_utils.dart';
import 'package:pdi_flutter/utils/quarters.dart';

import '../../../constants/img_default.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/math_utils.dart';
import '../../home/grid_controller.dart';

class LowPassFilteringController extends GetxController {
  final GridController _gridController = Get.find();

  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? result;

  var str = "";

  Future<void> average3x3() async {
    await _imagePreProcessing();
    result = ImageFilterUtils.convolute(decodedBytes1!, imgDefault, imgDefault,
        ImageFilterUtils.normalizeKernel(avg3x3Kernel.convolution), 0);
    // print(str);
    await _addImageToGrid();
  }

  Future<void> average5x5() async {
    await _imagePreProcessing();
    result = ImageFilterUtils.convolute(decodedBytes1!, imgDefault, imgDefault,
        ImageFilterUtils.normalizeKernel(avg5x5Kernel.convolution), 0);
    // print(str);
    await _addImageToGrid();
  }

  Future<void> kuwahara() async {
    await _imagePreProcessing();
    double lesserVariance = 0;
    double usedMean = 0;

    int pixelX = 0;
    int pixelY = 0;

    var twoDList = List.generate(
        imgDefault, (i) => List.filled(imgDefault, 0, growable: false),
        growable: false);

    List<int> greyScaleList = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i]);
    }

    var greyScalePixels = Uint8List.fromList(greyScaleList);

    List<int> resultBefore = [];

    int auxTwo = 0;
    for (int i = 0; i < imgDefault; i++) {
      for (int j = 0; j < imgDefault; j++) {
        twoDList[i][j] = greyScalePixels[auxTwo];
        auxTwo++;
      }
    }

    int aux = 0;
    int auxx = 0;
    for (var i = 0; i < greyScalePixels.length; i++) {
      var q1 = Quarters.q1(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var q2 = Quarters.q2(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var q3 = Quarters.q3(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var q4 = Quarters.q4(imgDefault, imgDefault, twoDList, pixelX, pixelY);

      var q1Variance = ImageFilterUtils.quadrantVariancy(q1);
      lesserVariance = q1Variance;
      usedMean = MathUtils.mean(q1);

      var q2Variance = ImageFilterUtils.quadrantVariancy(q2);
      if (q2Variance < lesserVariance) {
        lesserVariance = q2Variance;
        usedMean = MathUtils.mean(q2);
      }

      var q3Variance = ImageFilterUtils.quadrantVariancy(q3);
      if (q3Variance < lesserVariance) {
        lesserVariance = q3Variance;
        usedMean = MathUtils.mean(q3);
      }

      var q4Variance = ImageFilterUtils.quadrantVariancy(q4);
      if (q4Variance < lesserVariance) {
        lesserVariance = q4Variance;
        usedMean = MathUtils.mean(q4);
      }

      resultBefore.add(usedMean.round());
      resultBefore.add(usedMean.round());
      resultBefore.add(usedMean.round());
      resultBefore.add(254);

      aux++;
      if (aux < imgDefault) {
        pixelY++;
      } else {
        if (auxx < imgDefault) {
          pixelX++;
        }

        pixelY = 0;
        aux = 0;
        auxx++;
      }
    }
    // print(str);
    result = Uint8List.fromList(resultBefore);
    await _addImageToGrid();
  }

  Future<void> tomitaTsuji() async {
    await _imagePreProcessing();
    double lesserVariance = 0;
    double usedMean = 0;

    int pixelX = 0;
    int pixelY = 0;

    var twoDList = List.generate(
        imgDefault, (i) => List.filled(imgDefault, 0, growable: false),
        growable: false);

    List<int> greyScaleList = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i]);
    }

    var greyScalePixels = Uint8List.fromList(greyScaleList);

    List<int> resultBefore = [];

    int auxTwo = 0;
    for (int i = 0; i < imgDefault; i++) {
      for (int j = 0; j < imgDefault; j++) {
        twoDList[i][j] = greyScalePixels[auxTwo];
        auxTwo++;
      }
    }

    int aux = 0;
    int auxx = 0;
    for (var i = 0; i < greyScalePixels.length; i++) {
      var q1 = Quarters.q1(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var q2 = Quarters.q2(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var q3 = Quarters.q3(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var q4 = Quarters.q4(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var q5 = Quarters.q5(imgDefault, imgDefault, twoDList, pixelX, pixelY);

      var q1Variance = ImageFilterUtils.quadrantVariancy(q1);
      lesserVariance = q1Variance;
      usedMean = MathUtils.mean(q1);

      var q2Variance = ImageFilterUtils.quadrantVariancy(q2);
      if (q2Variance < lesserVariance) {
        lesserVariance = q2Variance;
        usedMean = MathUtils.mean(q2);
      }

      var q3Variance = ImageFilterUtils.quadrantVariancy(q3);
      if (q3Variance < lesserVariance) {
        lesserVariance = q3Variance;
        usedMean = MathUtils.mean(q3);
      }

      var q4Variance = ImageFilterUtils.quadrantVariancy(q4);
      if (q4Variance < lesserVariance) {
        lesserVariance = q4Variance;
        usedMean = MathUtils.mean(q4);
      }

      var q5Variance = ImageFilterUtils.quadrantVariancy(q4);
      if (q5Variance < lesserVariance) {
        lesserVariance = q5Variance;
        usedMean = MathUtils.mean(q5);
      }

      resultBefore.add(usedMean.round());
      resultBefore.add(usedMean.round());
      resultBefore.add(usedMean.round());
      resultBefore.add(254);

      aux++;
      if (aux < imgDefault) {
        pixelY++;
      } else {
        if (auxx < imgDefault) {
          pixelX++;
        }

        pixelY = 0;
        aux = 0;
        auxx++;
      }
    }
    // print(str);
    result = Uint8List.fromList(resultBefore);
    await _addImageToGrid();
  }

  Future<void> realce() async {
    await _imagePreProcessing();
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
