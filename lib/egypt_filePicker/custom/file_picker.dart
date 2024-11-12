import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CustomFilePicker extends StatefulWidget {
  final String name;
  final String labelName;
  final List<FormFieldValidator<List<PlatformFile>>>? validators;

  const CustomFilePicker({
    Key? key,
    required this.name,
    required this.labelName,
    this.validators,
  });

  @override
  _CustomFilePickerState createState() => _CustomFilePickerState();
}

class _CustomFilePickerState extends State<CustomFilePicker> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  File? imageFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderField<String>(
            name: widget.name,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            builder: (FormFieldState<String> field) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.labelName, style: TextStyle(fontSize: 16.sp)),
                  SizedBox(height: 5.h),
                  ElevatedButton.icon(
                    onPressed: () async {
                      var file =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (file != null) {
                        setState(() {
                          imageFile = File(file.path);
                        });
                        List<int> imageBytes = await file.readAsBytes();
                        String base64Image = base64Encode(imageBytes);
                        field.didChange(base64Image);
                        print("Base64 Image: $base64Image");
                      }
                    },
                    icon: Icon(Icons.camera_alt),
                    label:
                        Text('Select Image', style: TextStyle(fontSize: 12.sp)),
                  ),
                  if (imageFile != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0).r,
                      child:
                          Image.file(imageFile!, height: 100.h, width: 100.w),
                    ),
                  if (field.hasError)
                    Text(
                      field.errorText!,
                      style: TextStyle(color: Colors.red, fontSize: 14.sp),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // Retrieve the value from the form
  String? getFormValue() {
    return _formKey.currentState?.fields[widget.name]?.value;
  }
}

// class CustomFilePicker extends StatefulWidget {
//   final String name;
//   final String labelName;
//   final List<FormFieldValidator<List<PlatformFile>>>? validators;
//
//   const CustomFilePicker({
//     Key? key,
//     required this.name,
//     required this.labelName,
//     this.validators,
//   });
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
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         FormBuilderField<String>(
//           key: Key('${widget.name}'),
//           name: widget.name,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           builder: (FormFieldState<String> field) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(widget.labelName, style: TextStyle(fontSize: 16.sp)),
//                 SizedBox(height: 5.h),
//                 ElevatedButton.icon(
//                   onPressed: () async {
//                     var file =
//                         await picker.pickImage(source: ImageSource.gallery);
//                     if (file != null) {
//                       setState(() {
//                         imageFile = File(file.path);
//                       });
//                       List<int> imageBytes = await file.readAsBytes();
//                       String base64Image = base64Encode(imageBytes);
//                       field.didChange(base64Image);
//                       print("Base64 Image: $base64Image");
//                     }
//                   },
//                   icon: Icon(Icons.camera_alt),
//                   label:
//                       Text('Select Image', style: TextStyle(fontSize: 12.sp)),
//                 ),
//                 if (imageFile != null)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10.0, bottom: 10.0).r,
//                     child: Image.file(imageFile!, height: 100.h, width: 100.w),
//                   ),
//                 if (field.hasError)
//                   Text(
//                     field.errorText!,
//                     style: TextStyle(color: Colors.red, fontSize: 14.sp),
//                   ),
//               ],
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
