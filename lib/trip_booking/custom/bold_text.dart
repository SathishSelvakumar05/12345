import 'package:flutter/cupertino.dart';

class BoldText extends StatelessWidget {
  final String txt;
  Color color;
  double size;

  BoldText(
      {super.key,
      required this.txt,
      this.color = CupertinoColors.black,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: size,
      ),
    );
  }
}
