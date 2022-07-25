
import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(SmallStick());
}

class SmallStick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 6),
        child: Container(
          width: 2,
          height: 20,
          color: Colors.grey,
        ),
      );
  }
}
class SmallSticks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmallStick(),
        SmallStick(),
        SmallStick(),
        SmallStick(),
        SmallStick(),
        SmallStick(),
        SmallStick(),
        SmallStick(),
        SmallStick(),
        SmallStick(),
      ],

    );
  }
}

