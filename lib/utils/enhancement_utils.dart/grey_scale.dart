import 'dart:math';

import 'package:scidart/numdart.dart';

class GreyScale {
  static int rangeTransformation(
      int value, int fmax, int fmin, int gmin, int gmax) {
    var g = (gmax - gmin) / (fmax - fmin) * (value - fmin) + gmin;

    return g.round();
  }

  static int logarithm(int value, int fmax) {
    var a = 255 / log(1 + fmax);
    var g = a * log(value + 1);

    return g.round();
  }

  static int squared(int value, int fmax) {
    var g = sqrt(value);

    return g.round();
  }

  static int exponential(int value, int fmax) {
    var a = 255 / log(1 + fmax);
    var g = exp(value / a);

    return g.round();
  }

  static int square(int value, int fmax) {
    var g = value * value;

    return g > 255 ? 255 : g;
  }
}
