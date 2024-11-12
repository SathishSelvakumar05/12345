// import 'dart:io';
//
// import 'package:dio/dio.dart';
//
// Future<void> assInspection(File imageFile, String token) async {
//   try {
//     // Create Dio instance
//     Dio dio = Dio();
//
//     // Set up headers for authorization
//     dio.options.headers = {
//       'Authorization': 'Bearer $token',
//       // Don't manually set Content-Type, as Dio handles it for FormData
//     };
//
//     // Prepare the form data, including the image file
//     final formData = FormData.fromMap({
//       "inspectionId": '05052003',
//       "inspectionDate": '1730980662',
//       "vehicleNumber": 'eg12tn39',
//       "inspectorName": 'shiva',
//       "exteriorInspection": {
//         "bodyCondition": 'yes',
//         "glassAndMirrors": 'yes',
//         "licencePlates": 'yes',
//         "light": 'yes',
//         "tires": 'yes',
//         "notes": 'yes',
//         "urls": {
//           "Body Conditionimg": await MultipartFile.fromFile(
//             imageFile.path,
//             filename: 'inspection_image.jpg',
//           ),
//         }
//       },
//       // Add other sections as necessary
//     });
//
//     // Send POST request
//     final response = await dio.post(
//       'https://dev-v2-api.yaantrac.com/api/report/inspection/add', // Replace with your actual endpoint
//       data: formData,
//     );
//
//     if (response.statusCode == 200) {
//       print("response is ${response.data.toString()}");
//       print("Image uploaded successfully");
//     } else {
//       print("Failed to upload image. Status code: ${response.statusCode}");
//     }
//   } catch (e) {
//     print("Error uploading image: $e");
//   }
// }
//
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
//
// import '../custom/file_picker.dart';
// import '../custom/try_custom.dart';
//
// class PickImage extends StatefulWidget {
//   const PickImage({super.key});
//
//   @override
//   State<PickImage> createState() => _PickImageState();
// }
//
// class _PickImageState extends State<PickImage> {
//   final token =
//       'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJlZ3lwdCIsImVudGl0eU5hbWUiOiJ5YWFudHJhYyIsInJvbGVzIjoiUk9MRV9MT0dJU1RJQ1MiLCJpc3MiOiJ5YWFudHJhYyIsImV4cCI6MTczMTU3ODg4NywidXNlcklkIjoiZWd5cHQiLCJpYXQiOjE3MzA5NzQwODd9.JRBi2Av0Qi5itOZBW8Sta6EwOVxjOU_TvgRRjbxSMrJe7zSUJdel_btOpcRbFi6QHk02siygTzmXoIPjqsiY_A';
//
//   bool login = true;
//   static var loggerNoStack = Logger(
//     printer: PrettyPrinter(methodCount: 0),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CustomFilePicker(
//               validators: [],
//               name: 'yaantrac',
//               labelName: 'project',
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   final formData = _formKey.currentState!.value;
//
//                   if (login) {
//                     print("validate");
//                     //  final formData = _formKey.currentState!.value;
//                     // loggerNoStack.t(formData);
//                     final result = {
//                       "inspectionId": '05052003',
//                       "inspectionDate": '1730980662',
//                       "vehicleNumber": 'eg12tn39',
//                       "inspectorName": 'shiva',
//                       "exteriorInspection": {
//                         "bodyCondition": 'yes',
//                         "glassAndMirrors": 'yes',
//                         "licencePlates": 'yes',
//                         "light": 'yes',
//                         "tires": 'yes',
//                         "notes": 'yes',
//                         // "Body Conditionimg": formData['Body Conditionimg'],
//                         //"Glass and Mirrorsimg": formData['Glass and Mirrorsimg'],
//                         //"License Platesimg": formData['License Platesimg'],
//                         //"Lightimg": formData['Lightimg'],
//                         //"Tiresimg": formData['Tiresimg'],
//                         "urls": {
//                           //  if (formData['Body Conditionimg'] is String)
//                           "Body Conditionimg": ["BodyImage"],
//                           // if (formData["Glass and Mirrorsimg"] is String)
//                           //   "Glass and Mirrorsimg": ["GlassMirrorImage"],
//                           // if (formData["License Platesimg"] is String)
//                           //   "License Platesimg": ["LicensePlatesImage"],
//                           // if (formData["Lightimg"] is String)
//                           //   "LightImg": ["LightImage"],
//                           // if (formData["Tiresimg"] is String)
//                           //   "TiresImage": ["TireImage"]
//                         }
//                       },
//                       "interiorInspection": {
//                         "seatBelts": 'yes',
//                         "dashboard": 'yes',
//                         "controls": 'yes',
//                         "seatsAndUpholstery": 'yes',
//                         "floorMats": 'yes',
//                         "notes": 'yes',
//                         //"Seatbeltsimg": formData['Seatbeltsimg'],
//                         //"Dashboardimg": formData['Dashboardimg'],
//                         //"Controlsimg": formData['Controlsimg'],
//                         //"Seats and Upholsteryimg": formData['Seats and Upholsteryimg'],
//                         //"Floor Matsimg": formData['Floor Matsimg'],
//                         "urls": {
//                           // if (formData['Seatbeltsimg'] is String)
//                           //   "Seatbeltsimg": ["SeatBeltsImage"],
//                           // if (formData['BDashboardimg'] is String)
//                           //   "Dashboardimg": ["DashboardImage"],
//                           // if (formData['Controlsimg'] is String)
//                           //   "Controlsimg": ["ControlsImage"],
//                           // if (formData['Seats and Upholsteryimg'] is String)
//                           //   "Seats and Upholsteryimg": [
//                           //     "SeatsAndUpholsteryImage"
//                           //   ],
//                           // if (formData['Floor Matsimg'] is String)
//                           //   "Floor MatsImg": ["FloorMatsImage"]
//                         }
//                       },
//                       "engineCompartment": {
//                         "fluidLevels": 'yes',
//                         "beltsAndHoses": 'yes',
//                         "battery": 'yes',
//                         "engineCondition": 'yes',
//                         "notes": 'yes',
//                         //"Fluid Levelsimg": formData['Fluid Levelsimg'],
//                         //"Belts and Hosesimg": formData['Belts and Hosesimg'],
//                         //"Batteryimg": formData['Batteryimg'],
//                         //"Engine Conditionimg": formData['Engine Conditionimg'],
//                         "urls": {
//                           // if (formData['Fluid Levelsimg'] is String)
//                           //   "Fluid Levelsimg": ["FluidLevelsImage"],
//                           // if (formData['Belts and Hosesimg'] is String)
//                           //   "Belts and Hosesimg": ["Belts and HosesImage"],
//                           // if (formData['Batteryimg'] is String)
//                           //   "Batteryimg": ["BatteryImage"],
//                           // if (formData['Engine Conditionimg'] is String)
//                           //   "Engine Conditionimg": ["EngineConditionImage"],
//                         }
//                       },
//                       "undercarriageInspection": {
//                         "exhaustSystem": 'yes',
//                         "suspension": 'yes',
//                         "brakes": 'yes',
//                         "steering": 'yes',
//                         "notes": 'yes',
//                         //"Exhaust Systemimg":formData['Exhaust Systemimg'],
//                         //"Suspensionimg":formData['Suspensionimg'],
//                         //"Brakesimg": formData['Brakesimg'],
//                         //"Steeringimg":formData['Steeringimg'],
//                         "urls": {
//                           // if (formData['Exhaust Systemimg'] is String)
//                           //   "Exhaust Systemimg": ["ExhaustSystemImage"],
//                           // if (formData['Suspensionimg'] is String)
//                           //   "Suspensionimg": ["SuspensionImage"],
//                           // if (formData['Brakesimg'] is String)
//                           //   "Brakesimg": ["BrakesImage"],
//                           // if (formData['Steeringimg'] is String)
//                           //   "Steeringimg": ["SteeringImage"],
//                         }
//                       },
//                       "safetyEquipment": {
//                         "spareTireAndTools": 'yes',
//                         "jack": 'yes',
//                         "warningTriangles": 'yes',
//                         "firstAidKid": 'yes',
//                         "notes": 'yes',
//                         //"Spare Tire and Toolsimg": formData['Spare Tire and Toolsimg'],
//                         //"Jackimg": formData['Jackimg'],
//                         //"Warning Trianglesimg": formData['Warning Trianglesimg'],
//                         //"First Aid Kitimg": formData['First Aid Kitimg'],
//                         "urls": {
//                           // if (formData['Spare Tire and Toolsimg'] is String)
//                           //   "Spare Tire and Toolsimg": [
//                           //     "Spare Tire and ToolsImage"
//                           //   ],
//                           // if (formData['Jackimg'] is String)
//                           //   "Jackimg": ["JackImage"],
//                           // if (formData['Warning Trianglesimg'] is String)
//                           //   "Warning Trianglesimg": ["Warning TrianglesImage"],
//                           // if (formData['First Aid Kitimg'] is String)
//                           //   "First Aid Kitimg": ["First Aid Kit Image"],
//                         }
//                       },
//                       "vehicleDocumentation": {
//                         "vehicleRegistration": 'yes',
//                         "insurance": 'yes',
//                         "serviceRecords": 'yes',
//                         "ownersManual": 'yes',
//                         "notes": 'yes',
//                         //"Vehicle Registrationimg": formData['Vehicle Registrationimg'],
//                         //"Insuranceimg": formData['Insuranceimg'],
//                         //"Service Recordsimg": formData['Service Recordsimg'],
//                         //"Owner's Manualimg": formData["Owner's Manualimg"],
//                         "urls": {
//                           // if (formData['Vehicle Registrationimg'] is String)
//                           //   "Vehicle Registrationimg": [
//                           //     "VehicleRegistrationImage"
//                           //   ],
//                           // if (formData['Insuranceimg'] is String)
//                           //   "Insuranceimg": ["InsuranceImage"],
//                           // if (formData['Service Recordsimg'] is String)
//                           //   "Service Recordsimg": ["Service Records Image"],
//                           // if (formData["Owner's Manualimg"] is String)
//                           //   "Owner's Manualimg": ["Owner's Manual Image"],
//                         }
//                       },
//                       "complianceAndEmissions": {
//                         "emissionControlSystem": 'yes',
//                         "vehicleInspectionSticker": 'yes',
//                         "complianceWithLocalRegulation": 'yes',
//                         "notes": 'yes',
//                         //"Emission Control Systemimg": formData['Emission Control Systemimg'],
//                         //"Vehicle Inspection Stickerimg": formData['Vehicle Inspection Stickerimg'],
//                         //"Compliance with Local Regulationsimg": formData['Compliance with Local Regulationsimg'],
//                         "urls": {
//                           //   if (formData['Emission Control Systemimg'] is String)
//                           //     "Emission Control Systemimg": [
//                           //       "Emission Control System Image"
//                           //     ],
//                           //   if (formData['Vehicle Inspection Stickerimg']
//                           //       is String)
//                           //     "Vehicle Inspection Stickerimg": [
//                           //       "Vehicle Inspection Sticker Image"
//                           //     ],
//                           //   if (formData['Compliance with Local Regulationsimg']
//                           //       is String)
//                           //     "Compliance with Local Regulationsimg": [
//                           //       "Compliance with Local Regulations Image"
//                           //     ],
//                         }
//                       },
//                     };
//                     print("inspection result");
//                     loggerNoStack.t(result);
//                     addInspection(result);
//                   } else {
//                     print("Form is not Valid");
//                   }
//                 },
//                 child: Text("CHECK"))
//           ],
//         ),
//       ),
//     );
//   }
//
//   final Dio dio = Dio();
//
//   Future<void> addInspection(Map<String, dynamic> inspectionData) async {
//     const token =
//         'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJlZ3lwdCIsImVudGl0eU5hbWUiOiJ5YWFudHJhYyIsInJvbGVzIjoiUk9MRV9MT0dJU1RJQ1MiLCJpc3MiOiJ5YWFudHJhYyIsImV4cCI6MTczMTU3ODg4NywidXNlcklkIjoiZWd5cHQiLCJpYXQiOjE3MzA5NzQwODd9.JRBi2Av0Qi5itOZBW8Sta6EwOVxjOU_TvgRRjbxSMrJe7zSUJdel_btOpcRbFi6QHk02siygTzmXoIPjqsiY_A';
//
//     try {
//       final response = await dio.post(
//         'https://dev-v2-api.yaantrac.com/api/report/inspection/add',
//         data: inspectionData,
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Content-Type': 'multipart/form-data',
//           },
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         print('Inspection data and images uploaded successfully!');
//         // You can add additional handling here if needed
//       } else {
//         print('Failed to upload data. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error uploading data: $e');
//     }
//   }
// }
