import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/processings/filtering/high_pass_filtering_controller.dart';

void showHighBoostValueDialog(
    BuildContext context, String? title, String? description,
    {String? action, dynamic getxControllerValue}) {
  final textEditingController = TextEditingController();

  final HighPassFilteringController highPassFilteringController = Get.find();

  // set up the button
  Widget okButton = TextButton(
    onPressed: () {
      highPassFilteringController
          .highBoost(int.parse(textEditingController.text));

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
