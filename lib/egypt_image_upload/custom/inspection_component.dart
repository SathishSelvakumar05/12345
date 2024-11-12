// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tracking/EgyptModule/Components/CustomTextfield/CustomRadioButton.dart';
// import 'package:uuid/uuid.dart';
//
// import 'CustomFilePicker.dart';
//
// class InspectionComponent extends StatefulWidget {
//   final String title;
//   final List<String> description;
//   final List<FormBuilderFieldOption<String>> radioOptions;
//   final String radioGroupName;
//   final String? radioGroupLabel;
//   final Widget? notesWidget;
//
//   const InspectionComponent({
//     required this.title,
//     required this.description,
//     required this.radioOptions,
//     required this.radioGroupName,
//     this.radioGroupLabel,
//     this.notesWidget,
//   });
//
//   @override
//   State<InspectionComponent> createState() => _InspectionComponentState();
// }
//
// class _InspectionComponentState extends State<InspectionComponent> {
//   final Uuid uuid = Uuid();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         SizedBox(height: 10.h),
//         ExpansionTile(
//           title: Text(
//             widget.title,
//             style: TextStyle(fontSize: 16.sp),
//           ),
//           children: [
//             ...widget.description.map((e) {
//               final uniqueRadioGroupName = e.split(":")[0];
//               return Column(
//                 children: [
//                   Text(e, style: TextStyle(fontSize: 16.sp)),
//                   CustomRadioGroup(
//                     name: e.split(":")[0],
//                     labelName: widget.radioGroupLabel,
//                     options: widget.radioOptions,
//                   ),
//                   CustomFilePicker(
//                     name: e.split(":")[0] + "img",
//                     labelName: '',
//                   ),
//                 ],
//               );
//             }).toList(),
//             widget.notesWidget!
//           ],
//         ),
//       ],
//     );
//   }
// }
