// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomFilePicker extends StatefulWidget {
//   final String name;
//   final String labelName;
//   final Function(File)
//       onImageSelected; // Callback function to pass the selected image
//
//   const CustomFilePicker({
//     Key? key,
//     required this.name,
//     required this.labelName,
//     required this.onImageSelected,
//   }) : super(key: key);
//
//   @override
//   _CustomFilePickerState createState() => _CustomFilePickerState();
// }
//
// class _CustomFilePickerState extends State<CustomFilePicker> {
//   File? imageFile;
//   final picker = ImagePicker();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(widget.labelName, style: TextStyle(fontSize: 16.sp)),
//         SizedBox(height: 5.h),
//         ElevatedButton.icon(
//           onPressed: () async {
//             var file = await picker.pickImage(source: ImageSource.gallery);
//             if (file != null) {
//               setState(() {
//                 imageFile = File(file.path);
//               });
//               // Pass the selected image to the callback
//               widget.onImageSelected(imageFile!);
//             }
//           },
//           icon: Icon(Icons.camera_alt),
//           label: Text('Select Image', style: TextStyle(fontSize: 12.sp)),
//         ),
//         if (imageFile != null)
//           Padding(
//             padding: EdgeInsets.only(top: 10.0, bottom: 10.0).r,
//             child: Image.file(imageFile!, height: 100.h, width: 100.w),
//           ),
//       ],
//     );
//   }
// }
