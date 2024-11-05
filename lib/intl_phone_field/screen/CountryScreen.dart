import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  final String countryCode;
  final String phoneNumber;

  CountryScreen({
    Key? key,
    required this.countryCode,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, {
              'countryCode': countryCode,
              'phoneNumber': phoneNumber,
            });
          },
        ),
      ),
      body: Center(
        child: Text('$countryCode - $phoneNumber'),
      ),
    );
  }
}
