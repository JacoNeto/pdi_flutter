import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ArithmeticsButton extends StatelessWidget {
  const ArithmeticsButton({
    Key? key,
    this.plusOnTap,
    this.minusOnTap,
    this.multOnTap,
    this.divOnTap,
  }) : super(key: key);

  final void Function()? plusOnTap;
  final void Function()? minusOnTap;
  final void Function()? multOnTap;
  final void Function()? divOnTap;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.calculate,
      activeIcon: Icons.remove,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'Arithmetics Operations',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          label: "Add",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: plusOnTap,
        ),
        SpeedDialChild(
          child: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromARGB(255, 33, 43, 228),
          label: "Subtract",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: minusOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "X",
          ),
          backgroundColor: const Color.fromARGB(255, 103, 107, 8),
          label: "Multiply",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: multOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "/",
          ),
          backgroundColor: const Color.fromARGB(255, 45, 221, 29),
          label: "Divide",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: divOnTap,
        ),
      ],
    );
  }
}
