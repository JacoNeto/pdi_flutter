import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/processings/segmentation/points_detection_controller.dart';
import '../../../../../../controllers/processings/segmentation/thresholding_controller.dart';

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

enum Thresholding { mean, maximum, minimum, maxmin, niblack }

void showThresholdDialog(BuildContext context, String? title,
    String? description, Thresholding threshold) {
  final textEditingController = TextEditingController();

  final ThresholdingController thresholdingController = Get.find();

  // set up the button
  Widget okButton = TextButton(
    onPressed: () {
      int value = int.parse(textEditingController.text);
      if (threshold == Thresholding.mean) {
        thresholdingController.mean(value);
      } else if (threshold == Thresholding.minimum) {
        thresholdingController.minimum(value);
      } else if (threshold == Thresholding.minimum) {
        thresholdingController.maximum(value);
      } else if (threshold == Thresholding.maxmin) {
        thresholdingController.maxmin(value);
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

void showNiblackDialog(
  BuildContext context,
  String? title,
  String? description,
) {
  final ThresholdingController thresholdingController = Get.find();

  final k = TextEditingController();
  final regions = TextEditingController();

  // set up the button
  Widget okButton = TextButton(
    onPressed: () {
      thresholdingController.niblack(
          int.parse(regions.text), double.parse(k.text));
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
            decoration: const InputDecoration(label: Text("Regions (4 ^ n)")),
            controller: regions,
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(label: Text("K")),
            controller: k,
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
