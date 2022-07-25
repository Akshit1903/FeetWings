
import 'package:flutter/material.dart';

class TempB extends StatelessWidget {

  final String temp;
  final double top;
  final double left;
  final double height;
  final int fillColor;

  const TempB({
    this.temp,
    this.left,
    this.top,
    this.height,
    this.fillColor
});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top : top,
      left: left,
      child: FlatButton(
        height: height,
        color: Color(fillColor),
        onPressed: (){
          //TODO : button function
        },
        child: Text(
          temp,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: CircleBorder(),
      ),
    );
  }
}
