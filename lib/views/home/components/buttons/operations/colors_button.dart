import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ColorsButton extends StatelessWidget {
  const ColorsButton(
      {Key? key,
      this.redOnTap,
      this.greenOnTap,
      this.blueOnTap,
      this.hsbOntap,
      this.cmykOntap})
      : super(key: key);

  final void Function()? redOnTap;
  final void Function()? greenOnTap;
  final void Function()? blueOnTap;
  final void Function()? hsbOntap;
  final void Function()? cmykOntap;

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
      tooltip: 'Speed Dial',
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
          label: "Red",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: redOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "G",
          ),
          backgroundColor: Colors.green,
          label: "Green",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: greenOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "B",
          ),
          backgroundColor: Colors.blue,
          label: "Blue",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: blueOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "H",
          ),
          backgroundColor: Colors.orange,
          label: "HSB",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: hsbOntap,
        ),
        SpeedDialChild(
          child: const Text(
            "C",
          ),
          backgroundColor: Colors.pink,
          label: "CMYK",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: cmykOntap,
        ),
      ],
    );
  }
}
