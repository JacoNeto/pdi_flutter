import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class NonLinearTransformationsButton extends StatelessWidget {
  const NonLinearTransformationsButton({
    Key? key,
    this.log,
    this.squared,
    this.exponential,
    this.square,
  }) : super(key: key);

  final void Function()? log;
  final void Function()? squared;
  final void Function()? exponential;
  final void Function()? square;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.remove,
      icon: Icons.filter,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'Non Linear Transformations',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "Log",
          ),
          backgroundColor: Colors.red,
          label: "Logarithm",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: log,
        ),
        SpeedDialChild(
          child: const Text(
            "Sqd",
          ),
          backgroundColor: Colors.blue,
          label: "Squared",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: squared,
        ),
        SpeedDialChild(
          child: const Text(
            "Exp",
          ),
          backgroundColor: Colors.green,
          label: "Exponential",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: exponential,
        ),
        SpeedDialChild(
          child: const Text(
            "Sq",
          ),
          backgroundColor: Colors.orange,
          label: "Square",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: square,
        ),
      ],
    );
  }
}
