import 'dart:math';
import 'dart:typed_data';

import 'package:pdi_flutter/utils/math_utils.dart';

class ImageFilterUtils {
  /// Convolution filter
  static int clampPixel(int x) => x.clamp(0, 255);
  static Uint8List convolute(
      Uint8List pixels, int width, int height, List<num> weights, num bias) {
    var bytes = Uint8List.fromList(pixels);
    int side = sqrt(weights.length).round();
    int halfSide = ~~(side / 2).round() - side % 2;
    int sw = width;
    int sh = height;

    int w = sw;
    int h = sh;

    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        int sy = y;
        int sx = x;
        int dstOff = (y * w + x) * 4;
        num r = bias, g = bias, b = bias;
        for (int cy = 0; cy < side; cy++) {
          for (int cx = 0; cx < side; cx++) {
            int scy = sy + cy - halfSide;
            int scx = sx + cx - halfSide;

            if (scy >= 0 && scy < sh && scx >= 0 && scx < sw) {
              int srcOff = (scy * sw + scx) * 4;
              num wt = weights[cy * side + cx];

              r += bytes[srcOff] * wt;
              g += bytes[srcOff + 1] * wt;
              b += bytes[srcOff + 2] * wt;
            }
          }
        }
        pixels[dstOff] = clampPixel(r.round());
        pixels[dstOff + 1] = clampPixel(g.round());
        pixels[dstOff + 2] = clampPixel(b.round());
      }
    }

    return pixels;
  }

  static List<num> normalizeKernel(List<num> kernel) {
    num sum = 0;
    for (var i = 0; i < kernel.length; i++) {
      sum += kernel[i];
    }
    if (sum != 0 && sum != 1) {
      for (var i = 0; i < kernel.length; i++) {
        kernel[i] /= sum;
      }
    }

    return kernel;
  }

  // Kawahara filter

  // this function calculates the variancy of a given quadrant
  static double quadrantVariancy(List<int> quadrantValues) {
    double maskAverage = MathUtils.mean(quadrantValues);
    double sum = 0;
    int length = quadrantValues.length;

    for (int i = 0; i < length; i++) {
      sum += pow((quadrantValues[i] - maskAverage), 2);
    }

    return sum;
  }
}
