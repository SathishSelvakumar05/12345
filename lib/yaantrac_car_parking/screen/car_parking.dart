import 'package:flutter/material.dart';

class YaantracCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ClipRect(
            child: Align(
              alignment: Alignment.topRight,
              heightFactor: 0.9,
              child: Image.asset(
                'assets/images/car_parking.gif',
                height: 70,
                width: 70,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
