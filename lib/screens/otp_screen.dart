import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../provider/app_data.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otp';
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp;
  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context, listen: false);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
                              'assets/images/smartphone 2.png',
                              fit: BoxFit.cover,
                            ),
                            height: deviceSize.height * 0.2,
                            width: deviceSize.width * 0.45,
                          ),
                          Column(
                            children: [
                              FittedBox(
                                child: Text(
                                  'OTP',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Please enter OTP sent to your number',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    child: OTPTextField(
                      length: 6,
                      width: deviceSize.width,
                      fieldWidth: deviceSize.width / 7,
                      style: TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                        otp = pin;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(otp);
                          print(appData.getOtpStatus());
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
                  ),
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
