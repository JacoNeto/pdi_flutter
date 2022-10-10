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
ConvolutionKernel m2Kernel =
    ConvolutionKernel([-1, -1, -1, -1, 8, -1, -1, -1, -1]);
ConvolutionKernel m3Kernel = ConvolutionKernel([0, -1, 0, -1, 5, -1, 0, -1, 0]);
