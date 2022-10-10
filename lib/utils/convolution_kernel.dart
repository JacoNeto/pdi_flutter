class ConvolutionKernel extends Object {
  final List<num> convolution;
  final double bias;

  ConvolutionKernel(this.convolution, {this.bias = 0.0});
}

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
