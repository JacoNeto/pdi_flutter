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
          longPressDelay: const Duration(milliseconds: 300),
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
            (index) => Stack(
              key: Key(gridController.gridChildren
                  .elementAt(index)
                  .hashCode
                  .toString()),
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: gridController.firstSelected.value == index
                        ? Border.all(
                            color: const Color.fromARGB(255, 39, 196, 25),
                            width: 5)
                        : gridController.secondSelected.value == index
                            ? Border.all(
                                color: const Color.fromARGB(255, 230, 118, 43),
                                width: 5)
                            : null,
                  ),
                  child: InkWell(
                      onTap: () => gridController.selectImage(index),
                      child: Image(
                        width: 500,
                        height: 500,
                        image: MemoryImage(
                            gridController.gridChildren.elementAt(index)),
                      )),
                ),
                RemoveIcon(
                  i: index,
                )
              ],
            ),
          ),
        ));
  }
}

class RemoveIcon extends StatelessWidget {
  RemoveIcon({
    Key? key,
    required this.i,
  }) : super(key: key);
  final int i;

  final GridController _gridController = Get.find();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => _gridController.removeImage(i),
        icon: const Icon(
          Icons.clear,
          color: Colors.red,
        ));
  }
}
