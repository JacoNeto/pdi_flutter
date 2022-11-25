import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class GeneralTransformationButton extends StatelessWidget {
  const GeneralTransformationButton({
    Key? key,
    this.histogramOnTap,
    this.equOnTap,
    this.gammaOnTap,
    this.bitsOnTap,
  }) : super(key: key);

  final void Function()? histogramOnTap;
  final void Function()? equOnTap;
  final void Function()? gammaOnTap;
  final void Function()? bitsOnTap;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.remove,
      icon: Icons.graphic_eq,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'General Transformations',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "H",
          ),
          backgroundColor: Colors.grey,
          label: "Histogram",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: histogramOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "E",
          ),
          backgroundColor: Colors.grey,
          label: "Equalize",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: equOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "G",
          ),
          backgroundColor: Colors.blue,
          label: "Gamma",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: gammaOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "B",
          ),
          backgroundColor: Colors.green,
          label: "Bits",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: bitsOnTap,
        ),
      ],
    );
  }
}
