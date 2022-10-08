import 'package:flutter/material.dart';
import 'package:pdi_flutter/views/home/components/grid/image_grid.dart';
import 'package:sidebarx/sidebarx.dart';

class ScreensDefault extends StatelessWidget {
  const ScreensDefault({
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
