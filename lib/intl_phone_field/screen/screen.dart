import 'package:flutter/material.dart';
import '../custom/custom.dart';
import 'CountryScreen.dart';

class PhoneNumberForm extends StatefulWidget {
  final String countrycode;
  final String phno;
  PhoneNumberForm({required this.countrycode, required this.phno});

  @override
  _PhoneNumberFormState createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  late String selectedCountryCode;
  late String localPhoneNumber;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    selectedCountryCode = widget.countrycode;
    localPhoneNumber = widget.phno;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    PhoneNumberInput(
                      initialCountryCode: selectedCountryCode,
                      initialPhoneNumber: localPhoneNumber,
                      onPhoneChanged: (countryCode, phoneNumber) {
                        setState(() {
                          selectedCountryCode = countryCode;
                          localPhoneNumber = phoneNumber;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _isValidPhoneNumber() ? _submitForm : null,
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isValidPhoneNumber() {
    return selectedCountryCode.isNotEmpty && localPhoneNumber.isNotEmpty;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CountryScreen(
            countryCode: selectedCountryCode,
            phoneNumber: localPhoneNumber,
          ),
        ),
      ).then((updatedPhoneData) {
        if (updatedPhoneData != null) {
          setState(() {
            selectedCountryCode = updatedPhoneData['countryCode'];
            localPhoneNumber = updatedPhoneData['phoneNumber'];
          });
        }
      });
    }
  }
}

// class PhoneNumberForm extends StatefulWidget {
//   final String countrycode;
//   final String phno;
//
//   PhoneNumberForm({required this.countrycode, required this.phno});
//
//   @override
//   _PhoneNumberFormState createState() => _PhoneNumberFormState();
// }
//
// class _PhoneNumberFormState extends State<PhoneNumberForm> {
//   late String selectedCountryCode;
//   late String localPhoneNumber;
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//     selectedCountryCode = widget.countrycode;
//     localPhoneNumber = widget.phno;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Center(
//             child: Form(
//               key: _formKey,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     PhoneNumberInput(
//                       initialCountryCode: selectedCountryCode,
//                       initialPhoneNumber: localPhoneNumber,
//                       onPhoneChanged: (countryCode, phoneNumber) {
//                         setState(() {
//                           selectedCountryCode = countryCode;
//                           localPhoneNumber = phoneNumber;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _isValidPhoneNumber() ? _submitForm : null,
//                       child: Text('Submit'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   bool _isValidPhoneNumber() {
//     return selectedCountryCode.isNotEmpty && localPhoneNumber.isNotEmpty;
//   }
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => CountryScreen(
//             countryCode: selectedCountryCode,
//             phoneNumber: localPhoneNumber,
//           ),
//         ),
//       ).then((updatedPhoneData) {
//         if (updatedPhoneData != null) {
//           setState(() {
//             selectedCountryCode = updatedPhoneData['countryCode'];
//             localPhoneNumber = updatedPhoneData['phoneNumber'];
//           });
//         }
//       });
//     }
//   }
// }
