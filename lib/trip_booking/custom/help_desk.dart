import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_popup/info_popup.dart';

class HelpDesk extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const HelpDesk({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return InfoPopupWidget(
      customContent: () => Container(
        color: Colors.black,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: onpressed,
                    icon: Icon(
                      Icons.close_outlined,
                      color: Colors.red,
                    ))
              ],
            ),
            Text(
              text,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      child: Icon(Icons.help_outline),
    );
  }
}
