import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class GlobalThresholdingButton extends StatelessWidget {
  const GlobalThresholdingButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.remove,
      icon: Icons.border_all,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.white,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'Global Thresholding',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: const CircleBorder(),
      onPress: onPressed,
    );
  }
}

class LocalThreshouldingButton extends StatelessWidget {
  const LocalThreshouldingButton({
    Key? key,
    this.meanOnTap,
    this.maxOnTap,
    this.minOnTap,
    this.maxMinOnTap,
    this.niblackOnTap,
  }) : super(key: key);

  final void Function()? meanOnTap;
  final void Function()? maxOnTap;
  final void Function()? minOnTap;
  final void Function()? maxMinOnTap;
  final void Function()? niblackOnTap;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.remove,
      icon: Icons.line_axis,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'Local Thresholding',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "M",
          ),
          backgroundColor: Colors.red,
          label: "Mean",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: meanOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "max",
          ),
          backgroundColor: Colors.purple,
          label: "Maximum",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: maxOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "min",
          ),
          backgroundColor: Colors.blue,
          label: "Minimal",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: minOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "Mm",
          ),
          backgroundColor: Colors.orange,
          label: "MaxMin",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: maxMinOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "N",
          ),
          backgroundColor: Colors.pinkAccent,
          label: "Niblack",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: niblackOnTap,
        ),
      ],
    );
  }
}
