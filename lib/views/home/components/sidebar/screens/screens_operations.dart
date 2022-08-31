import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/views/home/components/grid/image_grid.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../../../controllers/home/grid_controller.dart';

class ScreensOperations extends StatelessWidget {
  const ScreensOperations({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return ImageGrid();
          case 1:
            return Text(
              "Geométricas",
              style: theme.textTheme.headline5,
            );
          case 2:
            return Text(
              "Color Systems",
              style: theme.textTheme.headline5,
            );
          case 3:
            return Text(
              "PseudoColor",
              style: theme.textTheme.headline5,
            );
          default:
            return Text(
              "Sobre",
              style: theme.textTheme.headline5,
            );
        }
      },
    );
  }
}
