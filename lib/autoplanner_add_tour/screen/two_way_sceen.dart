// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class TwoWayScreen extends StatefulWidget {
//   @override
//   _TwoWayScreenState createState() => _TwoWayScreenState();
// }
//
// class _TwoWayScreenState extends State<TwoWayScreen> {
//   final TextEditingController _tourNameController = TextEditingController();
//   final TextEditingController _fromTimeController = TextEditingController();
//   final TextEditingController _toTimeController = TextEditingController();
//   final TextEditingController _returnTimeController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//
//   String? _tourType = 'Round Tour';
//
//   Future<void> _pickTime(TextEditingController controller) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) {
//       final formattedTime = DateFormat.Hm().format(
//         DateTime(0, 0, 0, picked.hour, picked.minute),
//       );
//       setState(() {
//         controller.text = formattedTime;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Tour Name'),
//             TextField(
//               controller: _tourNameController,
//               decoration: InputDecoration(
//                 hintText: 'Enter Tour Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             SizedBox(height: 16),
//             Text('Pickup Window'),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _fromTimeController,
//                     readOnly: false,
//                     decoration: InputDecoration(
//                       hintText: 'hh:mm',
//                       suffixIcon: IconButton(
//                           icon: Icon(Icons.access_time), onPressed: () {}),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: TextField(
//                     controller: _toTimeController,
//                     readOnly: false,
//                     decoration: InputDecoration(
//                       hintText: 'hh:mm',
//                       suffixIcon: IconButton(
//                           icon: Icon(Icons.access_time), onPressed: () {}),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Text('Return Time'),
//             TextField(
//               controller: _returnTimeController,
//               readOnly: false,
//               decoration: InputDecoration(
//                 hintText: 'hh:mm',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.access_time),
//                   onPressed: () => _pickTime(_returnTimeController),
//                 ),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             TextField(
//               controller: _locationController,
//               decoration: InputDecoration(
//                 hintText: 'Enter Tour Location',
//                 suffixIcon: Icon(Icons.location_on),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 24),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextButton(
//                   onPressed: () {},
//                   child: Text('Cancel'),
//                   style: TextButton.styleFrom(
//                     // primary: Colors.black,
//                     backgroundColor: Colors.grey[200],
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Save'),
//                   style: ElevatedButton.styleFrom(
//                     //       color: Colors.blue,
//                     padding: EdgeInsets.symmetric(horizontal: 40),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
