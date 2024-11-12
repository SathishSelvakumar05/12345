// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
//
// import 'package:intl/intl.dart';
//
// import '../../../Helper/constants.dart';
// //
// class CustomDateTimePicker extends StatefulWidget {
//   final String placholder;
//   final String? labelName;
//   final DateTime? initialValue;
//   final String name;
//   final DateTime? minimumDate;
//   final bool? enabled;
//   final ValueChanged<DateTime?>? onChanged;
//   const CustomDateTimePicker(
//       {required this.placholder,
//       required this.name,
//       this.labelName,
//       this.enabled,
//       this.onChanged,
//       this.minimumDate,
//       this.initialValue});
//
//   @override
//   State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
// }
//
// class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (widget.labelName != null) ...[
//           Text(
//             widget.labelName!,
//             style: TextStyle(fontSize: 14.sp),
//           ),
//           const SizedBox(height: 10),
//         ],
//         FormBuilderDateTimePicker(
//           name: widget.name,
//           firstDate: DateTime(1950, 1, 1),
//           lastDate: DateTime(2035, 1, 1),
//           currentDate: DateTime.now(),
//           format: DateFormat('dd-MM-yyyy hh:mm a'),
//           initialValue: widget.initialValue,
//           enabled: widget.enabled ?? true,
//           onChanged: (date) {
//             widget.onChanged?.call(date); // Notify parent about change
//           },
//           decoration: InputDecoration(
//             hintText: widget.placholder,
//             // hintStyle: TextStyle(color:Theme.of(context).secondaryHeaderColor,),
//             prefixIcon: Icon(Icons.date_range),
//             filled: true,
//             fillColor: Constants.secondary1,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(7.0),
//               borderSide: BorderSide.none,
//               // borderSide: BorderSide.,
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//               borderSide: BorderSide.none,
//             ),
//             contentPadding: EdgeInsets.symmetric(
//                 vertical: 10.0,
//                 horizontal:
//                     15.0), // Adjust the vertical padding to decrease the height
//           ),
//           validator: FormBuilderValidators.required(
//               errorText: "Please Select the Date"),
//         ),
//         const SizedBox(height: 15),
//       ],
//     );
//   }
// }
