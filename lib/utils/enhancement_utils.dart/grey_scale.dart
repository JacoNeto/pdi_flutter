class GreyScale {
  static int rangeTransformation(
      int value, int fmin, int fmax, int gmin, int gmax) {
    var g = (gmax - gmin) / (fmax - fmin) * (value - fmin) + gmin;

    return g.round();
  }
}
