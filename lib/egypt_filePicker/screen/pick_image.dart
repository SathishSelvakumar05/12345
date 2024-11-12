import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../custom/file_picker.dart';
import '../custom/try_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class YourFormWidget extends StatefulWidget {
  @override
  _YourFormWidgetState createState() => _YourFormWidgetState();
}

class _YourFormWidgetState extends State<YourFormWidget> {
  late var Comesbase64Image = [];

  void _submitForm() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      Comesbase64Image = _formKey.currentState?.fields['image']?.value;
      print("Comesbase64Image");
      print(Comesbase64Image);
    }
  }

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool login = true;
  String value = '';
  final byteData =
      '/9j/4QFuRXhpZgAATU0AKgAAAAgABQEAAAMAAAABBDgAAAEBAAMAAAABCWAAAAExAAIAAAApAAAASodpAAQAAAABAAAAcwESAAQAAAABAAAAAAAAAABBbmRyb2lkIFBEMjIwMUZfRVhfQV8xNC4yLjguMy5XMzAuVjAwMEwxAAAGkAMAAgAAABQAAADBkpEAAgAAAAQ2MTcApCAAAgAAACUAAADVoAEAAwAAAAH//wAAkBEAAgAAAAcAAAD6kggABAAAAAEAAAAAAAAAADIwMjQ6MTE6MDcgMjI6MjY6NTgAODQ4NTA1ZmMtNGFmNy00OTVjLTgzM2MtMzExMjMyNjkyZGI1ACswNTozMAAAAwEAAAMAAAABBDgAAAExAAIAAAApAAABKwEBAAMAAAABCWAAAAAAAABBbmRyb2lkIFBEMjIwMUZfRVhfQV8xNC4yLjguMy5XMzAuVjAwMEwxAAABADcAAwAAAAH//wAAAAAAAP/iAjRJQ0NfUFJPRklMRQABAQAAAiRhcHBsBAAAAG1udHJSR0IgWFlaIAffAAoADgANAAgAOWFjc3BBUFBMAAAAAHZpdm8AAAAAAAAAAAAAAAAAAAAAAAD21gABAAAAANMtYXBwbOW7DphnvUbNS75Ebr0bdZgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACmRlc2MAAAD8AAAAZWNwcnQAAAFkAAAAI3d0cHQAAAGIAAAAFHJYWVoAAAGcAAAAFGdYWVoAAAGwAAAAFGJYWVoAAAHEAAAAFHJUUkMAAAHYAAAAIGNoYWQAAAH4AAAALGJUUkMAAAHYAAAAIGdUUkMAAAHYAAAAIGRlc2MAAAAAAAAAC0Rpc3BsYXkgUDMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdGV4dAAAAABDb3B5c';

  Future<dynamic> addInspection(Map<String, dynamic> datas) async {
    const String token =
        'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJlZ3lwdCIsImVudGl0eU5hbWUiOiJ5YWFudHJhYyIsInJvbGVzIjoiUk9MRV9MT0dJU1RJQ1MiLCJpc3MiOiJ5YWFudHJhYyIsImV4cCI6MTczMTY0ODU1MCwidXNlcklkIjoiZWd5cHQiLCJpYXQiOjE3MzEwNDM3NTB9.O1FofAhVdVFSqZJV2nN_-onkNo-zq-8g4EHvkJW7UI8SViKBg58glyn9EC6gPtGhvIoEmWMP5uuBCl2rDDsPaA';
    const String url =
        'https://dev-v2-api.yaantrac.com/api/report/inspection/add';

    final Dio dio = Dio();

    try {
      print('enter try');
      final response = await dio.post(
        url,
        data: datas,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      print('the status code after try${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Data posted successfully');
        print(response.data);
        value = response.statusCode as String;
        return response.data;
      } else {
        print('Error status code is: ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('dio exception and status code is $e');
        print('Error response: ${e.response?.data}');
      } else {
        print('Request error: ${e.message}');
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              CustomFilePicker(
                labelName: 'sathish',
                name: 'kumar',
                validators: [],
              ),
              // // Example form fields
              // FormBuilderTextField(
              //   name: 'Body Conditionimg',
              //   decoration: InputDecoration(labelText: "Body Condition Image"),
              // ),
              // FormBuilderTextField(
              //   name: 'Seatbeltsimg',
              //   decoration: InputDecoration(labelText: "Seatbelts Image"),
              // ),
              // // Add more fields as needed

              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    final formData = _formKey.currentState?.value;

                    final result = {
                      "inspectionId": '05052010',
                      "inspectionDate": '1730980662',
                      "vehicleNumber": 'egt5790',
                      "inspectorName": 'sathiskumr5',
                      "exteriorInspection": {
                        "bodyCondition": 'yes',
                        "glassAndMirrors": 'yes',
                        "licencePlates": 'yes',
                        "light": 'yes',
                        "tires": 'yes',
                        "notes": 'yes',
                        // "Body Conditionimg": formData['Body Conditionimg'],
                        //"Glass and Mirrorsimg": formData['Glass and Mirrorsimg'],
                        //"License Platesimg": formData['License Platesimg'],
                        //"Lightimg": formData['Lightimg'],
                        //"Tiresimg": formData['Tiresimg'],
                        "urls": {
                          // if (formData['Body Conditionimg'] is String)
                          "Body Conditionimg": ["BodyImage"],
                          // if (formData["Glass and Mirrorsimg"] is String)
                          //   "Glass and Mirrorsimg": ["GlassMirrorImage"],
                          // if (formData["License Platesimg"] is String)
                          //   "License Platesimg": ["LicensePlatesImage"],
                          // if (formData["Lightimg"] is String)
                          //   "LightImg": ["LightImage"],
                          // if (formData["Tiresimg"] is String)
                          //   "TiresImage": ["TireImage"]
                        }
                      },
                      "interiorInspection": {
                        "seatBelts": 'yes',
                        "dashboard": 'yes',
                        "controls": 'yes',
                        "seatsAndUpholstery": 'yes',
                        "floorMats": 'yes',
                        "notes": 'yes',
                        //"Seatbeltsimg": formData['Seatbeltsimg'],
                        //"Dashboardimg": formData['Dashboardimg'],
                        //"Controlsimg": formData['Controlsimg'],
                        //"Seats and Upholsteryimg": formData['Seats and Upholsteryimg'],
                        //"Floor Matsimg": formData['Floor Matsimg'],
                        "urls": {
                          // if (formData['Seatbeltsimg'] is String)
                          //   "Seatbeltsimg": ["SeatBeltsImage"],
                          // if (formData['BDashboardimg'] is String)
                          //   "Dashboardimg": ["DashboardImage"],
                          // if (formData['Controlsimg'] is String)
                          //   "Controlsimg": ["ControlsImage"],
                          // if (formData['Seats and Upholsteryimg'] is String)
                          //   "Seats and Upholsteryimg": [
                          //     "SeatsAndUpholsteryImage"
                          //   ],
                          // if (formData['Floor Matsimg'] is String)
                          //   "Floor MatsImg": ["FloorMatsImage"]
                        }
                      },
                      "engineCompartment": {
                        "fluidLevels": 'yes',
                        "beltsAndHoses": 'yes',
                        "battery": 'yes',
                        "engineCondition": 'yes',
                        "notes": 'yes',
                        //"Fluid Levelsimg": formData['Fluid Levelsimg'],
                        //"Belts and Hosesimg": formData['Belts and Hosesimg'],
                        //"Batteryimg": formData['Batteryimg'],
                        //"Engine Conditionimg": formData['Engine Conditionimg'],
                        "urls": {
                          // if (formData['Fluid Levelsimg'] is String)
                          //   "Fluid Levelsimg": ["FluidLevelsImage"],
                          // if (formData['Belts and Hosesimg'] is String)
                          //   "Belts and Hosesimg": ["Belts and HosesImage"],
                          // if (formData['Batteryimg'] is String)
                          //   "Batteryimg": ["BatteryImage"],
                          // if (formData['Engine Conditionimg'] is String)
                          //   "Engine Conditionimg": ["EngineConditionImage"],
                        }
                      },
                      "undercarriageInspection": {
                        "exhaustSystem": 'yes',
                        "suspension": 'yes',
                        "brakes": 'yes',
                        "steering": 'yes',
                        "notes": 'yes',
                        //"Exhaust Systemimg":formData['Exhaust Systemimg'],
                        //"Suspensionimg":formData['Suspensionimg'],
                        //"Brakesimg": formData['Brakesimg'],
                        //"Steeringimg":formData['Steeringimg'],
                        "urls": {
                          // if (formData['Exhaust Systemimg'] is String)
                          //   "Exhaust Systemimg": ["ExhaustSystemImage"],
                          // if (formData['Suspensionimg'] is String)
                          //   "Suspensionimg": ["SuspensionImage"],
                          // if (formData['Brakesimg'] is String)
                          //   "Brakesimg": ["BrakesImage"],
                          // if (formData['Steeringimg'] is String)
                          //   "Steeringimg": ["SteeringImage"],
                        }
                      },
                      "safetyEquipment": {
                        "spareTireAndTools": 'yes',
                        "jack": 'yes',
                        "warningTriangles": 'yes',
                        "firstAidKid": 'yes',
                        "notes": 'yes',
                        //"Spare Tire and Toolsimg": formData['Spare Tire and Toolsimg'],
                        //"Jackimg": formData['Jackimg'],
                        //"Warning Trianglesimg": formData['Warning Trianglesimg'],
                        //"First Aid Kitimg": formData['First Aid Kitimg'],
                        "urls": {
                          // if (formData['Spare Tire and Toolsimg'] is String)
                          //   "Spare Tire and Toolsimg": [
                          //     "Spare Tire and ToolsImage"
                          //   ],
                          // if (formData['Jackimg'] is String)
                          //   "Jackimg": ["JackImage"],
                          // if (formData['Warning Trianglesimg'] is String)
                          //   "Warning Trianglesimg": ["Warning TrianglesImage"],
                          // if (formData['First Aid Kitimg'] is String)
                          //   "First Aid Kitimg": ["First Aid Kit Image"],
                        }
                      },
                      "vehicleDocumentation": {
                        "vehicleRegistration": 'yes',
                        "insurance": 'yes',
                        "serviceRecords": 'yes',
                        "ownersManual": 'yes',
                        "notes": 'yes',
                        //"Vehicle Registrationimg": formData['Vehicle Registrationimg'],
                        //"Insuranceimg": formData['Insuranceimg'],
                        //"Service Recordsimg": formData['Service Recordsimg'],
                        //"Owner's Manualimg": formData["Owner's Manualimg"],
                        "urls": {
                          // if (formData['Vehicle Registrationimg'] is String)
                          //   "Vehicle Registrationimg": [
                          //     "VehicleRegistrationImage"
                          //   ],
                          // if (formData['Insuranceimg'] is String)
                          //   "Insuranceimg": ["InsuranceImage"],
                          // if (formData['Service Recordsimg'] is String)
                          //   "Service Recordsimg": ["Service Records Image"],
                          // if (formData["Owner's Manualimg"] is String)
                          //   "Owner's Manualimg": ["Owner's Manual Image"],
                        }
                      },
                      "complianceAndEmissions": {
                        "emissionControlSystem": 'yes',
                        "vehicleInspectionSticker": 'yes',
                        "complianceWithLocalRegulation": 'yes',
                        "notes": 'yes',
                        //"Emission Control Systemimg": formData['Emission Control Systemimg'],
                        //"Vehicle Inspection Stickerimg": formData['Vehicle Inspection Stickerimg'],
                        //"Compliance with Local Regulationsimg": formData['Compliance with Local Regulationsimg'],
                        "urls": {
                          //   if (formData['Emission Control Systemimg'] is String)
                          //     "Emission Control Systemimg": [
                          //       "Emission Control System Image"
                          //     ],
                          //   if (formData['Vehicle Inspection Stickerimg']
                          //       is String)
                          //     "Vehicle Inspection Stickerimg": [
                          //       "Vehicle Inspection Sticker Image"
                          //     ],
                          //   if (formData['Compliance with Local Regulationsimg']
                          //       is String)
                          //     "Compliance with Local Regulationsimg": [
                          //       "Compliance with Local Regulations Image"
                          //     ],
                        }
                      },
                    };
                    //
                    // final result = {
                    //   "inspectionId": '05052003',
                    //   "inspectionDate": '1730980662',
                    //   "vehicleNumber": 'eg12tn39',
                    //   "inspectorName": 'shiva',
                    //   "exteriorInspection": {
                    //     "bodyCondition": 'yes',
                    //     "urls": {
                    //       "Body Conditionimg": formData?['Body Conditionimg'],
                    //     }
                    //   },
                    //   "interiorInspection": {
                    //     "seatBelts": 'yes',
                    //     "urls": {
                    //       "Seatbeltsimg": formData?['Seatbeltsimg'],
                    //     }
                    //   },
                    //   // Complete the other sections as needed
                    // };

                    print("inspection result");
                    //  print(result); // Or use your logger here
                    addInspection(result);
                  } else {
                    print("Form is not Valid");
                  }
                },
                child: Text("CHECK"),
              ),
              if (value != null)
                ElevatedButton(
                    onPressed: () {
                      uploadImage();
                    },
                    child: Text('UPLOAD TO THE AWS'))
            ],
          ),
        ),
      ),
    );
  }

  void uploadImage() async {
    final dio = Dio();
    final url =
        'https://yaantrac-development.s3.ap-south-1.amazonaws.com/Document/egypt/05052010/BodyImage?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20241108T102714Z&X-Amz-SignedHeaders=host&X-Amz-Expires=86400&X-Amz-Credential=AKIAVL6ZO66KAV7IS37H%2F20241108%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Signature=38f800731349a119ad0968ccbab8416054f5200d2a61beb1785539c9dfc1ec87';

    print("Comesbase64Image");
    print(Comesbase64Image);

    // List<int> imageBytes = [];
    final imageBytesdata =
        'https://yaantrac-development.s3.ap-south-1.amazonaws.com/Document/egypt/05052010/BodyImage?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20241108T102714Z&X-Amz-SignedHeaders=host&X-Amz-Expires=86400&X-Amz-Credential=AKIAVL6ZO66KAV7IS37H%2F20241108%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Signature=38f800731349a119ad0968ccbab8416054f5200d2a61beb1785539c9dfc1ec87';
    print('object$imageBytesdata');

    try {
      print('irunga bhaii');
      final response = await dio.put(
        url,
        data: imageBytesdata,
        options: Options(
          headers: {
            'Content-Type': 'image/jpeg',
          },
        ),
      );

      if (response.statusCode == 200) {
        print(
            'image successfully uploaded and status code is${response.statusCode}');
        print(
            'image successfully uploaded and status code is${response.data.toString()}');
        print("Image uploaded successfully!");
      } else {
        print("Failed to upload image. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print('avlo thaan namala mutichi vitanga ponga');
      print("Error uploading image: $e");
    }
  }

// void uploadImage() async {
  //   final dio = Dio();
  //   final url =
  //       'https://yaantrac-development.s3.ap-south-1.amazonaws.com/Document/demo/15052003/BodyImage?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20241108T075338Z&X-Amz-SignedHeaders=host&X-Amz-Expires=86400&X-Amz-Credential=AKIAVL6ZO66KAV7IS37H%2F20241108%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Signature=2001c3a90172c3d413c17fa0a4a624a800fe8ace80fdb4dd167da58effb271bb%7D%7D';
  //
  //   String base64Image =
  //       "/9j/4QFuRXhpZgAATU0AKgAAAAgABQEAAAMAAAABBDgAAAEBAAMAAAABCWAAAAExAAIAAAApAAAASodpAAQAAAABAAAAcwESAAQAAAABAAAAAAAAAABBbmRyb2lkIFBEMjIwMUZfRVhfQV8xNC4yLjguMy5XMzAuVjAwMEwxAAAGkAMAAgAAABQAAADBkpEAAgAAAAQ2MTcApCAAAgAAACUAAADVoAEAAwAAAAH//wAAkBEAAgAAAAcAAAD6kggABAAAAAEAAAAAAAAAADIwMjQ6MTE6MDcgMjI6MjY6NTgAODQ4NTA1ZmMtNGFmNy00OTVjLTgzM2MtMzExMjMyNjkyZGI1ACswNTozMAAAAwEAAAMAAAABBDgAAAExAAIAAAApAAABKwEBAAMAAAABCWAAAAAAAABBbmRyb2lkIFBEMjIwMUZfRVhfQV8xNC4yLjguMy5XMzAuVjAwMEwxAAABADcAAwAAAAH//wAAAAAAAP/iAjRJQ0NfUFJPRklMRQABAQAAAiRhcHBsBAAAAG1udHJSR0IgWFlaIAffAAoADgANAAgAOWFjc3BBUFBMAAAAAHZpdm8AAAAAAAAAAAAAAAAAAAAAAAD21gABAAAAANMtYXBwbOW7DphnvUbNS75Ebr0bdZgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACmRlc2MAAAD8AAAAZWNwcnQAAAFkAAAAI3d0cHQAAAGIAAAAFHJYWVoAAAGcAAAAFGdYWVoAAAGwAAAAFGJYWVoAAAHEAAAAFHJUUkMAAAHYAAAAIGNoYWQAAAH4AAAALGJUUkMAAAHYAAAAIGdUUkMAAAHYAAAAIGRlc2MAAAAAAAAAC0Rpc3BsYXkgUDMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdGV4dAAAAABDb3B5c";
  //
  //   List<int> imageBytes = base64Decode(base64Image);
  //
  //   try {
  //     final response = await dio.put(
  //       url,
  //       data: imageBytes,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'image/jpeg',
  //         },
  //       ),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       print("Image uploaded successfully! to the S3");
  //     } else {
  //       print(
  //           " Irunga bhai Failed to upload image. Status code: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     print("Error uploading image avlothaan: $e");
  //   }
  // }
}

// onPressed: () async {
//   if (_formKey.currentState!.validate()) {
//     final formData = _formKey.currentState!.value;
//
//     if (login) {
//       print("validate");
//       final result = {
//         "inspectionId": '05052003',
//         "inspectionDate": '1730980662',
//         "vehicleNumber": 'eg12tn39',
//         "inspectorName": 'shiva',
//         "exteriorInspection": {
//           "bodyCondition": 'yes',
//           "glassAndMirrors": 'yes',
//           "licencePlates": 'yes',
//           "light": 'yes',
//           "tires": 'yes',
//           "notes": 'yes',
//           "urls": {
//             "Body Conditionimg": ["BodyImage"],
//           }
//         },
//         // ... (rest of the inspection data)
//       };
//       print("inspection result");
//       loggerNoStack.t(result);
//       addInspection(result);
//     } else {
//       print("Form is not Valid");
//     }
//   }
// },
