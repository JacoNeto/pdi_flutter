import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/utils/image_utils.dart';
import 'package:pdi_flutter/views/home/components/grid/image_grid.dart';

import '../../controllers/home/grid_controller.dart';

/// This [HomePage] widget has the first screen present at the widget tree
/// when opening the app
///
/// The [title] param shows the informes [String] at the AppBar
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
      floatingActionButton: Row(
        children: [
          FloatingActionButton(onPressed: () => gridController.addTest()),
          FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () async => await gridController.addImageTest()),
        ],
      ),
    );
  }
}
