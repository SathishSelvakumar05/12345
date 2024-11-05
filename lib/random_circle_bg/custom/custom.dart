import 'package:flutter/material.dart';
import 'dart:math';

class DynamicAvatarText extends StatelessWidget {
  final String text;

  DynamicAvatarText({required this.text});
  Color getRandomColor() {
    List<Color> colorList = [
      Colors.brown,
      Colors.red,
      Colors.orange,
      Colors.black87,
      Colors.purple,
    ];

    Random random = Random();
    return colorList[random.nextInt(colorList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: getRandomColor(),
          child: Text(
            text[0].toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'dart:math';
//
// class DynamicAvatarText extends StatelessWidget {
//   final String text;
//   final List<String> deviceIds;
//
//   DynamicAvatarText({required this.text, required this.deviceIds});
//
//   Color getRandomColor() {
//     List<Color> colorList = [
//       Colors.brown,
//       Colors.red,
//       Colors.orange,
//       Colors.black87,
//       Colors.purple,
//     ];
//
//     Random random = Random();
//     return colorList[random.nextInt(colorList.length)];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             CircleAvatar(
//               backgroundColor: getRandomColor(),
//               child: Text(
//                 text[0].toUpperCase(),
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Text(
//               text,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//         ExpansionTile(
//           backgroundColor: Colors.grey.shade200,
//           title: Text('Device ID'),
//           children: deviceIds.map((deviceId) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text('Device ID: $deviceId'),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: ListView(
//         children: [
//           DynamicAvatarText(
//             text: 'John Doe',
//             deviceIds: ['Device 1', 'Device 2', 'Device 3'],
//           ),
//           DynamicAvatarText(
//             text: 'Jane Smith',
//             deviceIds: ['Device A', 'Device B'],
//           ),
//         ],
//       ),
//     ),
//   ));
// }
