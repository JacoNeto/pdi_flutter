import 'dart:async';
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
import '../../home/grid_controller.dart';

class EdgeDetectionController extends GetxController {
  final GridController _gridController = Get.find();

  Uint8List? list1;
  img.Image? image1;
  Uint8List? decodedBytes1;

  Uint8List? result;

  var str = "";

  Future<void> crossRoberts() async {
    await _imagePreProcessing();
    var gx = ImageSegmetationUtils.convolutionLine(
      image1!,
      crossRobertsGx.convolution,
    );
    var gy = ImageSegmetationUtils.convolutionLine(
      image1!,
      crossRobertsGy.convolution,
    );
    int aux = 0;
    for (int i = 0; i < decodedBytes1!.length; i++) {
      if (++aux > 3) {
        aux = 0;
        result![i] = decodedBytes1![i];
      } else {
        result![i] = clampPixel(
            ImageSegmetationUtils.gradientMagnitude(gx[i], gy[i]).toInt());
      }
    }
    // print(str);
    await _addImageToGrid();
  }

  Future<void> roberts() async {
    await _imagePreProcessing();
    var gx = ImageSegmetationUtils.convolutionLine(
      image1!,
      robertsGx.convolution,
    );
    var gy = ImageSegmetationUtils.convolutionLine(
      image1!,
      robertsGy.convolution,
    );
    int aux = 0;
    for (int i = 0; i < decodedBytes1!.length; i++) {
      if (++aux > 3) {
        aux = 0;
        result![i] = decodedBytes1![i];
      } else {
        result![i] = clampPixel(
            ImageSegmetationUtils.gradientMagnitude(gx[i], gy[i]).toInt());
      }
    }
    // print(str);
    await _addImageToGrid();
  }

  Future<void> prewittGxComp() async {
    await _imagePreProcessing();
    result = ImageSegmetationUtils.convolutionLine(
      image1!,
      prewittGx.convolution,
    );
    await _addImageToGrid();
  }

  Future<void> prewittGyComp() async {
    await _imagePreProcessing();
    result = ImageSegmetationUtils.convolutionLine(
      image1!,
      prewittGy.convolution,
    );
    await _addImageToGrid();
  }

  Future<void> prewittMagnitude() async {
    await _imagePreProcessing();
    var gx = ImageSegmetationUtils.convolutionLine(
      image1!,
      prewittGx.convolution,
    );
    var gy = ImageSegmetationUtils.convolutionLine(
      image1!,
      prewittGy.convolution,
    );
    int aux = 0;
    for (int i = 0; i < decodedBytes1!.length; i++) {
      if (++aux > 3) {
        aux = 0;
        result![i] = decodedBytes1![i];
      } else {
        result![i] = clampPixel(
            ImageSegmetationUtils.gradientMagnitude(gx[i], gy[i]).toInt());
      }
    }
    await _addImageToGrid();
  }

  Future<void> sobelGxComp() async {
    await _imagePreProcessing();
    result = ImageSegmetationUtils.convolutionLine(
      image1!,
      sobelGx.convolution,
    );
    await _addImageToGrid();
  }

  Future<void> sobelGyComp() async {
    await _imagePreProcessing();
    result = ImageSegmetationUtils.convolutionLine(
      image1!,
      sobelGy.convolution,
    );
    await _addImageToGrid();
  }

  Future<void> sobelMagnitude() async {
    await _imagePreProcessing();
    var gx = Uint8List.fromList(ImageSegmetationUtils.convolutionLine(
      image1!,
      sobelGx.convolution,
    ));
    var gy = Uint8List.fromList(ImageSegmetationUtils.convolutionLine(
      image1!,
      sobelGy.convolution,
    ));
    int aux = 0;
    for (int i = 0; i < decodedBytes1!.length; i++) {
      if (++aux > 3) {
        aux = 0;
        result![i] = decodedBytes1![i];
      } else {
        result![i] = clampPixel(
            ImageSegmetationUtils.gradientMagnitude(gx[i], gy[i]).toInt());
      }
    }
    await _addImageToGrid();
  }

  Future<void> kirschMagnitude() async {
    await _imagePreProcessing();

    List<Uint8List> images = [];
    int length = kirsch.length;

    for (int i = 0; i < length; i++) {
      images.add(Uint8List.fromList(ImageSegmetationUtils.convolutionLine(
        image1!,
        kirsch[i].convolution,
      )));
    }

    for (int i = 0; i < decodedBytes1!.length; i++) {
      List<int> values = [];
      int aux = 0;

      if (++aux > 3) {
        aux = 0;
        result![i] = decodedBytes1![i];
      } else {
        for (int j = 0; j < length; j++) {
          values.add(images[j][i]);
        }
        result![i] = values.reduce(max);
      }
    }

    await _addImageToGrid();
  }

  Future<void> robisonMagnitude() async {
    await _imagePreProcessing();

    List<Uint8List> images = [];
    int length = robison.length;

    for (int i = 0; i < length; i++) {
      images.add(Uint8List.fromList(ImageSegmetationUtils.convolutionLine(
        image1!,
        robison[i].convolution,
      )));
    }

    for (int i = 0; i < decodedBytes1!.length; i++) {
      List<int> values = [];
      int aux = 0;

      if (++aux > 3) {
        aux = 0;
        result![i] = decodedBytes1![i];
      } else {
        for (int j = 0; j < length; j++) {
          values.add(images[j][i]);
        }
        result![i] = values.reduce(max);
      }
    }

    await _addImageToGrid();
  }

  //TODO improve this method my aplying the average mask
  Future<void> freyChenMagnitude() async {
    await _imagePreProcessing();

    List<Uint8List> images = [];
    int length = freyChen.length;

    for (int i = 0; i < length; i++) {
      if (i == length - 1) {
        images.add(Uint8List.fromList(ImageFilterUtils.convolutionMean(
            image1!, freyChen[i].convolution)));
      } else {
        images.add(Uint8List.fromList(ImageSegmetationUtils.convolutionLine(
          image1!,
          freyChen[i].convolution,
        )));
      }
    }
    var str = '';
    for (int i = 0; i < decodedBytes1!.length; i++) {
      List<int> values = [];
      int aux = 0;

      if (++aux > 3) {
        aux = 0;
        result![i] = decodedBytes1![i];
      } else {
        for (int j = 0; j < length; j++) {
          values.add(images[j][i]);
        }
        double m = (values[0] + values[1]) + (values[2] + values[3]).toDouble();
        double s = (values[4] + values[5]).toDouble() +
            (values[6] + values[7]).toDouble();
        result![i] = clampPixel((m + s).toInt());
      }
    }
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
