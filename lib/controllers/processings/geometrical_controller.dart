import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:get/get.dart';

import '../../utils/image_utils.dart';
import '../home/grid_controller.dart';
import 'package:image/image.dart' as img;

class GeometricalController extends GetxController {
  final GridController _gridController = Get.find();

  void init(Uint8List? baseImage) {
    this.baseImage = baseImage;
    _imagesPreProcessing();
  }

  Uint8List? baseImage;
  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? result;
  var str = "";

  var rotationValue = 0.obs;
  var translationValueX = 0.obs;
  var translationValueY = 0.obs;
  var scaleValue = 0.obs;
  var reflectionValue = 0.obs;
  var shearingValueX = 0.obs;
  var shearingValueY = 0.obs;

  Future<void> rotateImage() async {
    await _imagesPreProcessing();
    image1 = img.copyRotate(image1!, rotationValue.value);
    await _addImageToGrid();
  }

  Future<void> resizeImage() async {
    await _imagesPreProcessing();
    print("valoooor: ${scaleValue.value}");
    image1 = img.copyResize(image1!,
        width: image1!.width + scaleValue.value,
        height: image1!.height + scaleValue.value);
    await _addImageToGrid();
  }

  Future<void> _imagesPreProcessing() async {
    // list1 = _gridController.selectedChildren.toList().elementAt(0)!;
    image1 = img.decodeImage(baseImage!);
  }

  Future<void> _addImageToGrid() async {
    Completer<Image> c = Completer<Image>();
    decodedBytes1 = image1!.getBytes(format: img.Format.rgba);
    decodeImageFromPixels(
        decodedBytes1!, image1!.width, image1!.height, PixelFormat.rgba8888,
        (image) {
      c.complete(image);
    });

    var imagem = await c.future;
    var bytes = await imagem.toByteData(format: ImageByteFormat.png);

    _gridController.selectedChildren[0] = bytes!.buffer.asUint8List();
  }
}
