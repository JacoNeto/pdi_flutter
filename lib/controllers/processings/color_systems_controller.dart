import 'package:color_models/color_models.dart';
import 'package:get/get.dart';

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:image/image.dart' as img;

import '../../constants/img_default.dart';
import '../../utils/image_utils.dart';
import '../home/grid_controller.dart';

class ColorSystemsController extends GetxController {
  final GridController _gridController = Get.find();

  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? result;

  Uint8List? cmyk;
  Uint8List? hsb;

  var str = "";

  Future<void> redImage() async {
    await _imagePreProcessing();
    int ctrlRGB = 0;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (ctrlRGB == 0 || ctrlRGB == 3) {
        result![i] = decodedBytes1![i];
      } else {
        result![i] = 0;
      }
      ctrlRGB++;
      if (ctrlRGB > 3) {
        ctrlRGB = 0;
      }
    }
    await _addImageToGrid();
  }

  Future<void> greenImage() async {
    await _imagePreProcessing();
    int ctrlRGB = 0;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (ctrlRGB == 1 || ctrlRGB == 3) {
        result![i] = decodedBytes1![i];
      } else {
        result![i] = 0;
      }
      ctrlRGB++;
      if (ctrlRGB > 3) {
        ctrlRGB = 0;
      }
    }
    await _addImageToGrid();
  }

  Future<void> blueImage() async {
    await _imagePreProcessing();
    int ctrlRGB = 0;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (ctrlRGB == 2 || ctrlRGB == 3) {
        result![i] = decodedBytes1![i];
      } else {
        result![i] = 0;
      }
      ctrlRGB++;
      if (ctrlRGB > 3) {
        ctrlRGB = 0;
      }
    }
    await _addImageToGrid();
  }

  Future<void> hsbImage() async {
    await _imagePreProcessing();
    int ctrlRGB = 0;
    var rgbListAux = <int>[];
    var hsbListAux = <num>[];
    RgbColor? rgbColor;
    HsbColor? hsbColor;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (ctrlRGB != 3) {
        rgbListAux.add(decodedBytes1![i]);
      }
      ctrlRGB++;
      if (ctrlRGB == 3) {
        rgbColor = RgbColor.fromList(rgbListAux);
        hsbColor = rgbColor.toHsbColor();
      }
      if (ctrlRGB > 3) {
        hsbListAux = hsbColor!.toList();
        hsb![i - 3] = hsbListAux[0].toInt();
        hsb![i - 2] = hsbListAux[1].toInt();
        hsb![i - 1] = hsbListAux[2].toInt();
        hsb![i - 0] = 0;

        ctrlRGB = 0;
        rgbListAux.clear();
      }
    }
    ctrlRGB = 0;
    /*int usedSpace = 0;

    //TODO fazer isso aqui como enum
    if (space == "cyan") {
      usedSpace = 0;
    } else if (space == "magenta") {
      usedSpace = 1;
    } else if (space == "yellow") {
      usedSpace = 2;
    } else {
      usedSpace = 3;
    }*/
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (ctrlRGB == 2 || ctrlRGB == 3) {
      } else {
        hsb![i] = 0;
      }
      ctrlRGB++;
      if (ctrlRGB > 3) {
        ctrlRGB = 0;
      }
    }

    rgbListAux = <int>[];
    hsbListAux = <num>[];
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (ctrlRGB < 3) {
        hsbListAux.add(hsb![i]);
      }
      ctrlRGB++;
      if (ctrlRGB == 3) {
        hsbColor = HsbColor.fromList(hsbListAux);
        rgbColor = hsbColor.toRgbColor();
      }
      if (ctrlRGB > 3) {
        rgbListAux = rgbColor!.toList();
        result![i - 3] = rgbListAux[0].toInt();
        str += "${rgbListAux[0].toInt()} ";
        result![i - 2] = rgbListAux[1].toInt();
        result![i - 1] = rgbListAux[2].toInt();
        result![i] = decodedBytes1![i];
        ctrlRGB = 0;
        rgbListAux = <int>[];
        hsbListAux = <num>[];
      }
    }
    print(str);
    await _addImageToGrid();
  }

  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //

  //TODO botar isso em outro arquivo
  Future<void> cmykImage(String space) async {
    await _imagePreProcessing();
    int ctrlRGB = 0;
    var rgbListAux = <int>[];
    var cmykListAux = <num>[];
    RgbColor? rgbColor;
    CmykColor? cmykColor;
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (ctrlRGB != 3) {
        rgbListAux.add(decodedBytes1![i]);
      }
      ctrlRGB++;
      if (ctrlRGB == 3) {
        rgbColor = RgbColor.fromList(rgbListAux);
        cmykColor = rgbColor.toCmykColor();
      }
      if (ctrlRGB > 3) {
        cmykListAux = cmykColor!.toList();
        cmyk![i - 3] = cmykListAux[0].toInt();
        cmyk![i - 2] = cmykListAux[1].toInt();
        cmyk![i - 1] = cmykListAux[2].toInt();
        cmyk![i - 0] = cmykListAux[3].toInt();

        ctrlRGB = 0;
        rgbListAux.clear();
      }
    }
    ctrlRGB = 0;
    int usedSpace = 0;

    //TODO fazer isso aqui como enum
    if (space == "cyan") {
      usedSpace = 0;
    } else if (space == "magenta") {
      usedSpace = 1;
    } else if (space == "yellow") {
      usedSpace = 2;
    } else {
      usedSpace = 3;
    }
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (ctrlRGB == usedSpace) {
      } else {
        cmyk![i] = 0;
      }
      ctrlRGB++;
      if (ctrlRGB > 3) {
        ctrlRGB = 0;
      }
    }

    rgbListAux = <int>[];
    cmykListAux = <num>[];
    for (var i = 0; i < decodedBytes1!.length; i++) {
      if (ctrlRGB < 4) {
        cmykListAux.add(cmyk![i]);
      }
      ctrlRGB++;
      if (ctrlRGB == 4) {
        cmykColor = CmykColor.fromList(cmykListAux);
        rgbColor = cmykColor.toRgbColor();
      }
      if (ctrlRGB > 3) {
        rgbListAux = rgbColor!.toList();
        result![i - 3] = rgbListAux[0].toInt();
        result![i - 2] = rgbListAux[1].toInt();
        result![i - 1] = rgbListAux[2].toInt();
        result![i] = decodedBytes1![i];
        ctrlRGB = 0;
        rgbListAux = <int>[];
        cmykListAux = <num>[];
      }
    }
    print("bom dia");
    await _addImageToGrid();
  }

  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //

  Future<void> _imagePreProcessing() async {
    list1 = _gridController.selectedChildren.toList().elementAt(0)!;
    image1 = img.decodeImage(list1!);
    image1 =
        ImageUtils.resizeImage(image1!, width: imgDefault, height: imgDefault);
    decodedBytes1 = image1!.getBytes(format: img.Format.rgba);

    result = Uint8List(decodedBytes1!.length);
    cmyk = Uint8List(decodedBytes1!.length);
    hsb = Uint8List(decodedBytes1!.length);
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
