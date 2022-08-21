import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/controllers/home/grid_controller.dart';

/// This [ImageGrid] widget contains the Grid Widget with the Images
/// at [HomePage]. The Grid is Reorderable, Draggable and Scrollable.
class ImageGrid extends StatelessWidget {
  ImageGrid({Key? key}) : super(key: key);

  final _scrollController = ScrollController();
  final _gridViewKey = GlobalKey();

  final GridController gridController = Get.put(GridController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => ReorderableBuilder(
          longPressDelay: const Duration(milliseconds: 100),
          scrollController: _scrollController,
          onReorder: (List<OrderUpdateEntity> orderUpdateEntities) {
            for (final orderUpdateEntity in orderUpdateEntities) {
              final widget = gridController.gridChildren
                  .removeAt(orderUpdateEntity.oldIndex);
              gridController.gridChildren
                  .insert(orderUpdateEntity.newIndex, widget);
            }
          },
          builder: (children) {
            return GridView.extent(
              key: _gridViewKey,
              controller: _scrollController,
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: children,
            );
          },
          children: List.generate(
              gridController.gridChildren.length,
              (index) => Container(
                  key: Key(gridController.gridChildren
                      .elementAt(index)
                      .hashCode
                      .toString()),
                  decoration: BoxDecoration(
                    border: gridController.firstSelectedImage.value == index
                        ? Border.all(
                            color: const Color.fromARGB(255, 39, 196, 25),
                            width: 5)
                        : gridController.secondSelectedImage.value == index
                            ? Border.all(
                                color: const Color.fromARGB(255, 230, 118, 43),
                                width: 5)
                            : null,
                    image: DecorationImage(
                        image: MemoryImage(
                            gridController.gridChildren.elementAt(index))),
                  ),
                  child: InkWell(
                      onTap: () => gridController.selectImage(index),
                      child: const Text("")))),
        ));
  }
}
