import 'dart:typed_data';

import 'package:flutter/material.dart';

class GridChild extends StatelessWidget {
  const GridChild({Key? key, required this.image}) : super(key: key);

  final Uint8List image;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(image.hashCode.toString()),
      decoration: BoxDecoration(
        image: DecorationImage(image: MemoryImage(image)),
      ),
      child: InkWell(
        onTap: () {},
        child: const Text(""),
      ),
    );
  }
}
