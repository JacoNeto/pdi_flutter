import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogicalButton extends StatelessWidget {
  const LogicalButton({Key? key, this.andOnTap, this.orOnTap, this.xorOnTap})
      : super(key: key);

  final void Function()? andOnTap;
  final void Function()? orOnTap;
  final void Function()? xorOnTap;

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
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "&",
          ),
          backgroundColor: const Color.fromARGB(255, 168, 54, 244),
          label: "And",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: andOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "|",
          ),
          backgroundColor: const Color.fromARGB(255, 78, 230, 199),
          label: "Or",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: orOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "^",
          ),
          backgroundColor: const Color.fromARGB(255, 99, 17, 50),
          label: "Xor",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: xorOnTap,
        ),
      ],
      child: SvgPicture.asset(
        'assets/icons/bool.svg',
        color: Colors.white,
      ),
    );
  }
}
