import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/app_data.dart';
import '../models/phone_field.dart';
import '../screens/otp_screen.dart';
import '../screens/content_screen.dart';
import '../home.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String userId;
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;
  String phoneNo;
  Future<void> otpSignIn(BuildContext context) async {
    final appData = Provider.of<AppData>(context, listen: false);
    _auth.verifyPhoneNumber(
      phoneNumber: Provider.of<AppData>(context, listen: false).getPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print('Verify Phone Number');
        print(credential);
        await _auth.signInWithCredential(credential);
        print(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed');
        print(e.code);
        if (e.code == 'network-request-failed') {
          return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx) => AlertDialog(
              title: Text(
                'Network Error',
                textAlign: TextAlign.center,
              ),
              content: Text(
                'Could not connect to the server, check internet connection.',
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text('Close'),
                )
              ],
            ),
          );
        } else {
          return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) {
                return AlertDialog(
                  title: Text('Something went wrong!'),
                  content: Text('Please try again later'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              });
        }
      },
      codeSent: (String verificationId, int resendToken) async {
        Navigator.of(context).pushNamed(OtpScreen.routeName).then((otp) async {
          setState(() {
            _isLoading = false;
          });
          print('Code Sent');
          print(verificationId);
          print('Hi');
          print(resendToken);
          // String smsCode = Provider.of<AppData>(context, listen: false).getOtp;
          print('here is otp');
          print(otp);
          String smsCode = otp;
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          );
          setState(() {
            // _isLoading = true;
          });
          appData.setOtpStatus();

          _isLoading = true;

          Future.delayed(Duration(seconds: 3)).then((_) {
            setState(() {
              _isLoading = false;
            });
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Incorrect OTP'),
                content: Text(
                    'Please enter your number again and provide correct OTP'),
                actions: [
                  ElevatedButton(
                    child: Text("CLOSE"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            );
          });

          await _auth.signInWithCredential(credential);
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop();
          });
          appData.setOtpStatus();
          print('Heloooo');
          setState(() {
            _isLoading = false;
          });
          print(credential.token);
          final user = _auth.currentUser;
          print(user);
          if (user.uid != null) {
            Navigator.of(context).pushReplacementNamed(Home.routeName);
          } else {
            setState(() {
              _isLoading = false;
            });
            await showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Incorrect OTP'),
                content: Text(
                    'Please enter your number again and provide correct OTP'),
                actions: [
                  ElevatedButton(
                    child: Text("CLOSE"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            );
          }
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('code Auto Retriveal Timeout');
        print(verificationId);
      },
      timeout: const Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final appData = Provider.of<AppData>(context, listen: false);
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                ListView(
                  children: [
                    Container(
                      height: deviceSize.height,
                      width: deviceSize.width,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 73, 151, 1),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: deviceSize.height / 2,
                            width: deviceSize.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Image.asset(
                                    'assets/images/login 2.png',
                                    fit: BoxFit.cover,
                                  ),
                                  height: deviceSize.height * 0.2,
                                  width: deviceSize.width * 0.45,
                                ),
                                Column(
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        'We need to send OTP to authenticate your number',
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: deviceSize.height / 2,
                            width: deviceSize.width,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PhoneField(),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (appData.getPhoneNumber.length != 13) {
                                  return showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: Text('Incorrect number'),
                                      content: Text(
                                          'Please enter a valid phone number'),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('CLOSE'),
                                        )
                                      ],
                                    ),
                                  );
                                }
                                setState(() {
                                  _isLoading = true;
                                });
                                await otpSignIn(context);
                              },
                              child: Text(
                                'CONTINUE',
                                style: TextStyle(fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(0, 73, 151, 1),
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ))),
                        )
                      ],
                    ),
                    height: deviceSize.height / 2,
                    width: deviceSize.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
