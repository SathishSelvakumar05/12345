// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
//
// class CustomAddressTextField extends StatelessWidget {
//   final String placeHolder;
//   final String name;
//   final String? labelName;
//   final bool? readOnly;
//   final String? initialValue;
//   final TextInputType? keyBoardType;
//   final List<TextInputFormatter>? inputformat;
//   final TextEditingController? textEditingController;
//   final Icon? icon;
//   final IconButton? suffixIcon;
//   final List<String? Function(String?)> validators;
//
//   const CustomAddressTextField({
//     required this.name,
//     required this.placeHolder,
//     this.icon,
//     this.labelName,
//     required this.validators,
//     this.initialValue,
//     this.keyBoardType,
//     this.textEditingController,
//     this.suffixIcon,
//     this.inputformat,
//     this.readOnly = false,
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
//             style: TextStyle(fontSize: 15),
//           ),
//           const SizedBox(height: 10),
//         ],
//         FormBuilderTextField(
//           key: Key('${name}'),
//           name: name,
//           controller: textEditingController,
//           initialValue: initialValue,
//           inputFormatters: inputformat,
//           keyboardType:
//               keyBoardType != null ? TextInputType.number : TextInputType.text,
//           readOnly: readOnly!,
//           decoration: InputDecoration(
//             hintText: placeHolder,
//             // hintStyle: TextStyle(color: Colors.black87),
//             prefixIcon: icon, suffixIcon: suffixIcon,
//             filled: true,
//             // fillColor: Color(0xFFE8E8E8),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(7.0),
//               borderSide: BorderSide.none,
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//               borderSide: BorderSide.none,
//             ),
//             contentPadding: EdgeInsets.symmetric(
//                 vertical: 30.0,
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
