import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  bool? isResponsive;
  double? width;
  Button({super.key, this.width = 80, this.isResponsive});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          color: Colors.blue),
      height: 60,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Icon(Icons.navigate_next),
          Icon(Icons.navigate_next),
        ],
      ),
    );
  }
}
