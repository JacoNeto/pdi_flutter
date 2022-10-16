import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class LinearTransformationButton extends StatelessWidget {
  const LinearTransformationButton({
    Key? key,
    this.greyRangeOnTap,
    this.negativeOnTap,
  }) : super(key: key);

  final void Function()? greyRangeOnTap;
  final void Function()? negativeOnTap;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.remove,
      icon: Icons.linear_scale,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'Linear Transformation',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "GR",
          ),
          backgroundColor: Colors.grey,
          label: "Greyscale Range",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: greyRangeOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "Neg",
          ),
          backgroundColor: Colors.blue,
          label: "Negative",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: negativeOnTap,
        ),
      ],
    );
  }
}
