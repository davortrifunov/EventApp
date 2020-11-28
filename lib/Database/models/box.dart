import 'package:flutter/material.dart';

class Boxx extends StatelessWidget {
  Boxx(this.height);
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
