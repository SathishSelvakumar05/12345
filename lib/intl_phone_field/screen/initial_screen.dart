import 'package:flutter/material.dart';
import 'package:new_try/intl_phone_field/screen/screen.dart';

class InitialScreen extends StatelessWidget {
  final String countryCode;
  final String phoneNumber;

  InitialScreen(
      {super.key, this.countryCode = '+971', this.phoneNumber = '1456789'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('$countryCode-$phoneNumber'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PhoneNumberForm(
                    countrycode: countryCode,
                    phno: phoneNumber,
                  ),
                ),
              );
            },
            child: Text('Go to Field'),
          ),
        ],
      ),
    );
  }
}
