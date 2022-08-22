import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/views/home/components/buttons/operations/logical_button.dart';
import 'package:pdi_flutter/views/home/components/grid/image_grid.dart';

import '../../controllers/home/grid_controller.dart';
import '../../controllers/processings/operations_controller.dart';
import 'components/buttons/operations/arithmetics_button.dart';

/// This [HomePage] widget has the first screen present at the widget tree
/// when opening the app
///
/// The [title] param shows the [String] that appears in the AppBar
class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final GridController _gridController = Get.put(GridController());
  final OperationsController _operationsController =
      Get.put(OperationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () => _gridController.clear(),
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ImageGrid(),
      ),
      floatingActionButton: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// If two images were selected, show [OperationsButton]
              if (_gridController.firstSelected.value != -1 &&
                  _gridController.secondSelected.value != -1)
                Row(
                  children: [
                    ArithmeticsButton(
                      plusOnTap: () => _operationsController.addImages(),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const LogicalButton()
                  ],
                ),

              const SizedBox(
                width: 8,
              ),

              /// [AddImage] Button
              FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.add_a_photo,
                    color: Colors.black,
                  ),
                  onPressed: () async => await _gridController.addImageTest()),
            ],
          )),
    );
  }
}
