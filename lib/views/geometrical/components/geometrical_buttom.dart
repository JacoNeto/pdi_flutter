import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GeometricalButton extends StatelessWidget {
  const GeometricalButton(
      {Key? key, this.onPressed, required this.title, required this.color})
      : super(key: key);

  final void Function()? onPressed;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(primary: color),
        child: Text(title),
      ),
    );
  }
}
