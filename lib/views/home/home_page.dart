import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/views/home/components/buttons/operations/logical_button.dart';
import 'package:pdi_flutter/views/home/components/grid/image_grid.dart';
import 'package:pdi_flutter/views/home/components/sidebar/screens/screens_operations.dart';
import 'package:pdi_flutter/views/home/components/sidebar/sidebar.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../controllers/home/grid_controller.dart';
import '../../controllers/processings/operations_controller.dart';
import 'components/buttons/operations/arithmetics_button.dart';
import 'components/sidebar/screens/screens_default.dart';

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

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () => _gridController.clear(),
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          children: [
            if (!(MediaQuery.of(context).size.width < 600))
              AppSidebar(controller: _controller),
            Expanded(
              child: Obx(() => Center(
                    child: _gridController.needAloneOperations.value
                        ? ScreensOperations(
                            controller: _controller,
                          )
                        : ScreensDefault(
                            controller: _controller,
                          ),
                  )),
            ),
          ],
        ),
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
                      minusOnTap: () => _operationsController.minusImages(),
                      multOnTap: () => _operationsController.multImages(),
                      divOnTap: () => _operationsController.divImages(),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    LogicalButton(
                      andOnTap: () => _operationsController.andImages(),
                      orOnTap: () => _operationsController.orImages(),
                      xorOnTap: () => _operationsController.xorImages(),
                    )
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
