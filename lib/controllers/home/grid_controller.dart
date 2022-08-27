import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

import '../../utils/image_utils.dart';

/// The [GridController] is responsible for the state of the
/// [ImageGrid] UI.
class GridController extends GetxController {
  /// [gridChildren] - Uint8List list of the Image Grid.
  var gridChildren = <Uint8List>[].obs;

  // [selectedChildren] - Uint8List list of the Images selected.
  var selectedChildren = <Uint8List?>[].obs;

  /// [i] is a grid list index
  ///   we're using an manual index to manipulate the list with the [AddImage]
  int i = 0;

  /// [addChildToGrid] adds an Widget to the home grid
  void addChildToGrid(Uint8List widget) {
    gridChildren.add(widget);
  }

  /// [addImageTest] adds an image to the home grid
  /// using [addChildToGrid]
  Future<void> addImageTest() async {
    /// list of Image Files selected by the user
    final files = await ImageUtils.getImage();

    if (files != null) {
      /// this for loop adds each image file from the [files] list
      /// into the home grid
      for (XFile xFile in files) {
        var teste = await xFile.readAsBytes();
        addChildToGrid(teste);
      }
    }

    i++; // increments the grid current index
  }
  //////
  //////
  //////
  //////
  //////
  //////
  //////
  //////
  /// [Selected images treatment]

  /// these two observable variables
  ///   [firstSelected] and
  ///   [secondSelected]
  /// indicate the index of the images on the [gridChildren] list
  /// that are selected. At the beginning, no image is selected, so their
  /// values are set to [-1]. It is also their value if an selected image
  /// is unselected.
  Rx<int> firstSelected = Rx<int>(-1);
  Rx<int> secondSelected = Rx<int>(-1);

  /// [selectImage]
  /// Controlls the select business rules of the grid children.
  /// Two children can be selected, the first one and the second one.
  /// When selecting an already selected child, it is unselected.
  ///   params:
  ///   [int i] - the image index in the [gridChildren] list
  void selectImage(int i) {
    if (firstSelected.value == -1 && secondSelected.value == -1) {
      firstSelected.value = i;
    } else if (i == firstSelected.value) {
      firstSelected.value = -1;
    } else if (firstSelected.value != -1 && secondSelected.value == -1) {
      secondSelected.value = i;
    } else if (secondSelected.value == i) {
      secondSelected.value = -1;
    } else {
      firstSelected.value = i;
    }

    if (firstSelected.value != -1) {
      selectedChildren.insert(0, gridChildren.elementAt(firstSelected.value));
    }
    if (secondSelected.value != -1) {
      selectedChildren.insert(1, gridChildren.elementAt(secondSelected.value));
    }
  }

  //////
  //////
  //////
  //////
  //////
  //////
  //////
  ////// [General Operations]

  /// remove from the [gridChildren] list the image at the
  /// index [i]
  void removeImage(int i) {
    if (firstSelected.value == i || secondSelected.value == i) {
      selectImage(i);
    }
    gridChildren.removeAt(i);
  }

  /// clears all data from this [GridController]
  void clear() {
    gridChildren.clear();
    firstSelected.value = -1;
    secondSelected.value = -1;
    i = 0;
  }
}
