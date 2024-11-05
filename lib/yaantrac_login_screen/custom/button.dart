import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PressButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? txt;
  PressButton({super.key, this.width = 80, this.isResponsive, this.txt});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            txt!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
