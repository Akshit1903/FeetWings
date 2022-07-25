import './widgets/big_stick.dart';
import './widgets/nav%20buttons.dart';
import './widgets/small_stick.dart';
import './widgets/space.dart';
import './widgets/temp_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';

void main() {
  runApp(Temp());
}

class Temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              // TODO: back button functionality
            },
          ),
          title: Text(
            " Fri , 26 March\n   Temperature",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BigStick(),
                SmallSticks(),
                BigStick(),
                SmallSticks(),
                BigStick(),
                SmallSticks(),
                BigStick(),
                // SmallSticks(),
                // BigStick(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 30,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       color: Colors.grey,
                    //       width: 0.5,
                    //     ),
                    // ),
                    child: Row(
                      children: [
                        TimeStamp(
                          time: "4am ",
                        ),
                        TimeStamp(
                          time: "6am",
                        ),
                        TimeStamp(
                          time: "8am",
                        ),
                        // TimeStamp(time: "10 pm",),
                        // TimeStamp(time: "12 pm",),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            "NOW",
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.blue[900]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Space(
              space: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 470,
                width: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/feettemp.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    TempB(
                      temp: "99°",
                      height: 40,
                      top: 10,
                      left: 85,
                      fillColor: 0xFF0ACEA2,
                    ), // top
                    TempB(
                      temp: "99°",
                      height: 40,
                      top: 10,
                      left: 186,
                      fillColor: 0xFF0ACEA2,
                    ),
                    TempB(
                      temp: "99°",
                      height: 40,
                      top: 80,
                      left: 80,
                      fillColor: 0xFF0ACEA2,
                    ),
                    TempB(
                      temp: "99°",
                      height: 40,
                      top: 80,
                      left: 195,
                      fillColor: 0xFF0ACEA2,
                    ),
                    TempB(
                      temp: "99°",
                      height: 40,
                      top: 105,
                      left: 40,
                      fillColor: 0xFF0ACEA2,
                    ),
                    TempB(
                      temp: "99°",
                      height: 40,
                      top: 105,
                      left: 235,
                      fillColor: 0xFF0ACEA2,
                    ),
                    TempB(
                      temp: "99°",
                      height: 40,
                      top: 140,
                      left: 12,
                      fillColor: 0xFF0ACEA2,
                    ),
                    TempB(
                      temp: "99°",
                      height: 40,
                      top: 140,
                      left: 263,
                      fillColor: 0xFF0ACEA2,
                    ),
                    TempB(
                      temp: "99°",
                      height: 60,
                      top: 200,
                      left: 42,
                      fillColor: 0xFF0ACEA2,
                    ),
                    TempB(
                      temp: "99°",
                      height: 60,
                      top: 200,
                      left: 233,
                      fillColor: 0xFF0ACEA2,
                    ),
                    TempB(
                      temp: "99°",
                      height: 60,
                      top: 280,
                      left: 52,
                      fillColor: 0xFFE94560,
                    ),
                    TempB(
                      temp: "99°",
                      height: 60,
                      top: 280,
                      left: 223,
                      fillColor: 0xFF0ACEA2,
                    ), // bottom
                  ],
                ),
              ),
            ),
            Nav(),
          ],
        ),
      ),
    );
  }
}
