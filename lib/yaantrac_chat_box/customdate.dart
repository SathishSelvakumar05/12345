// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'chat_box.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final TextEditingController startDateTimeController = TextEditingController();
//   final TextEditingController endDateTimeController = TextEditingController();
//   DateTime? selectedStartDate;
//   DateTime? selectedEndDate;
//
//   void showDatePicker(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Container(
//             height: 300,
//             width: 300,
//             child: SfDateRangePicker(
//               rangeTextStyle: TextStyle(color: Colors.red),
//               enablePastDates: true,
//               view: DateRangePickerView.month,
//               showActionButtons: true,
//               confirmText: 'ok',
//               selectionMode: DateRangePickerSelectionMode.range,
//               initialSelectedRange: PickerDateRange(
//                 DateTime.now().subtract(Duration(days: 1)),
//                 DateTime.now().add(Duration(days: 2)),
//               ),
//               onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
//                 if (args.value is PickerDateRange) {
//                   final PickerDateRange dateRange = args.value;
//                   selectedStartDate = dateRange.startDate;
//                   selectedEndDate = dateRange.endDate;
//                 }
//               },
//               onCancel: () {
//                 startDateTimeController.text = '';
//                 endDateTimeController.text = '';
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Selection Cancelled'),
//                     duration: Duration(milliseconds: 500),
//                   ),
//                 );
//               },
//               onSubmit: (value) async {
//                 if (selectedStartDate != null) {
//                   final startTime =
//                       await selectTime(context, 'Select Start Time');
//                   if (startTime != null) {
//                     selectedStartDate = DateTime(
//                       selectedStartDate!.year,
//                       selectedStartDate!.month,
//                       selectedStartDate!.day,
//                       startTime.hour,
//                       startTime.minute,
//                     );
//                     startDateTimeController.text = selectedStartDate.toString();
//                   }
//                 }
//
//                 if (selectedEndDate != null) {
//                   final endTime = await selectTime(context, 'Select End Time');
//                   if (endTime != null) {
//                     selectedEndDate = DateTime(
//                       selectedEndDate!.year,
//                       selectedEndDate!.month,
//                       selectedEndDate!.day,
//                       endTime.hour,
//                       // endTime.minute,
//                     );
//                     endDateTimeController.text = selectedEndDate.toString();
//                   }
//                 }
//
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Added Successfully'),
//                     duration: Duration(milliseconds: 500),
//                   ),
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   // Function to show time picker
//   Future<TimeOfDay?> selectTime(BuildContext context, String title) {
//     return showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//       helpText: title,
//     );
//   }
//
//   void showChatbot(BuildContext context) {
//     showModalBottomSheet(
//       barrierColor: Colors.black.withOpacity(0.5),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//             top: Radius.circular(20.0)), // Rounded top corners
//       ),
//       context: context,
//       builder: (context) {
//         return ChatPage(); // Your chat page widget
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Date and Time Picker Demo'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: startDateTimeController,
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.date_range),
//                     onPressed: () {
//                       showDatePicker(context);
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.green),
//                     borderRadius: BorderRadius.circular(13),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red, width: 2.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 12),
//               TextField(
//                 controller: endDateTimeController,
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.date_range),
//                     onPressed: () {
//                       showDatePicker(context);
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.green),
//                     borderRadius: BorderRadius.circular(13),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red, width: 2.0),
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         showChatbot(context);
//                       },
//                       icon: Icon(Icons.help))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
