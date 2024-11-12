// // import 'package:flutter/material.dart';
// //
// // class TourForm extends StatefulWidget {
// //   const TourForm({super.key});
// //
// //   @override
// //   State<TourForm> createState() => _TourFormState();
// // }
// //
// // class _TourFormState extends State<TourForm> {
// //   final _tourNameController = TextEditingController();
// //   final _fromTimeController = TextEditingController();
// //   final _toTimeController = TextEditingController();
// //   final _durationController = TextEditingController();
// //   final _bufferTimeController = TextEditingController();
// //   String _tourType = 'Round Tour';
// //
// //   Future<void> _selectTime(TextEditingController controller) async {
// //     final TimeOfDay? picked = await showTimePicker(
// //       context: context,
// //       initialTime: TimeOfDay.now(),
// //     );
// //     if (picked != null) {
// //       setState(() {
// //         controller.text = picked.format(context);
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           const Text('Tour Name'),
// //           TextFormField(
// //             controller: _tourNameController,
// //             decoration: const InputDecoration(
// //               hintText: 'Enter Tour Name',
// //               border: OutlineInputBorder(),
// //             ),
// //           ),
// //           const SizedBox(height: 16.0),
// //           Row(
// //             children: [
// //               const Text('Round Tour'),
// //               Radio<String>(
// //                 value: 'Round Tour',
// //                 groupValue: _tourType,
// //                 onChanged: (value) {
// //                   setState(() {
// //                     _tourType = value!;
// //                   });
// //                 },
// //               ),
// //               const Text('Two Way'),
// //               Radio<String>(
// //                 value: 'Two Way',
// //                 groupValue: _tourType,
// //                 onChanged: (value) {
// //                   setState(() {
// //                     _tourType = value!;
// //                   });
// //                 },
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 16.0),
// //           const Text('Pickup Time'),
// //           Row(
// //             children: [
// //               Expanded(
// //                 child: TextFormField(
// //                   controller: _fromTimeController,
// //                   readOnly: true,
// //                   decoration: InputDecoration(
// //                     hintText: 'hh:mm',
// //                     suffixIcon: IconButton(
// //                       icon: const Icon(Icons.access_time),
// //                       onPressed: () => _selectTime(_fromTimeController),
// //                     ),
// //                     border: const OutlineInputBorder(),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(width: 16.0),
// //               Expanded(
// //                 child: TextFormField(
// //                   controller: _toTimeController,
// //                   readOnly: true,
// //                   decoration: InputDecoration(
// //                     hintText: 'hh:mm',
// //                     suffixIcon: IconButton(
// //                       icon: const Icon(Icons.access_time),
// //                       onPressed: () => _selectTime(_toTimeController),
// //                     ),
// //                     border: const OutlineInputBorder(),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 16.0),
// //           const Text('Time Duration'),
// //           TextFormField(
// //             controller: _durationController,
// //             readOnly: true,
// //             decoration: InputDecoration(
// //               hintText: 'hh:mm',
// //               suffixIcon: IconButton(
// //                 icon: const Icon(Icons.access_time),
// //                 onPressed: () => _selectTime(_durationController),
// //               ),
// //               border: const OutlineInputBorder(),
// //             ),
// //           ),
// //           const Text('Buffer Time'),
// //           TextFormField(
// //             controller: _bufferTimeController,
// //             readOnly: true,
// //             decoration: InputDecoration(
// //               hintText: '00:30',
// //               suffixIcon: IconButton(
// //                 icon: const Icon(Icons.access_time),
// //                 onPressed: () => _selectTime(_bufferTimeController),
// //               ),
// //               border: const OutlineInputBorder(),
// //             ),
// //           ),
// //           const Spacer(),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               OutlinedButton(
// //                 onPressed: () {},
// //                 child: const Text('Cancel'),
// //               ),
// //               ElevatedButton(
// //                 onPressed: () {},
// //                 child: const Text('Save'),
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.blue,
// //                   minimumSize: const Size(100, 50),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:show_up_animation/show_up_animation.dart';
//
// class SettingsScreen1 extends StatelessWidget {
//   const SettingsScreen1({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final List<String> items = [
//       'WATER QUALITY',
//       'AIR QUALITY',
//       'WATER RESIDENTIAL',
//     ];
//     List ImagesList = [
//       'images/water.jpg',
//       'images/default.jpg',
//       'images/streetlight.jpg'
//     ];
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 1,
//           childAspectRatio: 2,
//           mainAxisSpacing: 10,
//           crossAxisSpacing: 10,
//         ),
//         padding: const EdgeInsets.all(10),
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           final data = items[index];
//           return ShowUpAnimation(
//             direction: Direction.horizontal,
//             animationDuration: const Duration(milliseconds: 1500),
//             delayStart:
//                 Duration(milliseconds: index * 800), // Stagger the animations
//             offset: -0.8,
//             child: GridTile(
//               header: GridTileBar(
//                 backgroundColor: Colors.black45,
//                 title: Center(
//                   child: Text(
//                     data,
//                     style: TextStyle(color: Colors.white, fontSize: 23),
//                   ),
//                 ),
//               ),
//               child: Container(
//                 child: ImageFiltered(
//                   imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//                   child: Image.asset(
//                     ImagesList[index],
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                     height: double.infinity,
//                   ),
//                 ),
//               ),
//               footer: GridTileBar(
//                 backgroundColor: Colors.black45,
//                 leading: IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.edit),
//                 ),
//                 trailing: IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.delete),
//                 ),
//                 title: GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     height: 50,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.remove_red_eye_outlined,
//                           color: Colors.white,
//                         ),
//                         SizedBox(
//                           width: 12,
//                         ),
//                         Text(
//                           "View",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
