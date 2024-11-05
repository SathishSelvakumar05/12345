import 'package:flutter/material.dart';

import '../custom/custom_notification.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [CustomNotificationIcon(notifycount: '121')],
      ),
      body: Center(
        child: Container(
          child: CustomNotificationIcon(
            notifycount: '12',
          ),
        ),
      ),
    );
  }
}
