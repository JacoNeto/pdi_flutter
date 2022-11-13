import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class LinesDetectionButton extends StatelessWidget {
  const LinesDetectionButton({
    Key? key,
    this.h1,
    this.h2,
    this.h3,
    this.h4,
  }) : super(key: key);

  final void Function()? h1;
  final void Function()? h2;
  final void Function()? h3;
  final void Function()? h4;

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
      tooltip: 'Lines Detection Segmentation',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "h1",
          ),
          backgroundColor: Colors.red,
          label: "H1",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: h1,
        ),
        SpeedDialChild(
          child: const Text(
            "h2",
          ),
          backgroundColor: Colors.red,
          label: "H2",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: h2,
        ),
        SpeedDialChild(
          child: const Text(
            "h3",
          ),
          backgroundColor: Colors.red,
          label: "H3",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: h3,
        ),
        SpeedDialChild(
          child: const Text(
            "h4",
          ),
          backgroundColor: Colors.red,
          label: "H4",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: h4,
        ),
      ],
    );
  }
}
