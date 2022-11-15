import 'package:flutter/material.dart';

class MyLittleCloseButton extends StatelessWidget {
  const MyLittleCloseButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: const Icon(Icons.close));
  }
}
