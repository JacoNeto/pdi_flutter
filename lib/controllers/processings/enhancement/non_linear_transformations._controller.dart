import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pdi_flutter/utils/convolution_kernel.dart';
import 'package:pdi_flutter/utils/enhancement_utils.dart/grey_scale.dart';

import '../../../constants/img_default.dart';
import '../../../utils/image_filter_utils/image_filter_utils.dart';
import '../../../utils/image_utils.dart';
import '../../home/grid_controller.dart';

class NonLinearTransformationController extends GetxController {
  final GridController _gridController = Get.find();

  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? result;

  var str = "";

  Future<void> logarithm() async {
    await _imagePreProcessing();
    List<int> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i]);
    }

    var greyScalePixels = Uint8List.fromList(greyScaleList);

    for (int i = 0; i < greyScalePixels.length; i++) {
      resultBefore.addAll(
          ImageUtils.greyScale(GreyScale.logarithm(greyScalePixels[i], 255)));
    }
    result = Uint8List.fromList(resultBefore);
    // print(str);
    await _addImageToGrid();
  }

  Future<void> exponential() async {
    await _imagePreProcessing();
    List<int> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i]);
    }

    var greyScalePixels = Uint8List.fromList(greyScaleList);

    for (int i = 0; i < greyScalePixels.length; i++) {
      resultBefore.addAll(
          ImageUtils.greyScale(GreyScale.exponential(greyScalePixels[i], 255)));
    }
    result = Uint8List.fromList(resultBefore);
    // print(str);
    await _addImageToGrid();
  }

  Future<void> squared() async {
    await _imagePreProcessing();
    List<int> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i]);
    }

    var greyScalePixels = Uint8List.fromList(greyScaleList);

    for (int i = 0; i < greyScalePixels.length; i++) {
      resultBefore.addAll(
          ImageUtils.greyScale(GreyScale.squared(greyScalePixels[i], 255)));
    }
    result = Uint8List.fromList(resultBefore);
    // print(str);
    await _addImageToGrid();
  }

  Future<void> square() async {
    await _imagePreProcessing();
    List<int> greyScaleList = [];
    List<int> resultBefore = [];

    for (var i = 0; i < decodedBytes1!.length; i += 4) {
      greyScaleList.add(decodedBytes1![i]);
    }

    var greyScalePixels = Uint8List.fromList(greyScaleList);

    for (int i = 0; i < greyScalePixels.length; i++) {
      resultBefore.addAll(
          ImageUtils.greyScale(GreyScale.square(greyScalePixels[i], 255)));
    }
    result = Uint8List.fromList(resultBefore);
    // print(str);
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
