import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/controllers/home/home_controller.dart';
import 'package:pdi_flutter/controllers/processings/color_systems_controller.dart';
import 'package:pdi_flutter/models/enums/sidebar_enum.dart';
import 'package:pdi_flutter/views/home/components/buttons/operations/colors_button.dart';
import 'package:pdi_flutter/views/home/components/buttons/operations/logical_button.dart';
import 'package:pdi_flutter/views/home/components/grid/image_grid.dart';
import 'package:pdi_flutter/views/home/components/sidebar/screens/screens_operations.dart';
import 'package:pdi_flutter/views/home/components/sidebar/sidebar.dart';
import 'package:sidebarx/sidebarx.dart';

import 'package:pdi_flutter/views/home/components/buttons/operations/pseudo_color_button.dart';
import 'package:pdi_flutter/controllers/processings/pseudocolor_controller.dart';

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
  final HomeController _homeController = Get.find();
  final ColorSystemsController _colorSystemsController =
      Get.put(ColorSystemsController());
  final PseudoColorController _pseudoColorController =
      Get.put(PseudoColorController());
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
              // if you are in the color conversion tab
              if (_isItemGridSelected(SidebarItem.conversion))
                Row(
                  children: [
                    CmykButton(
                      cyanOnTap: () =>
                          _colorSystemsController.cmykImage("cyan"),
                      magentaOnTap: () =>
                          _colorSystemsController.cmykImage("magenta"),
                      yellowOnTap: () =>
                          _colorSystemsController.cmykImage("yellow"),
                      keyOntap: () => _colorSystemsController.cmykImage("key"),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    ColorsButton(
                      redOnTap: () => _colorSystemsController.redImage(),
                      greenOnTap: () => _colorSystemsController.greenImage(),
                      blueOnTap: () => _colorSystemsController.blueImage(),
                      hsbOntap: () => _colorSystemsController.hsbImage(),
                    ),
                  ],
                ),

              // If you are in the pseudocolor tab
              if (_isItemGridSelected(SidebarItem.pseudocolor))
                PseudoColorButton(
                  pseudoOnTap: () => _pseudoColorController.pseudoColor(),
                  realceOnTap: () => _pseudoColorController.pseudoColor(),
                ),

              /// If two images were selected, show [OperationsButton]
              if (_gridController.firstSelected.value != -1 &&
                  _gridController.secondSelected.value != -1 &&
                  _isItemSelected(SidebarItem.home))
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
              if (_homeController.selectedSidebarItem.value == SidebarItem.home)
                FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.add_a_photo,
                      color: Colors.black,
                    ),
                    onPressed: () async =>
                        await _gridController.addImageTest()),
            ],
          )),
    );
  }

  bool _isFirstSelected() {
    return _gridController.firstSelected.value != -1;
  }

  bool _isItemSelected(SidebarItem sidebarItem) {
    return _homeController.selectedSidebarItem.value == sidebarItem;
  }

  bool _isItemGridSelected(SidebarItem sidebarItem) {
    return _isFirstSelected() && _isItemSelected(sidebarItem);
  }
}
