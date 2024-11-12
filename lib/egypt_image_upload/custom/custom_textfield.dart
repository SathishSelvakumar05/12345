// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
//
// import '../../../Helper/constants.dart';
//
// class CustomTextField extends StatelessWidget {
//   final String placeHolder;
//   final String name;
//   final bool isRead;
//   final Icon? prefixIcon;
//   final Icon? suffixIcon;
//   final String? labelName;
//   final dynamic? initialValue;
//   final TextInputType? keyBoardType;
//   final List<TextInputFormatter>? inputformat;
//   final TextEditingController? textEditingController;
//   final Icon? icon;
//   final List<String? Function(String?)> validators;
//   final Function? suffixClick;
//   final Function? prefixClick;
//
//   const CustomTextField({
//     required this.name,
//     required this.placeHolder,
//     this.icon,
//     this.isRead = false,
//     this.suffixClick,
//     this.prefixClick,
//     this.inputformat,
//     this.labelName,
//     required this.validators,
//     this.initialValue,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.keyBoardType,
//     this.textEditingController,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (labelName != null) ...[
//           Text(
//             labelName!,
//             style: TextStyle(fontSize: 14.sp),
//           ),
//           const SizedBox(height: 10),
//         ],
//         FormBuilderTextField(
//           key: Key('${name}'),
//           name: name,
//           controller: textEditingController,
//           initialValue: initialValue,
//           inputFormatters: inputformat,
//           readOnly: isRead,
//           keyboardType:
//               keyBoardType != null ? TextInputType.number : TextInputType.text,
//           decoration: InputDecoration(
//             hintText: placeHolder,
//             prefixIcon: prefixIcon != null
//                 ? GestureDetector(
//                     onTap: () {
//                       prefixClick!();
//                     },
//                     child: SizedBox(child: prefixIcon),
//                   )
//                 : null,
//             suffixIcon: suffixIcon != null
//                 ? GestureDetector(
//                     onTap: () {
//                       suffixClick!();
//                     },
//                     child: SizedBox(child: suffixIcon),
//                   )
//                 : null,
//             filled: true,
//             fillColor: Constants.secondary1,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(7.0),
//               borderSide: BorderSide.none,
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
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           validator: validators != null
//               ? FormBuilderValidators.compose(validators)
//               : null,
//         ),
//         const SizedBox(height: 15),
//       ],
//     );
//   }
// }
