import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/controllers/processings/geometrical_controller.dart';

class GeometricalDialogs {
  static void showInsertValueDialog(
      BuildContext context, String? title, String? description,
      {String? action, dynamic getxControllerValue}) {
    final textEditingController = TextEditingController();

    final GeometricalController geometricalController = Get.find();

    // set up the button
    Widget okButton = TextButton(
      onPressed: () {
        switch (action) {
          case 'rotate':
            getxControllerValue.rotationValue.value =
                int.tryParse(textEditingController.text);
            getxControllerValue.rotateImage();
            break;
          case 'resize':
            print("resize");
            getxControllerValue.scaleValue.value =
                int.tryParse(textEditingController.text);
            getxControllerValue.resizeImage();
            break;
          default:
            print("erro");
            break;
        }

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

  static void showInsertTranslationValueDialog(
    BuildContext context,
    String? title,
    String? description,
  ) {
    final GeometricalController geometricalController = Get.find();
    final textEditingControllerX = TextEditingController();
    final textEditingControllerY = TextEditingController();

    // set up the button
    Widget okButton = TextButton(
      onPressed: () {
        geometricalController.translationValueX.value =
            int.parse(textEditingControllerX.text);
        geometricalController.translationValueY.value =
            int.parse(textEditingControllerY.text);
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
              controller: textEditingControllerX,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(label: Text("y")),
              controller: textEditingControllerY,
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
    final textEditingControllerX = TextEditingController();
    final textEditingControllerY = TextEditingController();

    // set up the button
    Widget okButton = TextButton(
      onPressed: () {
        geometricalController.shearingValueX.value =
            int.parse(textEditingControllerX.text);
        geometricalController.shearingValueY.value =
            int.parse(textEditingControllerY.text);
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
              controller: textEditingControllerX,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(label: Text("y")),
              controller: textEditingControllerY,
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
