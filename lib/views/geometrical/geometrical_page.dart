import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/controllers/processings/geometrical_controller.dart';
import 'package:pdi_flutter/utils/popups/operation_dialog.dart';

import '../../controllers/home/grid_controller.dart';
import 'components/geometrical_buttom.dart';

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
                    image: MemoryImage(
                        gridController.selectedChildren.toList().elementAt(0)!),
                  )),
            /*Slider(
                value: geometricalController.rotationValue.value / 1.0,
                onChanged: (value) {
                  geometricalController.rotationValue.value = value ~/ 1;
                  geometricalController.rotateImage();
                },
                max: 360,
                divisions: 5,
                label: geometricalController.rotationValue.value.toString(),
                min: 0),*/
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GeometricalButton(
                  onPressed: () => OperationDialogs.showInsertValueDialog(
                      context, "Rotation Degree", "",
                      action: "rotate",
                      getxControllerValue: geometricalController),
                  title: "Rotation",
                  color: Colors.green,
                ),

                //
                const SizedBox(
                  height: 4,
                ),
                //

                GeometricalButton(
                  onPressed: () => OperationDialogs.showInsertValueDialog(
                      context, "Resize Scale", "",
                      action: "resize",
                      getxControllerValue: geometricalController),
                  title: "Resize",
                  color: const Color.fromARGB(255, 33, 43, 228),
                )
              ],
            ),
          ],
        ));
  }
}
