import 'package:flutter/material.dart';
class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.center ,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FlatButton(
            onPressed: () {
              // TODO:  left button functionality
            },
            child: Container(
              height: 50,
              width: 40,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/glucose_meter.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              // TODO:  middle button functionality
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/home_button.png"),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.blue,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              // TODO:  right button functionality
            },
            child: Container(
              height: 40,
              width: 50,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/activity_icon.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
