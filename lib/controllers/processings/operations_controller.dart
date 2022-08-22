import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:pdi_flutter/controllers/home/grid_controller.dart';

/// this [OperationsController] uses two images selected from
/// [GridController] to make arithmetic and logical operations
/// between them
class OperationsController extends GetxController {
  final GridController _gridController = Get.find();

  void addImages() {
    print(_gridController.selectedChildren.elementAt(0)!);
    print(_gridController.selectedChildren.elementAt(1)!);
    List<int> list1 = _gridController.selectedChildren.toList().elementAt(0)!;
    List<int> list2 = _gridController.selectedChildren.toList().elementAt(1)!;
    List<int> result = <int>[];
    print(list1.length);
    print(list2.length);
    /*for (int i in list1) {
      for (int j in list2) {
        result.add(i + j);
      }
    }
    var list = Uint8List.fromList(result);
    _gridController.addChildToGrid(list);*/
  }

  void subImages() {}

  void multImages() {}

  void divImages() {}

  void andImages() {}

  void orImages() {}

  void xorImages() {}
}
