import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/controllers/processings/geometrical_controller.dart';

import '../../controllers/home/grid_controller.dart';

class GeometricalPage extends StatelessWidget {
  const GeometricalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GridController gridController = Get.find();
    final GeometricalController geometricalController = Get.find();
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (gridController.firstSelected.value != -1)
              Obx(() => Image(
                    width: 500,
                    height: 500,
                    image: MemoryImage(
                        gridController.selectedChildren.toList().elementAt(0)!),
                  )),
            Slider(
                value: geometricalController.rotationValue.value / 1.0,
                onChanged: (value) {
                  geometricalController.rotationValue.value = value ~/ 1;
                  geometricalController.rotateImage();
                },
                max: 360,
                min: 0)
          ],
        ));
  }
}
