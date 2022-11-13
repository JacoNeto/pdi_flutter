import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class RobertsPrewiitButton extends StatelessWidget {
  const RobertsPrewiitButton(
      {Key? key,
      this.crossRobertsOnTap,
      this.robertsOnTap,
      this.prewiitGxOnTap,
      this.prewiitGyOnTap,
      this.prewiitMagnitudeOnTap})
      : super(key: key);

  final void Function()? crossRobertsOnTap;
  final void Function()? robertsOnTap;
  final void Function()? prewiitGxOnTap;
  final void Function()? prewiitGyOnTap;
  final void Function()? prewiitMagnitudeOnTap;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.remove,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'Roberts & Prewiit Gradients',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "CR",
          ),
          backgroundColor: Colors.cyan,
          label: "Cross Roberts",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: crossRobertsOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "R",
          ),
          backgroundColor: Colors.cyan,
          label: "Roberts",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: robertsOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "PGx",
          ),
          backgroundColor: Colors.red,
          label: "Prewiit Gx",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: prewiitGxOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "PGy",
          ),
          backgroundColor: Colors.red,
          label: "Prewiit Gy",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: prewiitGyOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "PM",
          ),
          backgroundColor: Colors.red,
          label: "Prewiit magnitude",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: prewiitMagnitudeOnTap,
        ),
      ],
      child: const Text("RP"),
    );
  }
}

class SobelKrishButton extends StatelessWidget {
  const SobelKrishButton(
      {Key? key,
      this.sobelGxOnTap,
      this.sobelGyOnTap,
      this.sobelMagnitudeOnTap,
      this.krishOnTap})
      : super(key: key);

  final void Function()? sobelGxOnTap;
  final void Function()? sobelGyOnTap;
  final void Function()? sobelMagnitudeOnTap;
  final void Function()? krishOnTap;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.remove,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'Sobel & Krish Gradients',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "PGx",
          ),
          backgroundColor: Colors.purple,
          label: "sobel Gx",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: sobelGxOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "PGy",
          ),
          backgroundColor: Colors.purple,
          label: "sobel Gy",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: sobelGyOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "PM",
          ),
          backgroundColor: Colors.purple,
          label: "sobel magnitude",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: sobelMagnitudeOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "K",
          ),
          backgroundColor: Colors.green,
          label: "Krish",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: krishOnTap,
        ),
      ],
      child: const Text("SK"),
    );
  }
}
