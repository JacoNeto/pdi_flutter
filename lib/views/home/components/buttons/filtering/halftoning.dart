import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HalftoningButton extends StatelessWidget {
  const HalftoningButton({
    Key? key,
    this.ordered2x2OnTap,
    this.ordered2x3OnTap,
    this.ordered3x3OnTap,
  }) : super(key: key);

  final void Function()? ordered2x2OnTap;
  final void Function()? ordered2x3OnTap;
  final void Function()? ordered3x3OnTap;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.remove,
      icon: Icons.filter_alt_outlined,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'Low Pass Filters',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "o22",
          ),
          backgroundColor: Colors.red,
          label: "Ordered 2x2",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: ordered2x2OnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "o23",
          ),
          backgroundColor: Colors.red,
          label: "Ordered 2x3",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: ordered2x3OnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "o33",
          ),
          backgroundColor: Colors.red,
          label: "Median 3 x 3",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: ordered3x3OnTap,
        ),
      ],
    );
  }
}
