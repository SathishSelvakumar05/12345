import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberInput extends StatefulWidget {
  final Function(String countryCode, String phoneNumber)? onPhoneChanged;
  final String initialCountryCode;
  final String initialPhoneNumber;
  PhoneNumberInput({
    Key? key,
    required this.onPhoneChanged,
    this.initialCountryCode = '+91',
    this.initialPhoneNumber = '',
  }) : super(key: key);

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  late TextEditingController _phoneController;
  String localPhoneNumber = '';
  String? selectedCountryCode;

  @override
  void initState() {
    super.initState();
    localPhoneNumber = widget.initialPhoneNumber;
    selectedCountryCode = widget.initialCountryCode;
    _phoneController = TextEditingController(text: widget.initialPhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: _phoneController,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: 'Phone Number',
        prefixIcon: const Icon(Icons.phone),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      ),
      initialValue: selectedCountryCode! + localPhoneNumber,
      onChanged: (phone) {
        setState(() {
          localPhoneNumber = phone.number;
        });
        widget.onPhoneChanged?.call(selectedCountryCode!, localPhoneNumber);
      },
      onCountryChanged: (country) {
        setState(() {
          selectedCountryCode = country.dialCode;
        });

        widget.onPhoneChanged?.call(selectedCountryCode!, localPhoneNumber);
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'Phone number is required'),
        (phone) {
          if (phone == null || phone.number.length < 7) {
            return 'Please enter a valid phone number';
          }
          return null;
        },
      ]),
    );
  }
}

//
// class PhoneNumberInput extends StatefulWidget {
//   final Function(String countryCode, String phoneNumber)? onPhoneChanged;
//   final String initialCountryCode;
//   final String initialPhoneNumber;
//
//   PhoneNumberInput({
//     Key? key,
//     required this.onPhoneChanged,
//     this.initialCountryCode =
//         '+91', // Use the dial code format for initial country code
//     this.initialPhoneNumber = '',
//   }) : super(key: key);
//
//   @override
//   _PhoneNumberInputState createState() => _PhoneNumberInputState();
// }
//
// class _PhoneNumberInputState extends State<PhoneNumberInput> {
//   late TextEditingController _phoneController;
//   String localPhoneNumber = '';
//   String? selectedCountryCode;
//   int? maxLength;
//
//   @override
//   void initState() {
//     super.initState();
//     localPhoneNumber = widget.initialPhoneNumber;
//     selectedCountryCode = widget.initialCountryCode;
//     _phoneController = TextEditingController(text: widget.initialPhoneNumber);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return IntlPhoneField(
//       controller: _phoneController,
//       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//       decoration: InputDecoration(
//         labelText: 'Phone Number',
//         prefixIcon: const Icon(Icons.phone),
//         filled: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(7.0),
//           borderSide: BorderSide.none,
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide.none,
//         ),
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//       ),
//       initialValue: selectedCountryCode! + localPhoneNumber,
//       onChanged: (phone) {
//         setState(() {
//           localPhoneNumber = phone.number;
//         });
//         widget.onPhoneChanged?.call(selectedCountryCode!, localPhoneNumber);
//       },
//       onCountryChanged: (country) {
//         setState(() {
//           selectedCountryCode = country.dialCode;
//           maxLength =
//               countries.firstWhere((c) => c.code == country.code).maxLength;
//         });
//       },
//       validator: FormBuilderValidators.compose([
//         FormBuilderValidators.required(errorText: 'Phone number is required'),
//         (phone) {
//           if (phone == null || phone.number.length != maxLength) {
//             return 'Please enter a valid phone number';
//           }
//           return null;
//         },
//       ]),
//     );
//   }
// }
