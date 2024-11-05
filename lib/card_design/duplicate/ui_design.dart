//
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey[200],
//         appBar: AppBar(
//           title: Text('Folder-like Container'),
//         ),
//         body: Center(
//           child: FolderContainer(),
//         ),
//       ),
//     );
//   }
// }
//
// class FolderContainer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Stack(
//           children: [
//             // Main folder tab container with rounded top-left corner
//             Container(
//               width: 150,
//               height: 30,
//               decoration: BoxDecoration(
//                 color: Colors.amber[400],
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10), // Rounded top-left corner
//                 ),
//               ),
//             ),
//             // Overlaying a rotated container to create the 45-degree cut on the right side
//             Positioned(
//               right: 0,
//               child: Transform.rotate(
//                 angle: -0.785398, // -45 degrees in radians
//                 child: Container(
//                   width: 30,
//                   height: 30,
//                   color: Colors
//                       .grey[200], // Background color to blend with the scaffold
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // Body of the folder
//         Container(
//           width: 150,
//           height: 120,
//           decoration: BoxDecoration(
//             color: Colors.amber,
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(10),
//               bottomRight: Radius.circular(10),
//             ),
//           ),
//           child: Center(
//             child: Text(
//               'My Folder',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
