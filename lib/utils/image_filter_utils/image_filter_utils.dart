import 'dart:math';
import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:pdi_flutter/utils/math_utils.dart';

class ImageFilterUtils {
  /// Convolution filter
  static int clampPixel(int x) => x.clamp(0, 255);

  static Uint8List convolution(Image src, List<num> filter,
      {num div = 1.0, num offset = 0.0}) {
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

        r = (r / div) + offset;
        g = (g / div) + offset;
        b = (b / div) + offset;

        r = (r > 255.0) ? 255.0 : ((r < 0.0) ? 0.0 : r);
        g = (g > 255.0) ? 255.0 : ((g < 0.0) ? 0.0 : g);
        b = (b > 255.0) ? 255.0 : ((b < 0.0) ? 0.0 : b);

        src.setPixel(x, y, getColor(r.toInt(), g.toInt(), b.toInt(), a));
      }
    }

    return src.getBytes(format: Format.rgba);
  }

  static Uint8List convolutionMean(Image src, List<num> filter,
      {num div = 1.0, num offset = 0.0}) {
    final tmp = Image.from(src);

    int side = sqrt(filter.length).round();

    for (var y = 0; y < src.height; ++y) {
      for (var x = 0; x < src.width; ++x) {
        final c = tmp.getPixel(x, y);
        num r = 0.0;
        num g = 0.0;
        num b = 0.0;
        final a = getAlpha(c);

        var cont = 0;
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

        r = (r / filter.length) + offset;
        g = (g / filter.length) + offset;
        b = (b / filter.length) + offset;

        r = (r > 255.0) ? 255.0 : ((r < 0.0) ? 0.0 : r);
        g = (g > 255.0) ? 255.0 : ((g < 0.0) ? 0.0 : g);
        b = (b > 255.0) ? 255.0 : ((b < 0.0) ? 0.0 : b);

        src.setPixel(x, y, getColor(r.toInt(), g.toInt(), b.toInt(), a));
      }
    }

    return src.getBytes(format: Format.rgba);
  }

  static Uint8List convolutionMedian(Image src, List<num> filter,
      {num div = 1.0, num offset = 0.0}) {
    final tmp = Image.from(src);

    int side = sqrt(filter.length).round();

    for (var y = 0; y < src.height; ++y) {
      for (var x = 0; x < src.width; ++x) {
        final c = tmp.getPixel(x, y);
        num r = 0.0;
        num g = 0.0;
        num b = 0.0;
        final a = getAlpha(c);

        List<int> medianListR = [];
        List<int> medianListG = [];
        List<int> medianListB = [];
        for (var j = 0, fi = 0; j < side; ++j) {
          final yv = min(max(y - 1 + j, 0), src.height - 1);
          for (var i = 0; i < side; ++i, ++fi) {
            final xv = min(max(x - 1 + i, 0), src.width - 1);
            final c2 = tmp.getPixel(xv, yv);
            medianListR.add(getRed(c2) * filter[fi].toInt());
            medianListG.add(getGreen(c2) * filter[fi].toInt());
            medianListB.add(getBlue(c2) * filter[fi].toInt());
          }
        }

        r = MathUtils.median(medianListR);
        g = MathUtils.median(medianListG);
        b = MathUtils.median(medianListB);

        r = (r > 255.0) ? 255.0 : ((r < 0.0) ? 0.0 : r);
        g = (g > 255.0) ? 255.0 : ((g < 0.0) ? 0.0 : g);
        b = (b > 255.0) ? 255.0 : ((b < 0.0) ? 0.0 : b);

        src.setPixel(x, y, getColor(r.toInt(), g.toInt(), b.toInt(), a));
      }
    }

    return src.getBytes(format: Format.rgba);
  }

  static Uint8List convolutionMode(Image src, List<num> filter,
      {num div = 1.0, num offset = 0.0}) {
    final tmp = Image.from(src);

    int side = sqrt(filter.length).round();

    for (var y = 0; y < src.height; ++y) {
      for (var x = 0; x < src.width; ++x) {
        final c = tmp.getPixel(x, y);
        num r = 0.0;
        num g = 0.0;
        num b = 0.0;
        final a = getAlpha(c);

        List<int> medianListR = [];
        List<int> medianListG = [];
        List<int> medianListB = [];
        for (var j = 0, fi = 0; j < side; ++j) {
          final yv = min(max(y - 1 + j, 0), src.height - 1);
          for (var i = 0; i < side; ++i, ++fi) {
            final xv = min(max(x - 1 + i, 0), src.width - 1);
            final c2 = tmp.getPixel(xv, yv);
            medianListR.add(getRed(c2) * filter[fi].toInt());
            medianListG.add(getGreen(c2) * filter[fi].toInt());
            medianListB.add(getBlue(c2) * filter[fi].toInt());
          }
        }

        r = MathUtils.mode(medianListR);
        g = MathUtils.mode(medianListG);
        b = MathUtils.mode(medianListB);

        r = (r > 255.0) ? 255.0 : ((r < 0.0) ? 0.0 : r);
        g = (g > 255.0) ? 255.0 : ((g < 0.0) ? 0.0 : g);
        b = (b > 255.0) ? 255.0 : ((b < 0.0) ? 0.0 : b);

        src.setPixel(x, y, getColor(r.toInt(), g.toInt(), b.toInt(), a));
      }
    }

    return src.getBytes(format: Format.rgba);
  }

  static Uint8List convolutionMax(Image src, List<num> filter,
      {num div = 1.0, num offset = 0.0}) {
    final tmp = Image.from(src);

    int side = sqrt(filter.length).round();

    for (var y = 0; y < src.height; ++y) {
      for (var x = 0; x < src.width; ++x) {
        final c = tmp.getPixel(x, y);
        num r = 0.0;
        num g = 0.0;
        num b = 0.0;
        final a = getAlpha(c);

        List<int> medianListR = [];
        List<int> medianListG = [];
        List<int> medianListB = [];
        for (var j = 0, fi = 0; j < side; ++j) {
          final yv = min(max(y - 1 + j, 0), src.height - 1);
          for (var i = 0; i < side; ++i, ++fi) {
            final xv = min(max(x - 1 + i, 0), src.width - 1);
            final c2 = tmp.getPixel(xv, yv);
            medianListR.add(getRed(c2) * filter[fi].toInt());
            medianListG.add(getGreen(c2) * filter[fi].toInt());
            medianListB.add(getBlue(c2) * filter[fi].toInt());
          }
        }

        r = medianListR.reduce(max);
        g = medianListG.reduce(max);
        b = medianListB.reduce(max);

        r = (r > 255.0) ? 255.0 : ((r < 0.0) ? 0.0 : r);
        g = (g > 255.0) ? 255.0 : ((g < 0.0) ? 0.0 : g);
        b = (b > 255.0) ? 255.0 : ((b < 0.0) ? 0.0 : b);

        src.setPixel(x, y, getColor(r.toInt(), g.toInt(), b.toInt(), a));
      }
    }

    return src.getBytes(format: Format.rgba);
  }

  static Uint8List convolutionMin(Image src, List<num> filter,
      {num div = 1.0, num offset = 0.0}) {
    final tmp = Image.from(src);

    int side = sqrt(filter.length).round();

    for (var y = 0; y < src.height; ++y) {
      for (var x = 0; x < src.width; ++x) {
        final c = tmp.getPixel(x, y);
        num r = 0.0;
        num g = 0.0;
        num b = 0.0;
        final a = getAlpha(c);

        List<int> medianListR = [];
        List<int> medianListG = [];
        List<int> medianListB = [];
        for (var j = 0, fi = 0; j < side; ++j) {
          final yv = min(max(y - 1 + j, 0), src.height - 1);
          for (var i = 0; i < side; ++i, ++fi) {
            final xv = min(max(x - 1 + i, 0), src.width - 1);
            final c2 = tmp.getPixel(xv, yv);
            medianListR.add(getRed(c2) * filter[fi].toInt());
            medianListG.add(getGreen(c2) * filter[fi].toInt());
            medianListB.add(getBlue(c2) * filter[fi].toInt());
          }
        }

        r = medianListR.reduce(min);
        g = medianListG.reduce(min);
        b = medianListB.reduce(min);

        r = (r > 255.0) ? 255.0 : ((r < 0.0) ? 0.0 : r);
        g = (g > 255.0) ? 255.0 : ((g < 0.0) ? 0.0 : g);
        b = (b > 255.0) ? 255.0 : ((b < 0.0) ? 0.0 : b);

        src.setPixel(x, y, getColor(r.toInt(), g.toInt(), b.toInt(), a));
      }
    }

    return src.getBytes(format: Format.rgba);
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
