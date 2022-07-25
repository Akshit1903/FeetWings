import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  String _phoneNumber;
  bool _incorrectOtp = false;
  void storePhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  String get getPhoneNumber {
    return _phoneNumber;
  }

  void setOtpStatus() {
    _incorrectOtp = !_incorrectOtp;
    notifyListeners();
  }

  bool getOtpStatus() {
    return _incorrectOtp;
  }
}
