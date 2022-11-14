import 'dart:math';
import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:pdi_flutter/utils/math_utils.dart';

int clampPixel(int x) => x.clamp(0, 255);

class ImageSegmetationUtils {
  /// Convolution filter

  static Uint8List convolutionPoint(Image src, List<num> filter,
      {num div = 1.0, int t = 0}) {
    final tmp = Image.from(src);

    int side = sqrt(filter.length).round();

    for (var y = 0; y < src.height; ++y) {
      for (var x = 0; x < src.width; ++x) {
        final c = tmp.getPixel(x, y);
        num r = 0.0;
        num g = 0.0;
        num b = 0.0;
        final a = getAlpha(c);

        for (var j = 0, fi = 0; j < side; ++j) {
          final yv = min(max(y - 1 + j, 0), src.height - 1);
          for (var i = 0; i < side; ++i, ++fi) {
            final xv = min(max(x - 1 + i, 0), src.width - 1);
            final c2 = tmp.getPixel(xv, yv);
            r += getRed(c2) * filter[fi];
            g += getGreen(c2) * filter[fi];
            b += getBlue(c2) * filter[fi];
          }
        }

        if (r.abs() > t) {
          r = r.abs() > t ? 255 : 0;
        }
        if (g.abs() > t) {
          g = g.abs() > t ? 255 : 0;
        }
        if (b.abs() > t) {
          b = b.abs() > t ? 255 : 0;
        }

        src.setPixel(x, y, getColor(r.toInt(), g.toInt(), b.toInt(), a));
      }
    }

    return src.getBytes(format: Format.rgba);
  }

  static Uint8List convolutionLine(Image src, List<num> filter,
      {num div = 1.0}) {
    final tmp = Image.from(src);
    final aux = Image.from(src);

    int side = sqrt(filter.length).round();

    for (var y = 0; y < src.height; ++y) {
      for (var x = 0; x < src.width; ++x) {
        final c = tmp.getPixel(x, y);
        num r = 0.0;
        num g = 0.0;
        num b = 0.0;
        final a = getAlpha(c);

        for (var j = 0, fi = 0; j < side; ++j) {
          final yv = min(max(y - 1 + j, 0), src.height - 1);
          for (var i = 0; i < side; ++i, ++fi) {
            final xv = min(max(x - 1 + i, 0), src.width - 1);
            final c2 = tmp.getPixel(xv, yv);
            r += getRed(c2) * filter[fi];
            g += getGreen(c2) * filter[fi];
            b += getBlue(c2) * filter[fi];
          }
        }

        r = (r / div);
        g = (g / div);
        b = (b / div);

        r = (r > 255.0) ? 255.0 : ((r < 0.0) ? 0.0 : r);
        g = (g > 255.0) ? 255.0 : ((g < 0.0) ? 0.0 : g);
        b = (b > 255.0) ? 255.0 : ((b < 0.0) ? 0.0 : b);

        aux.setPixel(x, y, getColor(r.toInt(), g.toInt(), b.toInt(), a));
      }
    }

    return aux.getBytes(format: Format.rgba);
  }

  static num gradientMagnitude(num x, num y) {
    return sqrt(pow(x, 2) + pow(y, 2));
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

  static double getImageMean(Uint8List image) {
    int value = 0; // counter for the mean
    int ctrlRBG = 0; // rgb aux
    int length = image.length;
    int cont = 0;
    for (var i = 0; i < length; i++) {
      if (++ctrlRBG > 3) {
        ctrlRBG = 0;
      } else {
        if (value != -1) {
          value += image[i];
          cont++;
        }
      }
    }

    return value / length;
  }
}
