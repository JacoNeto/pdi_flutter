import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/views/home/components/buttons/operations_button.dart';
import 'package:pdi_flutter/views/home/components/grid/image_grid.dart';

import '../../controllers/home/grid_controller.dart';

/// This [HomePage] widget has the first screen present at the widget tree
/// when opening the app
///
/// The [title] param shows the [String] that appears in the AppBar
class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final GridController gridController = Get.put(GridController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ImageGrid(),
      ),
      floatingActionButton: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// If two images were selected, show [OperationsButton]
              if (gridController.firstSelectedImage.value != -1 &&
                  gridController.secondSelectedImage.value != -1)
                const OperationsButton(),

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
                  onPressed: () async => await gridController.addImageTest()),
            ],
          )),
    );
  }
}
