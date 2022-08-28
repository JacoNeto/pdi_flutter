import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/home/grid_controller.dart';

class RemoveIcon extends StatelessWidget {
  RemoveIcon({
    Key? key,
    required this.i,
  }) : super(key: key);
  final int i;

  final GridController _gridController = Get.find();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => _gridController.removeImage(i),
        icon: const Icon(
          Icons.clear,
          color: Colors.red,
        ));
  }
}
