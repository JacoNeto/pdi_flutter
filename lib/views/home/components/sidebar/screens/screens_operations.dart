import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/views/home/components/grid/image_grid.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../../../controllers/home/grid_controller.dart';
import '../../../../../controllers/processings/geometrical_controller.dart';
import '../../../../geometrical/geometrical_page.dart';

class ScreensOperations extends StatelessWidget {
  ScreensOperations({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;
  final GeometricalController _geometricalController =
      Get.put(GeometricalController());
  final GridController _gridController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 1:
            _geometricalController
                .init(_gridController.selectedChildren.toList().elementAt(0)!);
            return const GeometricalPage();
          case 7:
            return Text(
              "Sobre",
              style: theme.textTheme.headline5,
            );
          default:
            return ImageGrid();
        }
      },
    );
  }
}
