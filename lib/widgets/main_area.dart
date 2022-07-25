import 'package:flutter/material.dart';

class ButtonA extends StatelessWidget {
  final String image;
  const ButtonA({
    this.image
});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){
        // TODO:  button functionality
      },
      child: Container(
        height: 80,
        width: 80,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
