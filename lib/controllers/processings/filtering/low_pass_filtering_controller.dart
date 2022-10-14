import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pdi_flutter/utils/convolution_kernel.dart';

import '../../../constants/img_default.dart';
import '../../../utils/image_filter_utils/image_filter_utils.dart';
import '../../../utils/image_filter_utils/quarters.dart';
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

  Future<void> nagaoMatsuyama() async {
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
      var q5 =
          Quarters.q5(imgDefault, imgDefault, twoDList, pixelX, pixelY); // n1
      var n2 = Quarters.n2(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var n3 = Quarters.n3(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var n4 = Quarters.n4(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var n5 = Quarters.n5(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var n6 = Quarters.n6(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var n7 = Quarters.n7(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var n8 = Quarters.n8(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var n9 = Quarters.n9(imgDefault, imgDefault, twoDList, pixelX, pixelY);

      var q5Variance = ImageFilterUtils.quadrantVariancy(q5);
      lesserVariance = q5Variance;
      usedMean = MathUtils.mean(q5);

      var n2Variance = ImageFilterUtils.quadrantVariancy(n2);
      if (n2Variance < lesserVariance) {
        lesserVariance = n2Variance;
        usedMean = MathUtils.mean(n2);
      }

      var n3Variance = ImageFilterUtils.quadrantVariancy(n3);
      if (n3Variance < lesserVariance) {
        lesserVariance = n3Variance;
        usedMean = MathUtils.mean(n3);
      }

      var n4Variance = ImageFilterUtils.quadrantVariancy(n4);
      if (n4Variance < lesserVariance) {
        lesserVariance = n4Variance;
        usedMean = MathUtils.mean(n4);
      }

      var n5Variance = ImageFilterUtils.quadrantVariancy(n5);
      if (n5Variance < lesserVariance) {
        lesserVariance = n5Variance;
        usedMean = MathUtils.mean(n5);
      }

      var n6Variance = ImageFilterUtils.quadrantVariancy(n6);
      if (n6Variance < lesserVariance) {
        lesserVariance = n6Variance;
        usedMean = MathUtils.mean(n6);
      }

      var n7Variance = ImageFilterUtils.quadrantVariancy(n7);
      if (n7Variance < lesserVariance) {
        lesserVariance = n7Variance;
        usedMean = MathUtils.mean(n7);
      }

      var n8Variance = ImageFilterUtils.quadrantVariancy(n8);
      if (n8Variance < lesserVariance) {
        lesserVariance = n8Variance;
        usedMean = MathUtils.mean(n8);
      }

      var n9Variance = ImageFilterUtils.quadrantVariancy(n9);
      if (n9Variance < lesserVariance) {
        lesserVariance = n9Variance;
        usedMean = MathUtils.mean(n9);
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

  Future<void> somboonkaew() async {
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
      var s1 = Quarters.s1(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var s2 = Quarters.s2(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var s3 = Quarters.s3(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var s4 = Quarters.s4(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var s5 = Quarters.s5(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var s6 = Quarters.s6(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var s7 = Quarters.s7(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var s8 = Quarters.s8(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var s9 = Quarters.s9(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var s10 = Quarters.s10(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var s11 = Quarters.s11(imgDefault, imgDefault, twoDList, pixelX, pixelY);
      var s12 = Quarters.s12(imgDefault, imgDefault, twoDList, pixelX, pixelY);

      var s1Variance = ImageFilterUtils.quadrantVariancy(s1);
      lesserVariance = s1Variance;
      usedMean = MathUtils.mean(s1);

      var s2Variance = ImageFilterUtils.quadrantVariancy(s2);
      if (s2Variance < lesserVariance) {
        lesserVariance = s2Variance;
        usedMean = MathUtils.mean(s2);
      }

      var s3Variance = ImageFilterUtils.quadrantVariancy(s3);
      if (s3Variance < lesserVariance) {
        lesserVariance = s3Variance;
        usedMean = MathUtils.mean(s3);
      }

      var s4Variance = ImageFilterUtils.quadrantVariancy(s4);
      if (s4Variance < lesserVariance) {
        lesserVariance = s4Variance;
        usedMean = MathUtils.mean(s4);
      }

      var s5Variance = ImageFilterUtils.quadrantVariancy(s5);
      if (s5Variance < lesserVariance) {
        lesserVariance = s5Variance;
        usedMean = MathUtils.mean(s5);
      }

      var s6Variance = ImageFilterUtils.quadrantVariancy(s6);
      if (s6Variance < lesserVariance) {
        lesserVariance = s6Variance;
        usedMean = MathUtils.mean(s6);
      }

      var s7Variance = ImageFilterUtils.quadrantVariancy(s7);
      if (s7Variance < lesserVariance) {
        lesserVariance = s7Variance;
        usedMean = MathUtils.mean(s7);
      }

      var s8Variance = ImageFilterUtils.quadrantVariancy(s8);
      if (s8Variance < lesserVariance) {
        lesserVariance = s8Variance;
        usedMean = MathUtils.mean(s8);
      }

      var s9Variance = ImageFilterUtils.quadrantVariancy(s9);
      if (s9Variance < lesserVariance) {
        lesserVariance = s9Variance;
        usedMean = MathUtils.mean(s9);
      }

      var s10Variance = ImageFilterUtils.quadrantVariancy(s10);
      if (s10Variance < lesserVariance) {
        lesserVariance = s10Variance;
        usedMean = MathUtils.mean(s10);
      }

      var s11Variance = ImageFilterUtils.quadrantVariancy(s11);
      if (s11Variance < lesserVariance) {
        lesserVariance = s11Variance;
        usedMean = MathUtils.mean(s11);
      }

      var s12Variance = ImageFilterUtils.quadrantVariancy(s12);
      if (s12Variance < lesserVariance) {
        lesserVariance = s12Variance;
        usedMean = MathUtils.mean(s12);
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
