import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/image_utils.dart';

/// The [GridController] is responsible for the state of the
/// [ImageGrid] UI.
///
/// Attributes:
/// [gridChildren] - Widget list of the Image Grid
///   this widget list has both the images already
///   uploaded AND the [UploadImage] widget.
class GridController extends GetxController {
  var gridChildren = <Widget>[].obs;
  int i = 0;

  void addChildToGrid(Widget widget) {
    gridChildren.insert(i, widget);
  }

  void addTest() {
    final fruits = <String>["samsung", "banana", "strawberry"];

    addChildToGrid(
      Container(
        key: Key(fruits.elementAt(0) + i.toString()),
        color: Colors.lightBlue,
        child: InkWell(
          onTap: () => print("terkf"),
          child: Text(
            fruits.elementAt(0),
          ),
        ),
      ),
    );
    i++;
  }

  Future<void> addImageTest() async {
    print("chegou naruto");
    final file = await ImageUtils.getImage();

    var teste = await file!.elementAt(0).readAsBytes();

    addChildToGrid(
      Container(
        key: Key(file.hashCode.toString()),
        decoration: BoxDecoration(
          image: DecorationImage(image: MemoryImage(teste)),
        ),
      ),
    );
    i++;
  }

  void clear() {
    gridChildren.clear();
    i = 0;
  }
}
