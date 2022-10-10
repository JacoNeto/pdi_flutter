import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pdi_flutter/utils/convolution_kernel.dart';
import 'package:pdi_flutter/utils/image_filter_utils.dart';

import '../../../constants/img_default.dart';
import '../../../utils/image_utils.dart';
import '../../home/grid_controller.dart';

class HighPassFilteringController extends GetxController {
  final GridController _gridController = Get.find();

  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? result;

  var str = "";

  Future<void> h1() async {
    await _imagePreProcessing();
    result = ImageFilterUtils.convolute(decodedBytes1!, imgDefault, imgDefault,
        ImageFilterUtils.normalizeKernel(h1Kernel.convolution), 0);
    // print(str);
    await _addImageToGrid();
  }

  Future<void> h2() async {
    await _imagePreProcessing();
    result = ImageFilterUtils.convolute(decodedBytes1!, imgDefault, imgDefault,
        ImageFilterUtils.normalizeKernel(h2Kernel.convolution), 0);
    // print(str);
    await _addImageToGrid();
  }

  Future<void> m1() async {
    await _imagePreProcessing();
    result = ImageFilterUtils.convolute(decodedBytes1!, imgDefault, imgDefault,
        ImageFilterUtils.normalizeKernel(m1Kernel.convolution), 0);
    // print(str);
    await _addImageToGrid();
  }

  Future<void> m2() async {
    await _imagePreProcessing();
    result = ImageFilterUtils.convolute(decodedBytes1!, imgDefault, imgDefault,
        ImageFilterUtils.normalizeKernel(m2Kernel.convolution), 0);
    // print(str);
    await _addImageToGrid();
  }

  Future<void> m3() async {
    await _imagePreProcessing();
    result = ImageFilterUtils.convolute(decodedBytes1!, imgDefault, imgDefault,
        ImageFilterUtils.normalizeKernel(m3Kernel.convolution), 0);
    // print(str);
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
