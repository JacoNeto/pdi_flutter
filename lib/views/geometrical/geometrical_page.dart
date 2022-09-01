import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/controllers/processings/geometrical_controller.dart';

import '../../controllers/home/grid_controller.dart';
import 'components/geometrical_buttom.dart';
import 'components/geometrical_popups.dart';

class GeometricalPage extends StatelessWidget {
  const GeometricalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GridController gridController = Get.find();
    final GeometricalController geometricalController = Get.find();
    return Obx(() => Stack(
          alignment: Alignment.bottomLeft,
          children: [
            if (gridController.firstSelected.value != -1)
              Obx(() => SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      // Translation operation working with padding
                      padding: EdgeInsets.only(
                          right:
                              (geometricalController.translationValueX.value > 0
                                      ? geometricalController
                                          .translationValueX.value
                                      : 0) /
                                  1.0,
                          left: (geometricalController.translationValueX.value < 0
                                  ? geometricalController
                                      .translationValueX.value
                                      .abs()
                                  : 0) /
                              1.0,
                          bottom:
                              (geometricalController.translationValueY.value < 0
                                      ? geometricalController
                                          .translationValueY.value
                                          .abs()
                                      : 0) /
                                  1.0,
                          top: (geometricalController.translationValueY.value > 0
                                  ? geometricalController.translationValueY.value
                                  : 0) /
                              1.0),
                      child: Image(
                        image: MemoryImage(gridController.selectedChildren
                            .toList()
                            .elementAt(0)!),
                      ),
                    ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GeometricalButton(
                  onPressed: () =>
                      GeometricalDialogs.showInsertTranslationValueDialog(
                    context,
                    "Translation Values",
                    "",
                  ),
                  title: "Translation",
                  color: Colors.purple,
                ),

                //
                const SizedBox(
                  height: 4,
                ),
                //

                GeometricalButton(
                  onPressed: () => GeometricalDialogs.showInsertValueDialog(
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
                  onPressed: () => GeometricalDialogs.showInsertValueDialog(
                      context, "Resize Scale", "",
                      action: "resize",
                      getxControllerValue: geometricalController),
                  title: "Resize",
                  color: const Color.fromARGB(255, 33, 43, 228),
                ),

                //
                const SizedBox(
                  height: 4,
                ),
                //

                GeometricalButton(
                  onPressed: () => GeometricalDialogs.showInsertValueDialog(
                      context, "Reflection Scale", "",
                      action: "reflection",
                      getxControllerValue: geometricalController),
                  title: "Reflection",
                  color: const Color.fromARGB(255, 233, 125, 220),
                ),

                //
                const SizedBox(
                  height: 4,
                ),
                //

                GeometricalButton(
                  onPressed: () => GeometricalDialogs.showInsertValueDialog(
                      context, "Shear Scale", "",
                      action: "shear",
                      getxControllerValue: geometricalController),
                  title: "shear",
                  color: const Color.fromARGB(255, 122, 33, 18),
                )
              ],
            ),
          ],
        ));
  }
}
