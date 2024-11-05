import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_try/trip_booking/custom/bold_text.dart';

class SquareContainer extends StatelessWidget {
  String? txt;
  IconData? icon;
  bool? IsIcon;
  final Color color;
  final Color bgcolor;
  final Color bordercolor;
  double? Size;
  SquareContainer(
      {super.key,
      this.IsIcon = false,
      this.Size = 50,
      this.txt,
      this.icon,
      required this.color,
      required this.bgcolor,
      required this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            //  margin: EdgeInsets.only(left: 8),
            height: Size,
            width: Size,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: bordercolor, width: 1.0),
                color: bgcolor),
            child: Center(
                child: IsIcon!
                    ? Icon(
                        icon,
                        color: color,
                      )
                    : Text(
                        txt!,
                        style: TextStyle(
                          color: color,
                        ),
                      )),
          ),
        ),
      ],
    );
  }
}
