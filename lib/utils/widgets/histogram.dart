import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Histogram extends StatelessWidget {
  const Histogram({super.key, required this.imageBytes});

  final Uint8List imageBytes;

  @override
  Widget build(BuildContext context) {
    List<Pair> greyScaleList = [];
    for (int i = 0; i < imageBytes.length; i += 4) {
      greyScaleList.add(Pair(imageBytes[i], i));
    }
    /*var histogram = Uint8List(256);
    for (int j = 0; j < 256; j++) {
      for (var i = 0; i < imageBytes.length; i += 4) {
        if (imageBytes[i] == j) {
          histogram[j]++;
        }
      }
    }
    for (int j = 0; j < 256; j++) {
      greyScaleList.add(Pair(histogram[j], j));
    }*/
    return SfCartesianChart(series: <ChartSeries>[
      HistogramSeries<Pair, num>(
          dataSource: greyScaleList,
          yValueMapper: (Pair pair, _) => pair.value,
          binInterval: 4,
          showNormalDistributionCurve: true,
          emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.zero),
          xAxisName: "Grey Levels",
          yAxisName: "Pixels",
          curveColor: const Color.fromRGBO(192, 108, 132, 1),
          borderWidth: 3),
    ]);
  }
}

class Pair {
  int value;
  int index;

  Pair(this.value, this.index);
}
