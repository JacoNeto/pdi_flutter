// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdi_flutter/utils/image_filter_utils.dart';
import 'package:pdi_flutter/utils/math_utils.dart';
import 'package:pdi_flutter/utils/quarters.dart';

void main() {
  test('Mean must be correct: ', (() {
    expect(MathUtils.mean([1, 2, 3, 4, 5, 6]), 3.5);
  }));
  test('Variancy must be correct: ', (() {
    expect(ImageFilterUtils.quadrantVariancy([1, 2, 3, 4, 5, 6]), 3.5);
  }));
}
