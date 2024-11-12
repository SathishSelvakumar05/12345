// import 'dart:convert';
// import 'package:logger/logger.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tracking/EgyptModule/Components/CustomTextfield/CustomAddressTextField.dart';
// import 'package:tracking/EgyptModule/Components/CustomTextfield/CustomDateTimePicker.dart';
// import 'package:tracking/EgyptModule/Components/CustomTextfield/CustomTextField.dart';
// import 'package:tracking/EgyptModule/Components/CustomTextfield/inspectionComponent.dart';
// import 'package:tracking/EgyptModule/Components/appbarComponent.dart';
// import 'package:tracking/EgyptModule/Inspection/Cubit/inspection_cubit.dart';
// import '../../../../Features/LoginFeatures/Login/Cubit/login_cubit.dart';
// import '../../../../Helper/CommonFunction.dart';
// import '../../../../Helper/constants.dart';
// import '../../../../Helper/customToast.dart';
// import '../../../Components/CustomTextfield/CustomDropdownComponent.dart';
// import '../../../TruckZone/Cubit/Truck/truck_list_cubit.dart';
// import '../../Cubit/dispatch_cubit.dart';
// import '../custom/custom_appbar.dart';
// import '../custom/custom_dateTime_picker.dart';
// import '../custom/custom_textfield.dart';
// import '../custom/inspection_component.dart';
//
// class VehicleInspection extends StatefulWidget {
//   @override
//   State<VehicleInspection> createState() => _VehicleInspectionState();
// }
//
// class _VehicleInspectionState extends State<VehicleInspection> {
//   final _formKey = GlobalKey<FormBuilderState>();
//   bool loading = false;
//   var token = '';
//
//   List<Map<String, dynamic>> inspection = [
//     {
//       "title": "Exterior Inspection Details",
//       "description": [
//         "Body Condition: Check for dents, scratches, and signs of previous accidents. ",
//         "Glass and Mirrors: Inspect windshields, windows, and mirrors for cracks and damage.",
//         "License Plates: Verify the presence and visibility of front and rear license plates.",
//         "Light: Test headlights, taillights, brake lights, turn signals, and hazard lights.",
//         "Tires: Check tire condition, tread depth, and inflation pressure.",
//       ],
//       "noteName": 'ExteriorNote'
//     },
//     {
//       "title": "Interior Inspection Details",
//       "description": [
//         "Seatbelts: Ensure all seatbelts are functional and in good condition.",
//         "Dashboard: Check warning lights and gauges for proper functionality.",
//         "Controls: Test all interior controls (e.g., AC, radio, windows, locks).",
//         "Seats and Upholstery: Inspect seats and upholstery for tears or damage",
//         "Floor Mats: Check for proper floor mat installation and secure them in place.",
//       ],
//       "noteName": 'InteriorNote'
//     },
//     {
//       "title": "Engine Compartment",
//       "description": [
//         "Fluid Levels: Check engine oil, coolant, brake fluid, and windshield washer fluid levels.",
//         "Belts and Hoses: Inspect belts and hoses for signs of wear or damage.",
//         "Battery: Check battery terminals and ensure they are clean and secure.",
//         "Engine Condition: Look for leaks or signs of engine problems.",
//       ],
//       "noteName": 'engineCompartmentNote'
//     },
//     {
//       "title": "Under Carriage Inspection",
//       "description": [
//         "Exhaust System: Check for leaks, rust, and damage in the exhaust system.",
//         "Suspension: Inspect shocks, struts, and suspension components.",
//         "Brakes: Check brake lines, pads, and rotors for wear.",
//         "Steering: Test the steering system for smooth operation.",
//       ],
//       "noteName": 'undercarriageNote'
//     },
//     {
//       "title": "Safety Equipment",
//       "description": [
//         "Spare Tire and Tools: Verify the presence of a functional spare tire and tools.",
//         "Jack: Check the functionality and condition of the vehicle jack.",
//         "Warning Triangles: Ensure warning triangles are available in case of emergencies",
//         "First Aid Kit: Check for the presence and completeness of a first aid kit.",
//       ],
//       "noteName": 'safetyNote'
//     },
//     {
//       "title": "Vehicle Documentation",
//       "description": [
//         "Vehicle Registration: Verify that the vehicle registration is valid and up-to-date.",
//         "Insurance: Ensure the vehicle is adequately insured",
//         "Service Records: Review the vehicle's service history and maintenance records",
//         "Owner's Manual: Check for the presence of the vehicle's owner's manual.",
//       ],
//       "noteName": 'vehicleNote'
//     },
//     {
//       "title": "Compliance And Emissions",
//       "description": [
//         "Emission Control System: Check for compliance with emission standards",
//         "Vehicle Inspection Sticker: Ensure the vehicle has a valid inspection sticker",
//         "Compliance with Local Regulations: Verify compliance with local vehicle regulations.",
//       ],
//       "noteName": 'complianceNote'
//     },
//   ];
//
//   var logger = Logger(
//     printer: PrettyPrinter(),
//   );
//
//   var loggerNoStack = Logger(
//     printer: PrettyPrinter(methodCount: 0),
//   );
//
//   addInspection(Map<String, dynamic> data, String id) async {
//     token = context.read<LoginCubit>().authToken!;
//     setState(() {
//       loading = true;
//     });
//
//     try {
//       String message =
//           await context.read<InspectionCubit>().addInspection(data, token);
//       Navigator.pop(context);
//       await context.read<DispatchCubit>().assignID(id);
//       await showSuccessToast(message);
//     } catch (err) {
//       setState(() {
//         loading = false;
//       });
//       print(err);
//     }
//     setState(() {
//       loading = false;
//     });
//   }
//
//   String dateTimeToEpochString(DateTime dateTime) {
//     var epoch = dateTime.millisecondsSinceEpoch * 1000;
//     return epoch.round().toString();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: "Vehicle Inspection",
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: SingleChildScrollView(
//           child: FormBuilder(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomTextField(
//                   name: 'inspectionId',
//                   placeHolder: "inspectionId",
//                   validators: [],
//                   labelName: "Inspection Id",
//                 ),
//                 CustomDateTimePicker(
//                   placholder: "select the date",
//                   name: 'dateOfInspection',
//                   labelName: 'Date of Inspection',
//                 ),
//                 CustomDropdownComponent(
//                   labelName: 'Vehicle Number',
//                   placeHolder: 'Select Truck',
//                   name: 'vehicleNumber',
//                   items: context
//                           .read<TruckListCubit>()
//                           .dataList
//                           ?.dataList
//                           ?.toList() ??
//                       [],
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 CustomTextField(
//                   name: 'inspectorName',
//                   placeHolder: "Inspector Name",
//                   validators: [],
//                   labelName: "Inspector Name",
//                 ),
//                 Column(
//                   children: inspection.map((item) {
//                     return InspectionComponent(
//                       title: "${item["title"]}",
//                       description: item["description"],
//                       radioOptions: const [
//                         FormBuilderFieldOption(value: "Yes"),
//                         FormBuilderFieldOption(value: "No"),
//                         FormBuilderFieldOption(value: "N/A"),
//                       ],
//                       radioGroupName: "${item["title"]}",
//                       notesWidget: Row(children: [
//                         Flexible(
//                             child: Text(
//                                 "Notes/Observations corrective actions if any:")),
//                         SizedBox(width: 10.w),
//                         Expanded(
//                             child: CustomAddressTextField(
//                           name: item['noteName'],
//                           placeHolder: "",
//                           validators: [],
//                         ))
//                       ]),
//                       // radioGroupLabel: "Role",
//                     );
//                   }).toList(),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     OutlinedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(07.0)),
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 24, vertical: 12)
//                                 .r,
//                       ),
//                       onPressed: () {
//                         // onSubmit(context);
//                         Navigator.of(context).pop();
//                       },
//                       child: Text(
//                         'Cancel',
//                         style: TextStyle(fontSize: 16.sp, color: Colors.black),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10.h,
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Constants.primaryColor,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(07.0)),
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 24, vertical: 12)
//                                 .r,
//                       ),
//                       onPressed: () async {
//                         final formData = _formKey.currentState!.value;
//                         CommonFunction.loggerNoStack.t(formData);
//                         if (_formKey.currentState!.saveAndValidate()) {
//                           print("validate");
//                           final formData = _formKey.currentState!.value;
//                           CommonFunction.loggerNoStack.t(formData);
//                           final result = {
//                             "inspectionId": formData['inspectionId'],
//                             "inspectionDate": dateTimeToEpochString(
//                                 formData['dateOfInspection']),
//                             "vehicleNumber": formData['vehicleNumber'],
//                             "inspectorName": formData['inspectorName'],
//                             "exteriorInspection": {
//                               "bodyCondition": formData['Body Condition'],
//                               "glassAndMirrors": formData['Glass and Mirrors'],
//                               "licencePlates": formData['License Plates'],
//                               "light": formData['Light'],
//                               "tires": formData['Tires'],
//                               "notes": formData['ExteriorNote'],
//                               "Body Conditionimg":
//                                   formData['Body Conditionimg'],
//                               //"Glass and Mirrorsimg": formData['Glass and Mirrorsimg'],
//                               //"License Platesimg": formData['License Platesimg'],
//                               //"Lightimg": formData['Lightimg'],
//                               //"Tiresimg": formData['Tiresimg'],
//                               "urls": {
//                                 if (formData['Body Conditionimg'] is String)
//                                   "Body Conditionimg": ["BodyImage"],
//                                 if (formData["Glass and Mirrorsimg"] is String)
//                                   "Glass and Mirrorsimg": ["GlassMirrorImage"],
//                                 if (formData["License Platesimg"] is String)
//                                   "License Platesimg": ["LicensePlatesImage"],
//                                 if (formData["Lightimg"] is String)
//                                   "LightImg": ["LightImage"],
//                                 if (formData["Tiresimg"] is String)
//                                   "TiresImage": ["TireImage"]
//                               }
//                             },
//                             "interiorInspection": {
//                               "seatBelts": formData['Seatbelts'],
//                               "dashboard": formData['Dashboard'],
//                               "controls": formData['Controls'],
//                               "seatsAndUpholstery":
//                                   formData['Seats and Upholstery'],
//                               "floorMats": formData['Floor Mats'],
//                               "notes": formData['InteriorNote'],
//                               //"Seatbeltsimg": formData['Seatbeltsimg'],
//                               //"Dashboardimg": formData['Dashboardimg'],
//                               //"Controlsimg": formData['Controlsimg'],
//                               //"Seats and Upholsteryimg": formData['Seats and Upholsteryimg'],
//                               //"Floor Matsimg": formData['Floor Matsimg'],
//                               "urls": {
//                                 if (formData['Seatbeltsimg'] is String)
//                                   "Seatbeltsimg": ["SeatBeltsImage"],
//                                 if (formData['BDashboardimg'] is String)
//                                   "Dashboardimg": ["DashboardImage"],
//                                 if (formData['Controlsimg'] is String)
//                                   "Controlsimg": ["ControlsImage"],
//                                 if (formData['Seats and Upholsteryimg']
//                                     is String)
//                                   "Seats and Upholsteryimg": [
//                                     "SeatsAndUpholsteryImage"
//                                   ],
//                                 if (formData['Floor Matsimg'] is String)
//                                   "Floor MatsImg": ["FloorMatsImage"]
//                               }
//                             },
//                             "engineCompartment": {
//                               "fluidLevels": formData['Fluid Levels'],
//                               "beltsAndHoses": formData['Belts and Hoses'],
//                               "battery": formData['Battery'],
//                               "engineCondition": formData['Engine Condition'],
//                               "notes": formData['engineCompartmentNote'],
//                               //"Fluid Levelsimg": formData['Fluid Levelsimg'],
//                               //"Belts and Hosesimg": formData['Belts and Hosesimg'],
//                               //"Batteryimg": formData['Batteryimg'],
//                               //"Engine Conditionimg": formData['Engine Conditionimg'],
//                               "urls": {
//                                 if (formData['Fluid Levelsimg'] is String)
//                                   "Fluid Levelsimg": ["FluidLevelsImage"],
//                                 if (formData['Belts and Hosesimg'] is String)
//                                   "Belts and Hosesimg": [
//                                     "Belts and HosesImage"
//                                   ],
//                                 if (formData['Batteryimg'] is String)
//                                   "Batteryimg": ["BatteryImage"],
//                                 if (formData['Engine Conditionimg'] is String)
//                                   "Engine Conditionimg": [
//                                     "EngineConditionImage"
//                                   ],
//                               }
//                             },
//                             "undercarriageInspection": {
//                               "exhaustSystem": formData['Exhaust System'],
//                               "suspension": formData['Suspension'],
//                               "brakes": formData['Brakes'],
//                               "steering": formData['Steering'],
//                               "notes": formData['undercarriageNote'],
//                               //"Exhaust Systemimg":formData['Exhaust Systemimg'],
//                               //"Suspensionimg":formData['Suspensionimg'],
//                               //"Brakesimg": formData['Brakesimg'],
//                               //"Steeringimg":formData['Steeringimg'],
//                               "urls": {
//                                 if (formData['Exhaust Systemimg'] is String)
//                                   "Exhaust Systemimg": ["ExhaustSystemImage"],
//                                 if (formData['Suspensionimg'] is String)
//                                   "Suspensionimg": ["SuspensionImage"],
//                                 if (formData['Brakesimg'] is String)
//                                   "Brakesimg": ["BrakesImage"],
//                                 if (formData['Steeringimg'] is String)
//                                   "Steeringimg": ["SteeringImage"],
//                               }
//                             },
//                             "safetyEquipment": {
//                               "spareTireAndTools":
//                                   formData['Spare Tire and Tools'],
//                               "jack": formData['Jack'],
//                               "warningTriangles": formData['Warning Triangles'],
//                               "firstAidKid": formData['First Aid Kit'],
//                               "notes": formData['safetyNote'],
//                               //"Spare Tire and Toolsimg": formData['Spare Tire and Toolsimg'],
//                               //"Jackimg": formData['Jackimg'],
//                               //"Warning Trianglesimg": formData['Warning Trianglesimg'],
//                               //"First Aid Kitimg": formData['First Aid Kitimg'],
//                               "urls": {
//                                 if (formData['Spare Tire and Toolsimg']
//                                     is String)
//                                   "Spare Tire and Toolsimg": [
//                                     "Spare Tire and ToolsImage"
//                                   ],
//                                 if (formData['Jackimg'] is String)
//                                   "Jackimg": ["JackImage"],
//                                 if (formData['Warning Trianglesimg'] is String)
//                                   "Warning Trianglesimg": [
//                                     "Warning TrianglesImage"
//                                   ],
//                                 if (formData['First Aid Kitimg'] is String)
//                                   "First Aid Kitimg": ["First Aid Kit Image"],
//                               }
//                             },
//                             "vehicleDocumentation": {
//                               "vehicleRegistration":
//                                   formData['Vehicle Registration'],
//                               "insurance": formData['Insurance'],
//                               "serviceRecords": formData['Service Records'],
//                               "ownersManual": formData["Owner's Manual"],
//                               "notes": formData['vehicleNote'],
//                               //"Vehicle Registrationimg": formData['Vehicle Registrationimg'],
//                               //"Insuranceimg": formData['Insuranceimg'],
//                               //"Service Recordsimg": formData['Service Recordsimg'],
//                               //"Owner's Manualimg": formData["Owner's Manualimg"],
//                               "urls": {
//                                 if (formData['Vehicle Registrationimg']
//                                     is String)
//                                   "Vehicle Registrationimg": [
//                                     "VehicleRegistrationImage"
//                                   ],
//                                 if (formData['Insuranceimg'] is String)
//                                   "Insuranceimg": ["InsuranceImage"],
//                                 if (formData['Service Recordsimg'] is String)
//                                   "Service Recordsimg": [
//                                     "Service Records Image"
//                                   ],
//                                 if (formData["Owner's Manualimg"] is String)
//                                   "Owner's Manualimg": ["Owner's Manual Image"],
//                               }
//                             },
//                             "complianceAndEmissions": {
//                               "emissionControlSystem":
//                                   formData['Emission Control System'],
//                               "vehicleInspectionSticker":
//                                   formData['Vehicle Inspection Sticker'],
//                               "complianceWithLocalRegulation":
//                                   formData['Compliance with Local Regulations'],
//                               "notes": formData['complianceNote'],
//                               //"Emission Control Systemimg": formData['Emission Control Systemimg'],
//                               //"Vehicle Inspection Stickerimg": formData['Vehicle Inspection Stickerimg'],
//                               //"Compliance with Local Regulationsimg": formData['Compliance with Local Regulationsimg'],
//                               "urls": {
//                                 if (formData['Emission Control Systemimg']
//                                     is String)
//                                   "Emission Control Systemimg": [
//                                     "Emission Control System Image"
//                                   ],
//                                 if (formData['Vehicle Inspection Stickerimg']
//                                     is String)
//                                   "Vehicle Inspection Stickerimg": [
//                                     "Vehicle Inspection Sticker Image"
//                                   ],
//                                 if (formData[
//                                         'Compliance with Local Regulationsimg']
//                                     is String)
//                                   "Compliance with Local Regulationsimg": [
//                                     "Compliance with Local Regulations Image"
//                                   ],
//                               }
//                             },
//                           };
//                           print("inspection result");
//                           CommonFunction.loggerNoStack.t(result);
//                           addInspection(result, formData['inspectionId']);
//                         } else {
//                           print("Form is not Valid");
//                         }
//                       },
//                       child: loading
//                           ? SizedBox(
//                               child: CircularProgressIndicator(
//                                 color: Constants.white,
//                                 strokeWidth: 3,
//                               ),
//                               height: 15.h,
//                               width: 15.w,
//                             )
//                           : Text(
//                               'Submit',
//                               style:
//                                   TextStyle(fontSize: 16, color: Colors.white),
//                             ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
