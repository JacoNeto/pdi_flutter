// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdi_flutter/constants/img_default.dart';
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
  test('Q5 must be correct: ', (() {
    expect(
        Quarters.q5(
            imgDefault,
            imgDefault,
            [
              [0, 1, 2, 3],
              [4, 5, 6, 7],
              [8, 9, 10, 11],
              [12, 13, 14, 15]
            ],
            2,
            2),
        [5, 6, 7, 9, 10, 11, 13, 14, 15]);
  }));
  test('Nagao 2 must be correct: ', (() {
    expect(
        Quarters.n2(
            4,
            4,
            [
              [0, 1, 2, 3],
              [4, 5, 6, 7],
              [8, 9, 10, 11],
              [12, 13, 14, 15]
            ],
            2,
            2),
        [1, 2, 3, 5, 6, 7, 10]);
  }));
  test('Nagao 3 must be correct: ', (() {
    expect(
        Quarters.n3(
            4,
            4,
            [
              [0, 1, 2, 3],
              [4, 5, 6, 7],
              [8, 9, 10, 11],
              [12, 13, 14, 15]
            ],
            2,
            2),
        [10, 7, 0, 11, 0, 15, 0]);
  }));
  test('Nagao 4 must be correct: ', (() {
    expect(
        Quarters.n4(
            4,
            4,
            [
              [0, 1, 2, 3],
              [4, 5, 6, 7],
              [8, 9, 10, 11],
              [12, 13, 14, 15]
            ],
            2,
            2),
        [10, 13, 14, 15, 0, 0, 0]);
  }));
  test('Nagao 5 must be correct: ', (() {
    expect(
        Quarters.n5(
            4,
            4,
            [
              [0, 1, 2, 3],
              [4, 5, 6, 7],
              [8, 9, 10, 11],
              [12, 13, 14, 15]
            ],
            2,
            2),
        [10, 4, 5, 8, 9, 12, 13]);
  }));
}
