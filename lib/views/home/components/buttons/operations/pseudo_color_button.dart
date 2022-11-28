import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class PseudoColorButton extends StatelessWidget {
  const PseudoColorButton({Key? key, this.pseudoOnTap}) : super(key: key);

  final void Function()? pseudoOnTap;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.remove,
      icon: Icons.colorize_sharp,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'Pseudocolor',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "P",
          ),
          backgroundColor: Colors.red,
          label: "Pseudo Color",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: pseudoOnTap,
        ),
      ],
    );
  }
}
