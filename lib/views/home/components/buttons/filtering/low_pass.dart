import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class LowPassButton extends StatelessWidget {
  const LowPassButton({
    Key? key,
    this.average3x3OnTap,
    this.average5x5OnTap,
    this.medianOnTap,
    this.modeOnTap,
  }) : super(key: key);

  final void Function()? average3x3OnTap;
  final void Function()? average5x5OnTap;
  final void Function()? medianOnTap;
  final void Function()? modeOnTap;

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
      tooltip: 'Low Pass Filters',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "Av3",
          ),
          backgroundColor: Colors.red,
          label: "Média 3x3",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: average3x3OnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "Av5",
          ),
          backgroundColor: Colors.red,
          label: "Média 5x5",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: average5x5OnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "ME",
          ),
          backgroundColor: Colors.green,
          label: "Median",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: medianOnTap,
        ),
        SpeedDialChild(
          child: const Text(
            "MO",
          ),
          backgroundColor: Colors.blue,
          label: "Mode",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: modeOnTap,
        ),
      ],
    );
  }
}

class BorderPreservingButton extends StatelessWidget {
  const BorderPreservingButton({
    Key? key,
    this.kuwahara,
    this.tomitaTsuji,
    this.nagaoMatsuyama,
    this.somboonkaew,
  }) : super(key: key);

  final void Function()? kuwahara;
  final void Function()? tomitaTsuji;
  final void Function()? nagaoMatsuyama;
  final void Function()? somboonkaew;

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
      tooltip: 'Low Pass Filters',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Text(
            "K",
          ),
          backgroundColor: Colors.red,
          label: "Kawahara",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: kuwahara,
        ),
        SpeedDialChild(
          child: const Text(
            "T",
          ),
          backgroundColor: Colors.blue,
          label: "Tomita & Tsuji",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: tomitaTsuji,
        ),
        SpeedDialChild(
          child: const Text(
            "N",
          ),
          backgroundColor: Colors.green,
          label: "Nagao & Matsuyama",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: nagaoMatsuyama,
        ),
        SpeedDialChild(
          child: const Text(
            "S",
          ),
          backgroundColor: Colors.orange,
          label: "Somboonkaew",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: somboonkaew,
        ),
      ],
    );
  }
}
