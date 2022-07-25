import 'package:flutter/material.dart';

class DateA extends StatelessWidget {

  final String date;
  final String day;
  final int fillColor;

  const DateA({
    this.day,
    this.date,
    this.fillColor
});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                color: Color(fillColor),                  // top square box
                height: 8,
                width: 8,
              ),
            ),
            Container(                                //date
              child: Text(date),
            ),
            Container(                                //day
              child: Text(day),
            ),
          ],
        ),
      ),
    );
  }
}
