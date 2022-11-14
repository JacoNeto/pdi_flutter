import 'package:scidart/numdart.dart';

import 'math_utils.dart';

class ConvolutionKernel extends Object {
  final List<num> convolution;
  final double bias;

  ConvolutionKernel(this.convolution, {this.bias = 0.0});
}

// low pass
ConvolutionKernel avg3x3Kernel = ConvolutionKernel([1, 1, 1, 1, 1, 1, 1, 1, 1]);
ConvolutionKernel avg5x5Kernel = ConvolutionKernel([
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1
]);

// high pass
ConvolutionKernel h1Kernel = ConvolutionKernel([0, -1, 0, -1, 4, -1, 0, -1, 0]);
ConvolutionKernel h2Kernel =
    ConvolutionKernel([-1, -1, -1, -1, 8, -1, -1, -1, -1]);
ConvolutionKernel m1Kernel =
    ConvolutionKernel([-1, -1, -1, -1, 9, -1, -1, -1, -1]);
ConvolutionKernel m2Kernel = ConvolutionKernel([1, -2, 1, -2, 5, -2, 1, -2, 1]);
ConvolutionKernel m3Kernel = ConvolutionKernel([0, -1, 0, -1, 5, -1, 0, -1, 0]);

// Segmentation
ConvolutionKernel pointsKernel =
    ConvolutionKernel([-1, -1, -1, -1, 8, -1, -1, -1, -1]);

ConvolutionKernel h1LineKernel =
    ConvolutionKernel([-1, -1, -1, 2, 2, 2, -1, -1, -1]);
ConvolutionKernel h2LineKernel =
    ConvolutionKernel([-1, -1, 2, -1, 2, -1, 2, -1, -1]);
ConvolutionKernel h3LineKernel =
    ConvolutionKernel([-1, 2, -1, -1, 2, -1, -1, 2, -1]);
ConvolutionKernel h4LineKernel =
    ConvolutionKernel([2, -1, -1, -1, 2, -1, -1, -1, 2]);

// Segmentation - Edge Detection
ConvolutionKernel crossRobertsGx = ConvolutionKernel([1, 0, 0, -1]);
ConvolutionKernel crossRobertsGy = ConvolutionKernel([0, 1, -1, 0]);
ConvolutionKernel robertsGx = ConvolutionKernel([1, 0, -1, 0]);
ConvolutionKernel robertsGy = ConvolutionKernel([1, -1, 0, 0]);
ConvolutionKernel prewittGx = ConvolutionKernel([-1, 0, 1, -1, 0, 1, -1, 0, 1]);
ConvolutionKernel prewittGy = ConvolutionKernel([-1, -1, -1, 0, 0, 0, 1, 1, 1]);
ConvolutionKernel sobelGx = ConvolutionKernel([-1, 0, 1, -2, 0, 2, -1, 0, 1]);
ConvolutionKernel sobelGy = ConvolutionKernel([-1, -2, -1, 0, 0, 0, 1, 2, 1]);

// Segmentation - Edge Detection - Kirsch
List<ConvolutionKernel> kirsch = [
  ConvolutionKernel([5, -3, -3, 5, 0, -3, 5, -3, -3]),
  ConvolutionKernel([-3, -3, -3, 5, 0, -3, 5, 5, -3]),
  ConvolutionKernel([-3, -3, -3, -3, 0, -3, 5, 5, 5]),
  ConvolutionKernel([-3, -3, -3, -3, 0, 5, -3, 5, 5]),
  //
  ConvolutionKernel([-3, -3, 5, -3, 0, 5, -3, -3, 5]),
  ConvolutionKernel([-3, 5, 5, -3, 0, 5, -3, -3, -3]),
  ConvolutionKernel([5, 5, 5, -3, 0, -3, -3, -3, -3]),
  ConvolutionKernel([5, 5, -3, 5, 0, -3, -3, -3, -3]),
];

// Segmentation - Edge Detection - Robison
List<ConvolutionKernel> robison = [
  ConvolutionKernel([1, 0, -1, 2, 0, -2, 1, 0, -1]),
  ConvolutionKernel([0, -1, -2, 1, 0, -1, 2, 1, 0]),
  ConvolutionKernel([-1, -2, -1, 0, 0, 0, 1, 2, 1]),
  ConvolutionKernel([-2, -1, 0, -1, 0, 1, 0, 1, 2]),
  //
  ConvolutionKernel([-1, 0, 1, -2, 0, 2, -1, 0, 1]),
  ConvolutionKernel([0, 1, 2, -1, 0, 1, -2, -1, 0]),
  ConvolutionKernel([1, 2, 1, 0, 0, 0, -1, -2, -1]),
  ConvolutionKernel([2, 1, 0, 1, 0, -1, 0, -1, -2]),
];

// Segmentation - Edge Detection - Frey-Chen
List<ConvolutionKernel> freyChen = [
  ConvolutionKernel(multByNum([1, sqrt2, 1, 0, 0, 0, -1, -sqrt2, -1], 1)),
  ConvolutionKernel(multByNum([1, 0, -1, sqrt2, 0, -sqrt2, 1, 0, -1], 1)),
  ConvolutionKernel(multByNum([0, -1, sqrt2, 1, 0, -1, -sqrt2, 1, 0], 1)),
  ConvolutionKernel(multByNum([sqrt2, -1, 0, -1, 0, 1, 0, 1, -sqrt2], 1)),
  ConvolutionKernel(multByNum([0, 1, 0, -1, 0, -1, 0, 1, 0], 1)),
  ConvolutionKernel(multByNum([-1, 0, 1, 0, 0, 0, 1, 0, -1], 1)),
  ConvolutionKernel(multByNum([1, -2, 1, -2, 4, -2, 1, -2, 1], 1)),
  ConvolutionKernel(multByNum([-2, 1, -2, 1, 4, 1, -2, 1, -2], 1)),
  ConvolutionKernel(multByNum([1, 1, 1, 1, 1, 1, 1, 1, 1], 1)),
];

// Segmentation - Laplacian
ConvolutionKernel laplacianH1 =
    ConvolutionKernel([0, -1, 0, -1, 4, -1, 0, -1, 0]);
ConvolutionKernel laplacianH2 =
    ConvolutionKernel([-1, -4, -1, -4, 20, -4, -1, -4, -1]);
