import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../provider/app_data.dart';

class PhoneField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      validator: (value) {
        print(value);
        return 'e';
      },
      decoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      initialCountryCode: 'IN',
      onChanged: (phone) {
        print(phone.completeNumber);
        Provider.of<AppData>(context, listen: false)
            .storePhoneNumber(phone.completeNumber);
      },
    );
  }
}
