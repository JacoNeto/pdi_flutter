import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/controllers/processings/enhancement/general_transformations_controller.dart';
import 'package:pdi_flutter/controllers/processings/geometrical_controller.dart';
import 'package:pdi_flutter/views/home/components/buttons/enhancement/linear_transformations_button.dart';

import '../../../../../../controllers/processings/enhancement/linear_transformations._controller.dart';

class LinearDialogs {
  static void showInsertGreyscaleValueDialog(
    BuildContext context,
    String? title,
    String? description,
  ) {
    final GeometricalController geometricalController = Get.find();
    final LinearTransformationController linearTransformationController =
        Get.find();

    final textEditingControllerMAX = TextEditingController();
    final textEditingControllerMIN = TextEditingController();

    // set up the button
    Widget okButton = TextButton(
      onPressed: () {
        linearTransformationController.greyScaleRange(
            int.parse(textEditingControllerMIN.text),
            int.parse(textEditingControllerMAX.text));
        Get.back();
      },
      child: const Text("Submit"),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("$title"),
      content: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(label: Text("MIN")),
              controller: textEditingControllerMIN,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(label: Text("MAX")),
              controller: textEditingControllerMAX,
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showShearingTranslationValueDialog(
    BuildContext context,
    String? title,
    String? description,
  ) {
    final GeometricalController geometricalController = Get.find();
    final textEditingControllerMIN = TextEditingController();
    final textEditingControllerMAX = TextEditingController();

    // set up the button
    Widget okButton = TextButton(
      onPressed: () {
        geometricalController.shearingValueX.value =
            int.parse(textEditingControllerMIN.text);
        geometricalController.shearingValueY.value =
            int.parse(textEditingControllerMAX.text);
        Get.back();
      },
      child: const Text("Submit"),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("$title"),
      content: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(label: Text("x")),
              controller: textEditingControllerMIN,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(label: Text("y")),
              controller: textEditingControllerMAX,
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showReflectionValueDialog(
    BuildContext context,
    String? title,
    String? description,
  ) {
    final GeometricalController geometricalController = Get.find();
    final textEditingControllerMIN = TextEditingController();
    final textEditingControllerMAX = TextEditingController();

    // set up the button
    Widget okButton = TextButton(
      onPressed: () {
        geometricalController.reflectionXValue.value =
            int.parse(textEditingControllerMIN.text);
        geometricalController.reflectionYValue.value =
            int.parse(textEditingControllerMAX.text);
        Get.back();
      },
      child: const Text("Submit"),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("$title"),
      content: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(label: Text("x")),
              controller: textEditingControllerMIN,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(label: Text("y")),
              controller: textEditingControllerMAX,
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

void showGammaValueDialog(
    BuildContext context, String? title, String? description,
    {String? action, dynamic getxControllerValue}) {
  final textEditingController = TextEditingController();

  final GeneralTransformationsController generalTransformationsController =
      Get.find();

  // set up the button
  Widget okButton = TextButton(
    onPressed: () {
      generalTransformationsController
          .gammaCorrection(double.parse(textEditingController.text));

      Get.back();
    },
    child: const Text("Submit"),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("$title"),
    content: TextField(
      controller: textEditingController,
      keyboardType: TextInputType.number,
      autofocus: true,
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
