import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HighPassButton extends StatelessWidget {
  const HighPassButton({
    Key? key,
    this.h1,
    this.h2,
    this.m1,
    this.m2,
    this.m3,
  }) : super(key: key);

  final void Function()? h1;
  final void Function()? h2;
  final void Function()? m1;
  final void Function()? m2;
  final void Function()? m3;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.remove,
      icon: Icons.color_lens,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'High Pass Filters',
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
            "m1",
          ),
          backgroundColor: Colors.green,
          label: "M1",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: m1,
        ),
        SpeedDialChild(
          child: const Text(
            "m2",
          ),
          backgroundColor: Colors.green,
          label: "M2",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: m2,
        ),
        SpeedDialChild(
          child: const Text(
            "m3",
          ),
          backgroundColor: Colors.green,
          label: "M3",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: m3,
        ),
      ],
    );
  }
}

class HighBoostButton extends StatelessWidget {
  const HighBoostButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.remove,
      icon: Icons.high_quality,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.white,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'High Boost',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: const CircleBorder(),
      onPress: onPressed,
    );
  }
}
