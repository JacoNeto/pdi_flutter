import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/processings/segmentation/points_detection_controller.dart';

void showPointsDetectionValueDialog(
    BuildContext context, String? title, String? description,
    {String? action, dynamic getxControllerValue}) {
  final textEditingController = TextEditingController();

  final pointsDetectionController = Get.put(PointsDetectionController());

  // set up the button
  Widget okButton = TextButton(
    onPressed: () {
      pointsDetectionController
          .detection(int.parse(textEditingController.text));

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
