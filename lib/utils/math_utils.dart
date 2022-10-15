import 'package:flutter/foundation.dart';

class MathUtils {
  // simple mean
  static double mean(List<int> values) {
    int sum = 0;
    for (int i = 0; i < values.length; i++) {
      sum += values[i];
    }
    return sum / values.length;
  }

  // normalize values given a originalRange [min, max] and a newRange [a,b]
  static double normalized(
      double value, double min, double max, double a, double b) {
    return ((b - a) * (value - min)) / max - min;
  }

  // normalize values given a originalRange [min, max] and a newRange [a,b]
  static List<double> normalizeList(
      Uint8List values, double min, double max, double a, double b) {
    List<double> normalizedList = [];
    for (int value in values) {
      normalizedList.add(normalized(value.toDouble(), min, max, a, b));
    }
    return normalizedList;
  }
}
