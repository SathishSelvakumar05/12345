import 'package:flutter/material.dart';

class CustomNotificationIcon extends StatelessWidget {
  final String notifycount;
  const CustomNotificationIcon({super.key, required this.notifycount});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {},
        icon: Stack(
          children: [
            Icon(
              Icons.notifications,
              size: 40,
            ),
            Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: 16,
                    maxHeight: 16,
                  ),
                  child: Text(
                    notifycount,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      ),
      //   SizedBox(
      //     height: 20,
      //   )
      // ],
    );
  }
}
