// import 'package:flutter/material.dart';
//
// class ButtonOnpressed extends StatefulWidget {
//   const ButtonOnpressed({super.key});
//
//   @override
//   State<ButtonOnpressed> createState() => _ButtonOnpressedState();
// }
//
// class _ButtonOnpressedState extends State<ButtonOnpressed> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             final formData = _formKey.currentState!.value;
//             CommonFunction.loggerNoStack.t(formData);
//             if (_formKey.currentState!.saveAndValidate()) {
//               print("validate");
//               final formData = _formKey.currentState!.value;
//               CommonFunction.loggerNoStack.t(formData);
//               final result = {
//                 "inspectionId": formData['inspectionId'],
//                 "inspectionDate":
//                     dateTimeToEpochString(formData['dateOfInspection']),
//                 "vehicleNumber": formData['vehicleNumber'],
//                 "inspectorName": formData['inspectorName'],
//                 "exteriorInspection": {
//                   "bodyCondition": formData['Body Condition'],
//                   "glassAndMirrors": formData['Glass and Mirrors'],
//                   "licencePlates": formData['License Plates'],
//                   "light": formData['Light'],
//                   "tires": formData['Tires'],
//                   "notes": formData['ExteriorNote'],
//                   "Body Conditionimg": formData['Body Conditionimg'],
//                   //"Glass and Mirrorsimg": formData['Glass and Mirrorsimg'],
//                   //"License Platesimg": formData['License Platesimg'],
//                   //"Lightimg": formData['Lightimg'],
//                   //"Tiresimg": formData['Tiresimg'],
//                   "urls": {
//                     if (formData['Body Conditionimg'] is String)
//                       "Body Conditionimg": ["BodyImage"],
//                     if (formData["Glass and Mirrorsimg"] is String)
//                       "Glass and Mirrorsimg": ["GlassMirrorImage"],
//                     if (formData["License Platesimg"] is String)
//                       "License Platesimg": ["LicensePlatesImage"],
//                     if (formData["Lightimg"] is String)
//                       "LightImg": ["LightImage"],
//                     if (formData["Tiresimg"] is String)
//                       "TiresImage": ["TireImage"]
//                   }
//                 },
//                 "interiorInspection": {
//                   "seatBelts": formData['Seatbelts'],
//                   "dashboard": formData['Dashboard'],
//                   "controls": formData['Controls'],
//                   "seatsAndUpholstery": formData['Seats and Upholstery'],
//                   "floorMats": formData['Floor Mats'],
//                   "notes": formData['InteriorNote'],
//                   //"Seatbeltsimg": formData['Seatbeltsimg'],
//                   //"Dashboardimg": formData['Dashboardimg'],
//                   //"Controlsimg": formData['Controlsimg'],
//                   //"Seats and Upholsteryimg": formData['Seats and Upholsteryimg'],
//                   //"Floor Matsimg": formData['Floor Matsimg'],
//                   "urls": {
//                     if (formData['Seatbeltsimg'] is String)
//                       "Seatbeltsimg": ["SeatBeltsImage"],
//                     if (formData['BDashboardimg'] is String)
//                       "Dashboardimg": ["DashboardImage"],
//                     if (formData['Controlsimg'] is String)
//                       "Controlsimg": ["ControlsImage"],
//                     if (formData['Seats and Upholsteryimg'] is String)
//                       "Seats and Upholsteryimg": ["SeatsAndUpholsteryImage"],
//                     if (formData['Floor Matsimg'] is String)
//                       "Floor MatsImg": ["FloorMatsImage"]
//                   }
//                 },
//                 "engineCompartment": {
//                   "fluidLevels": formData['Fluid Levels'],
//                   "beltsAndHoses": formData['Belts and Hoses'],
//                   "battery": formData['Battery'],
//                   "engineCondition": formData['Engine Condition'],
//                   "notes": formData['engineCompartmentNote'],
//                   //"Fluid Levelsimg": formData['Fluid Levelsimg'],
//                   //"Belts and Hosesimg": formData['Belts and Hosesimg'],
//                   //"Batteryimg": formData['Batteryimg'],
//                   //"Engine Conditionimg": formData['Engine Conditionimg'],
//                   "urls": {
//                     if (formData['Fluid Levelsimg'] is String)
//                       "Fluid Levelsimg": ["FluidLevelsImage"],
//                     if (formData['Belts and Hosesimg'] is String)
//                       "Belts and Hosesimg": ["Belts and HosesImage"],
//                     if (formData['Batteryimg'] is String)
//                       "Batteryimg": ["BatteryImage"],
//                     if (formData['Engine Conditionimg'] is String)
//                       "Engine Conditionimg": ["EngineConditionImage"],
//                   }
//                 },
//                 "undercarriageInspection": {
//                   "exhaustSystem": formData['Exhaust System'],
//                   "suspension": formData['Suspension'],
//                   "brakes": formData['Brakes'],
//                   "steering": formData['Steering'],
//                   "notes": formData['undercarriageNote'],
//                   //"Exhaust Systemimg":formData['Exhaust Systemimg'],
//                   //"Suspensionimg":formData['Suspensionimg'],
//                   //"Brakesimg": formData['Brakesimg'],
//                   //"Steeringimg":formData['Steeringimg'],
//                   "urls": {
//                     if (formData['Exhaust Systemimg'] is String)
//                       "Exhaust Systemimg": ["ExhaustSystemImage"],
//                     if (formData['Suspensionimg'] is String)
//                       "Suspensionimg": ["SuspensionImage"],
//                     if (formData['Brakesimg'] is String)
//                       "Brakesimg": ["BrakesImage"],
//                     if (formData['Steeringimg'] is String)
//                       "Steeringimg": ["SteeringImage"],
//                   }
//                 },
//                 "safetyEquipment": {
//                   "spareTireAndTools": formData['Spare Tire and Tools'],
//                   "jack": formData['Jack'],
//                   "warningTriangles": formData['Warning Triangles'],
//                   "firstAidKid": formData['First Aid Kit'],
//                   "notes": formData['safetyNote'],
//                   //"Spare Tire and Toolsimg": formData['Spare Tire and Toolsimg'],
//                   //"Jackimg": formData['Jackimg'],
//                   //"Warning Trianglesimg": formData['Warning Trianglesimg'],
//                   //"First Aid Kitimg": formData['First Aid Kitimg'],
//                   "urls": {
//                     if (formData['Spare Tire and Toolsimg'] is String)
//                       "Spare Tire and Toolsimg": ["Spare Tire and ToolsImage"],
//                     if (formData['Jackimg'] is String) "Jackimg": ["JackImage"],
//                     if (formData['Warning Trianglesimg'] is String)
//                       "Warning Trianglesimg": ["Warning TrianglesImage"],
//                     if (formData['First Aid Kitimg'] is String)
//                       "First Aid Kitimg": ["First Aid Kit Image"],
//                   }
//                 },
//                 "vehicleDocumentation": {
//                   "vehicleRegistration": formData['Vehicle Registration'],
//                   "insurance": formData['Insurance'],
//                   "serviceRecords": formData['Service Records'],
//                   "ownersManual": formData["Owner's Manual"],
//                   "notes": formData['vehicleNote'],
//                   //"Vehicle Registrationimg": formData['Vehicle Registrationimg'],
//                   //"Insuranceimg": formData['Insuranceimg'],
//                   //"Service Recordsimg": formData['Service Recordsimg'],
//                   //"Owner's Manualimg": formData["Owner's Manualimg"],
//                   "urls": {
//                     if (formData['Vehicle Registrationimg'] is String)
//                       "Vehicle Registrationimg": ["VehicleRegistrationImage"],
//                     if (formData['Insuranceimg'] is String)
//                       "Insuranceimg": ["InsuranceImage"],
//                     if (formData['Service Recordsimg'] is String)
//                       "Service Recordsimg": ["Service Records Image"],
//                     if (formData["Owner's Manualimg"] is String)
//                       "Owner's Manualimg": ["Owner's Manual Image"],
//                   }
//                 },
//                 "complianceAndEmissions": {
//                   "emissionControlSystem": formData['Emission Control System'],
//                   "vehicleInspectionSticker":
//                       formData['Vehicle Inspection Sticker'],
//                   "complianceWithLocalRegulation":
//                       formData['Compliance with Local Regulations'],
//                   "notes": formData['complianceNote'],
//                   //"Emission Control Systemimg": formData['Emission Control Systemimg'],
//                   //"Vehicle Inspection Stickerimg": formData['Vehicle Inspection Stickerimg'],
//                   //"Compliance with Local Regulationsimg": formData['Compliance with Local Regulationsimg'],
//                   "urls": {
//                     if (formData['Emission Control Systemimg'] is String)
//                       "Emission Control Systemimg": [
//                         "Emission Control System Image"
//                       ],
//                     if (formData['Vehicle Inspection Stickerimg'] is String)
//                       "Vehicle Inspection Stickerimg": [
//                         "Vehicle Inspection Sticker Image"
//                       ],
//                     if (formData['Compliance with Local Regulationsimg']
//                         is String)
//                       "Compliance with Local Regulationsimg": [
//                         "Compliance with Local Regulations Image"
//                       ],
//                   }
//                 },
//               };
//               print("inspection result");
//               CommonFunction.loggerNoStack.t(result);
//               addInspection(result, formData['inspectionId']);
//             } else {
//               print("Form is not Valid");
//             }
//           },
//           child: Text("STORE"),
//         ),
//       ),
//     );
//   }
//
//   // addInspection(Map<String, dynamic> data, String id) async {
//   //   token = context.read<LoginCubit>().authToken!;
//   //   setState(() {
//   //     loading = true;
//   //   });
//   //
//   //   try {
//   //     String message =
//   //         await context.read<InspectionCubit>().addInspection(data, token);
//   //     Navigator.pop(context);
//   //     //  await context.read<DispatchCubit>().assignID(id);
//   //     await showSuccessToast(message);
//   //   } catch (err) {
//   //     setState(() {
//   //       loading = false;
//   //     });
//   //     print(err);
//   //   }
//   //   setState(() {
//   //     loading = false;
//   //   });
//   // }
// }
