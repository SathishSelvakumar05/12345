import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../custom/custom_textfield.dart';

class AddExternalVehicleScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _vehicleNoController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _driverNameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add External Vehicle'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoCustomTextField(
                  read: false,
                  labelName: 'Vehicle No',
                  name: 'vehicleNo',
                  placeHolder: 'Enter Vehicle no',
                  textEditingController: _vehicleNoController,
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'Vehicle No is required'),
                    FormBuilderValidators.minLength(3,
                        errorText: 'Please enter vehicle Number'),
                  ],
                ),
                SizedBox(height: 20.h),
                AutoCustomTextField(
                  read: false,
                  labelName: 'Capacity',
                  name: 'capacity',
                  placeHolder: 'Enter Capacity',
                  textEditingController: _capacityController,
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'Capacity is required'),
                    FormBuilderValidators.numeric(
                        errorText: 'Please enter a valid number'),
                  ],
                ),
                SizedBox(height: 20.h),
                AutoCustomTextField(
                  read: false,
                  labelName: 'Driver Name',
                  name: 'driverName',
                  placeHolder: 'Enter Driver Name',
                  textEditingController: _driverNameController,
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'Driver Name is required'),
                    FormBuilderValidators.minLength(3,
                        errorText: 'Please enter a valid name'),
                  ],
                ),
                SizedBox(height: 20.h),
                AutoCustomTextField(
                  read: false,
                  labelName: 'Contact Number',
                  name: 'contactNumber',
                  placeHolder: '+65',
                  textEditingController: _contactNumberController,
                  icon: Icon(Icons.flag),
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'Contact Number is required'),
                    FormBuilderValidators.minLength(8,
                        errorText: 'Please enter a valid number'),
                  ],
                ),
                SizedBox(height: 20.h),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        print('Form data: ${_formKey.currentState?.value}');
                      } else {
                        print('Validation failed');
                      }
                    },
                    style: ButtonStyle(
                      minimumSize:
                          WidgetStateProperty.all<Size>(Size(120.w, 50.h)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0).r,
                        ),
                      ),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.blue),
                    ),
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: Colors.grey,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    // ),
                    child: Text(
                      'Add Vehicle',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
