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
//ConvolutionKernel prewittGy = ConvolutionKernel([-1, 0, 1, -1, 0, 1, -1, 0, 1]);

/*
ConvolutionKernel crossRobertsGx =
    ConvolutionKernel([1, 0, 0, 0, -1, 0, 0, 0, 0]);
ConvolutionKernel crossRobertsGy =
    ConvolutionKernel([0, 1, 0, -1, 0, 0, 0, 0, 0]);*/
