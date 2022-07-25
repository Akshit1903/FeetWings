import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double space;
  const Space({
    this.space
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: space,
    );
  }
}
