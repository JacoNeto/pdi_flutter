import 'package:flutter/foundation.dart';
import 'dart:math';

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

  static int median(List<int> list) {
    list.sort();
    var length = list.length;
    if (length % 2 == 1) {
      return list[(length / 2 + 0.5).toInt()];
    } else {
      return ((list[length ~/ 2] + list[length ~/ 2 + 1]) ~/ 2);
    }
  }

  static int mode(List<int> list) {
    // The output array b[] will
    // have sorted array
    //int []b = new int[n];

    // variable to store max of
    // input array which will
    // to have size of count array
    int maxValue = list.reduce((max));

    // auxiliary(count) array to
    // store count. Initialize
    // count array as 0. Size
    // of count array will be
    // equal to (maxValue + 1).
    int t = maxValue + 1;
    List<int> count = [];
    for (int i = 0; i < t; i++) {
      count.add(0);
    }

    // Store count of each element
    // of input array
    for (int i = 0; i < list.length; i++) {
      count[list[i]]++;
    }

    // mode is the index with maximum count
    int mode = 0;
    int k = count[0];
    for (int i = 1; i < t; i++) {
      if (count[i] > k) {
        k = count[i];
        mode = i;
      }
    }
    return mode;
  }
}

List<num> multByNum(List<num> list, num number) {
  for (int i = 0; i < list.length; i++) {
    list[i] *= number;
  }
  return list;
}
