import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AutoCustomTextField extends StatelessWidget {
  final String placeHolder;
  final String name;
  final String? labelName;
  final String? initialValue;
  final TextInputType? keyBoardType;
  final TextEditingController? textEditingController;
  final Icon? icon;
  final bool? read;
  final Icon? suffixIcon;
  final bool? obscureText;
  final VoidCallback? suffixClick;
  final List<String? Function(String?)> validators;
  final void Function()? onTap;
  const AutoCustomTextField(
      {required this.name,
      required this.placeHolder,
      this.icon,
      this.labelName,
      this.onTap,
      required this.validators,
      this.initialValue,
      this.keyBoardType,
      this.suffixClick,
      this.suffixIcon,
      this.obscureText = false,
      this.read = false,
      this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelName != null) ...[
          Text(
            labelName!,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
        ],
        FormBuilderTextField(
          key: Key('${name}'),
          name: name,
          controller: textEditingController,
          initialValue: initialValue,
          obscureText: obscureText!,
          readOnly: read!,
          keyboardType:
              keyBoardType != null ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: placeHolder,
            prefixIcon: icon,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: suffixClick,
                    child: SizedBox(
                      child: suffixIcon,
                    ),
                  )
                : null,
            filled: true,
            fillColor: Colors.blueGrey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0).r,
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0).r,
              borderSide: BorderSide.none,
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validators != null
              ? FormBuilderValidators.compose(validators)
              : null,
          onTap: onTap,
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
