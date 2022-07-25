import 'package:flutter/material.dart';
import './feet_temp.dart';
import './widgets/nav%20buttons.dart';
import './widgets/space.dart';
import './widgets/main_area.dart';
import './widgets/date_area.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  static const routeName = '/home';
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
            " All Good \n   Today",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        body: Column(children: [
          Space(space: 20),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Row(
                children: [
                  DateA(
                    day: "wed",
                    date: "22",
                    fillColor: 0xFF6C807F,
                  ),
                  DateA(
                    day: "thu",
                    date: "23",
                    fillColor: 0xFF000000,
                  ),
                  DateA(
                    day: "fri",
                    date: "24",
                    fillColor: 0xFF7A7A7A,
                  ),
                  DateA(
                    day: "sat",
                    date: "25",
                    fillColor: 0xFFFFD700,
                  ),
                  DateA(
                    day: "sun",
                    date: "26",
                    fillColor: 0xFFFF0000,
                  ),
                  DateA(
                    day: "mon",
                    date: "27",
                    fillColor: 0xFF4B0082,
                  ),
                  DateA(
                    day: "tue",
                    date: "28",
                    fillColor: 0xFF00FFFF,
                  ),
                ],
              ),
            ),
            width: 340,
            height: 71,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Space(
            space: 20,
          ),
          Container(
            width: 340,
            height: 297,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("images/smile.jpeg"),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.yellowAccent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.yellow,
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 2.0, //extend the shadow
                )
              ],
            ),
          ),
          Space(space: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonA(image: "images/feet.png"),
              ButtonA(image: "images/thermometer.png"),
              ButtonA(image: "images/sock.png"),
            ],
          ),
          Space(space: 20),
          Container(
            width: 250,
            height: 50,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(50),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.yellow,
              //     blurRadius: 25.0, // soften the shadow
              //     spreadRadius: 5.0, //extend the shadow
              //     // offset: Offset(
              //     //   15.0, // Move to right 10  horizontally
              //     //   15.0, // Move to bottom 10 Vertically
              //     // ),
              //   )
              // ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    Temp();
                  },
                  child: Nav(),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
