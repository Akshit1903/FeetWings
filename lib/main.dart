import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import '../provider/app_data.dart';
import './screens/auth_screen.dart';
import './screens/otp_screen.dart';
import './screens/content_screen.dart';
import './home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ChangeNotifierProvider(
              create: (ctx) => AppData(),
              child: MaterialApp(
                theme: ThemeData(primaryColor: Color.fromRGBO(0, 73, 151, 1)),
                title: 'FeetWings',
                home: AuthScreen(),
                routes: {
                  OtpScreen.routeName: (ctx) => OtpScreen(),
                  ContentScreen.routeName: (ctx) => ContentScreen(),
                  Home.routeName: (ctx) => Home(),
                },
              ),
            );
          }
        });
  }
}
