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
      tooltip: 'Ordered Dithering',
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

class ErrorDiffusionButton extends StatelessWidget {
  const ErrorDiffusionButton(
      {Key? key,
      this.rogersOnTap,
      this.floydOnTap,
      this.jarvisOnTap,
      this.stuckiOnTap,
      this.stevensonOnTap})
      : super(key: key);

  final void Function()? rogersOnTap;
  final void Function()? floydOnTap;
  final void Function()? jarvisOnTap;
  final void Function()? stuckiOnTap;
  final void Function()? stevensonOnTap;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.remove,
      icon: Icons.directions_off_outlined,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'Error Diffusion Dithering',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "R",
          ),
          backgroundColor: Colors.red,
          label: "Rogers",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: rogersOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "FS",
          ),
          backgroundColor: Colors.green,
          label: "Floyd & Steinberg",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: floydOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "JJN",
          ),
          backgroundColor: Colors.blue,
          label: "Jarvis, Judice & Ninke",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: jarvisOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "S",
          ),
          backgroundColor: Colors.purple,
          label: "Stucki",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: stuckiOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "St",
          ),
          backgroundColor: Colors.purple,
          label: "Stevenson",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: stevensonOnTap,
        ),
      ],
    );
  }
}
