import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  static const routeName = '/content';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Content'),
      ),
      body: Center(
        child: Text('Youre Authenticated'),
      ),
    );
  }
}
