import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom/custom.dart';
import '../custom/rakaz_deviceid_avatar.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomScreen(
            text: 'Siva',
            deviceIds: ['172818721872891271872817218', '1212122323', '22323'],
          ),
          // CustomScreen(
          //   text: 'Karan',
          //   deviceIds: ['1212718728172817', '73283728372832'],
          // ),
          // CustomScreen(
          //   text: 'Sathish',
          //   deviceIds: [
          //     '1212718728172817',
          //     '73283728372832',
          //     '23672732637267367238234883473427827328783273283263454545456467547656565465'
          //   ],
          //  ),
        ],
      ),
    );
  }
}
