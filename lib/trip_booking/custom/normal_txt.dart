import 'package:flutter/cupertino.dart';

class NormalText extends StatelessWidget {
  final String txt;
  Color color;
  double size;

  NormalText(
      {super.key,
      required this.txt,
      this.color = CupertinoColors.black,
      this.size = 15});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
