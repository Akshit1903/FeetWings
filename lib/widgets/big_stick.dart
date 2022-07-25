
import 'package:flutter/material.dart';

void main() {
  runApp(BigStick());
}

class BigStick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left : 8.0, top: 4.0),
      child: Column(
        children: [
          Container(
            width: 4,
            height: 40,
            color: Colors.grey,
          ),
        ],
      ),
    );

  }
}

class TimeStamp extends StatelessWidget {
  final String time;
  const TimeStamp({
    this.time
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0, left: 20),
      child: Text(time,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.blue[900]
        ),
      ),
    );
  }
}
