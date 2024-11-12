// import 'package:dio/dio.dart';
// import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:show_up_animation/show_up_animation.dart';
// import 'package:tracking/AutoPlanner/Component/Common%20functions.dart';
// import '../../../../Features/LoginFeatures/Login/Cubit/login_cubit.dart';
// import '../../../../Helper/constants.dart';
// import '../../../Component/CustomTextField/Custom_DatePicker.dart';
// import '../../../Component/CustomTextField/Custom_TextFormField.dart';
// import '../../Cubit/route_configuration_cubit.dart';
// import '../../Cubit/route_configuration_state.dart';
import '../custom/custom_textfield.dart';

class TwoWayScreen extends StatefulWidget {
  bool? isUpdate = false;
  // StandardRouteViewList? data;
  //PickupTimeWindows? datas;
  TwoWayScreen(
      //{
      // this.data, this.isUpdate, this.datas}
      );
  @override
  State<TwoWayScreen> createState() => _TwoWayScreenState();
}

class _TwoWayScreenState extends State<TwoWayScreen> {
  late TextEditingController _PickupStartController = TextEditingController();
  late TextEditingController _PickupEndController = TextEditingController();
  DateTime? _selectedStartTime;

  late TextEditingController _ReturnController = TextEditingController();
  late TextEditingController _DropController = TextEditingController();
  late TextEditingController _PickupController = TextEditingController();
  // late TextEditingController _DropController = TextEditingController(
  //     text: widget.isUpdate!
  //         ? "${widget.data!.destination!.locationAddress!.toLowerCase()}"
  //         : null);
  // late TextEditingController _PickupController = TextEditingController(
  //     text: widget.isUpdate!
  //         ? "${widget.data!.source!.locationAddress!.toLowerCase()}"
  //         : null);
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _fromTimeController = TextEditingController();
  final TextEditingController _toTimeController = TextEditingController();
  final TextEditingController _returnTimeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  String? token;
  bool? loading = false;
  LatLng? source;
  String? sourcePlace;
  LatLng? destination;
  String? destinationPlace;
  Map<String, dynamic>? model;
  Map<String, dynamic>? updatemodel;
  DateTime? initialDateTime;

  Source_Get(val1, val2) {
    source = val1;
    sourcePlace = val2;
  }

  Destination_Get(val1, val2) {
    destination = val1;
    destinationPlace = val2;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ShowUpAnimation(
        direction: Direction.horizontal,
        offset: -0.2,
        //delayStart:
        // Duration(milliseconds: index * 800),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0).r,
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                AutoCustomTextField(
                  read: false,
                  labelName: 'Tour Name',
                  name: 'routeName',
                  placeHolder: 'Enter Tour Name',
                  initialValue: widget.isUpdate!
                      ? "widget.data!.routeName.toString().toLowerCase()"
                      : '',
                  //  icon: Icon(Icons.location_on),
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'Trip Name is required'),
                    FormBuilderValidators.minLength(3,
                        errorText: 'Please enter a valid name'),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Pickup window',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: AutoCustomTextField(
                        read: false,
                        labelName: 'From',
                        name: 'fromTime',
                        placeHolder: 'hh:mm',
                        textEditingController: _fromTimeController,
                        suffixIcon: Icon(Icons.access_time),
                        suffixClick: () {
                          print('select fromtime');
                        },
                        validators: [
                          FormBuilderValidators.required(
                              errorText: 'From Time is required'),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: AutoCustomTextField(
                        read: false,
                        labelName: 'To',
                        name: 'toTime',
                        placeHolder: 'hh:mm',
                        textEditingController: _toTimeController,
                        suffixIcon: Icon(Icons.access_time),
                        suffixClick: () {
                          print('select totime');
                        },
                        validators: [
                          FormBuilderValidators.required(
                              errorText: 'To Time is required'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                AutoCustomTextField(
                  read: false,
                  labelName: 'Return Time',
                  name: 'returnTime',
                  placeHolder: 'hh:mm',
                  textEditingController: _returnTimeController,
                  suffixIcon: Icon(Icons.access_time),
                  suffixClick: () {
                    print('return time');
                  },
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'Return Time is required'),
                  ],
                ),
                SizedBox(height: 20.h),
                AutoCustomTextField(
                  read: false,
                  labelName: 'Location',
                  name: 'location',
                  placeHolder: 'Enter Tour Location',
                  textEditingController: _locationController,
                  suffixIcon: Icon(Icons.location_on),
                  suffixClick: () {
                    print('location');
                  },
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'Location is required'),
                  ],
                ),

                // autoSuggestion(
                //   labelName: "From Location",
                //   controller: _PickupController,
                //   hintText: "Enter the source location",
                //   name: 'source',
                //   color: Colors.blue,
                //   bordercolor: BorderSide.none,
                //   validators: [
                //     FormBuilderValidators.required(
                //       errorText: 'From Location is required',
                //     ),
                //   ],
                //   values: Source_Get,
                // ),
                // autoSuggestion(
                //   labelName: "Drop Location",
                //   controller: _DropController,
                //   hintText: "Enter the source location",
                //   name: 'source',
                //   color: Colors.blue,
                //   bordercolor: BorderSide.none,
                //   validators: [
                //     FormBuilderValidators.required(
                //       errorText: 'Drop Location is required',
                //     ),
                //   ],
                //   values: Destination_Get,
                // ),
                // DateComponent(
                //   dateFormat: DateFormat('HH:mm'),
                //   inputType: InputType.time,
                //   Controller: _PickupStartController,
                //   color: Colors.blue,
                //   name: "PickUpStart",
                //   labelName: "Pickup Time From",
                //   initialDate: widget.isUpdate!
                //       ? DateFormat('HH:mm').parse(widget.datas!.start!)
                //       : null,
                //   placholder: "StartTime",
                //   validators: [
                //     FormBuilderValidators.required(
                //       errorText: 'PickUp Start Time is required',
                //     ),
                //   ],
                //   onchange: (value) {
                //     setState(() {
                //       _selectedStartTime = value;
                //       _PickupEndController.text = '';
                //     });
                //   },
                // ),
                SizedBox(height: 20.w),
                // DateComponent(
                //   enabled: _selectedStartTime != null,
                //   dateFormat: DateFormat('HH:mm'),
                //   inputType: InputType.time,
                //   Controller: _PickupEndController,
                //   color: Colors.blue,
                //   initialDate: widget.isUpdate!
                //       ? DateFormat('HH:mm').parse(widget.datas!.end!)
                //       : null,
                //   name: "PickUpEnd",
                //   labelName: "Pickup Time To",
                //   placholder: "EndTime",
                //   validators: [
                //     FormBuilderValidators.required(
                //         errorText: 'End Date is required'),
                //     (value) {
                //       if (_selectedStartTime != null && value != null) {
                //         if (value.isBefore(_selectedStartTime!)) {
                //           return 'End Time must be after Start Time';
                //         }
                //       }
                //       return null;
                //     },
                //   ],
                // ),
                SizedBox(height: 20.h),
                // DateComponent(
                //   dateFormat: DateFormat('HH:mm'),
                //   inputType: InputType.time,
                //   Controller: _ReturnController,
                //   color: Colors.blue,
                //   initialDate: widget.isUpdate!
                //       ? DateFormat('HH:mm').parse(widget.data!.dropTime!)
                //       : null,
                //   name: "dropTime",
                //   labelName: "Expected Duration",
                //   placholder: "Expected Duration",
                //   validators: [
                //     FormBuilderValidators.required(
                //         errorText: 'Return Time is required'),
                //   ],
                // ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: 30.w,
                    // ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          //   Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          minimumSize:
                              WidgetStateProperty.all<Size>(Size(120.w, 50.h)),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.0).r,
                            ),
                          ),
                          side: WidgetStateProperty.all<BorderSide>(
                            BorderSide(color: Colors.red),
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            final formData = _formKey.currentState?.value;
                            if (widget.isUpdate!) {
                              updatemodel = {
                                "destination": {
                                  "lat": destination != null
                                      ? destination!.latitude
                                      : " widget.data!.destination!.lat",
                                  "lng": destination != null
                                      ? destination!.latitude
                                      : "widget.data!.destination!.lng",
                                  "locationAddress": destinationPlace != null
                                      ? destinationPlace.toString()
                                      : "widget.data!.destination!.locationAddress.toString()"
                                },
                                "id": "widget.data!.routeID",
                                "pickupTimeWindows": [
                                  {
                                    "end": _PickupEndController.text != null
                                        ? _PickupEndController.text
                                        : "widget.data!.pickupTimeWindows!.map((e) => e.end)",
                                    "start": _PickupStartController.text != null
                                        ? _PickupStartController.text
                                        : "widget.data!.pickupTimeWindows!.map((e) => e.start)"
                                  }
                                ],
                                "routeName": "${formData!['routeName']}",
                                "estimatedDuration": 15600,
                                "bufferTime": "00:10",
                                "source": {
                                  "lat": source != null
                                      ? source!.latitude
                                      : " widget.data!.source!.lat",
                                  "lng": source != null
                                      ? source!.latitude
                                      : "widget.data!.source!.lng",
                                  "locationAddress": sourcePlace != null
                                      ? sourcePlace.toString()
                                      : "widget.data!.source!.locationAddress.toString()"
                                }
                              };
                              //  putData(updatemodel);
                            } else {
                              model = {
                                "destination": {
                                  "lat": destination!.latitude,
                                  "lng": destination!.longitude,
                                  "locationAddress": destinationPlace.toString()
                                },
                                "estimatedDuration": 15600,
                                "bufferTime": "00:10",
                                "pickupTimeWindows": [
                                  {
                                    "start": _PickupStartController.text,
                                    "end": _PickupEndController.text,
                                  }
                                ],
                                "routeName": "${formData!['routeName']}",
                                "source": {
                                  "lat": source!.latitude,
                                  "lng": source!.longitude,
                                  "locationAddress": sourcePlace.toString()
                                }
                              };
                              //  postTrip(model);
                            }
                          }
                        },
                        style: ButtonStyle(
                          minimumSize:
                              WidgetStateProperty.all<Size>(Size(120.w, 50.h)),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.0).r,
                            ),
                          ),
                          backgroundColor:
                              WidgetStateProperty.all<Color>(Colors.blue),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            loading!
                                ? SizedBox(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                    height: 25.h,
                                    width: 25.w,
                                  )
                                : Text(
                                    widget.isUpdate! ? 'Update' : "Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //
  // postTrip(data) async {
  //   token = context.read<LoginCubit>().authToken;
  //   try {
  //     setState(() {
  //       loading = true;
  //     });
  //     String message = await context
  //         .read<RouteConfigurationCubit>()
  //         .addRouteConfig(data, token);
  //     await context
  //         .read<RouteConfigurationCubit>()
  //         .GetAutoRouteConfig({}, token, 1, 10);
  //
  //     Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.SNACKBAR,
  //       timeInSecForIosWeb: 1,
  //       fontSize: 18.0.sp,
  //     );
  //     Navigator.pop(context);
  //   } on DioException catch (e) {
  //     Fluttertoast.showToast(
  //       msg: 'Please check the given data',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.SNACKBAR,
  //       timeInSecForIosWeb: 1,
  //       fontSize: 18.0.sp,
  //     );
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  // }
  //
  // putData(data) async {
  //   token = context.read<LoginCubit>().authToken;
  //   try {
  //     setState(() {
  //       loading = true;
  //     });
  //     String message = await context
  //         .read<RouteConfigurationCubit>()
  //         .updateRouteConfig(data, token);
  //     await context
  //         .read<RouteConfigurationCubit>()
  //         .GetAutoRouteConfig({}, token, 1, 10);
  //     Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.SNACKBAR,
  //       timeInSecForIosWeb: 1,
  //       fontSize: 18.0.sp,
  //     );
  //     Navigator.pop(context);
  //   } on DioException catch (e) {
  //     Fluttertoast.showToast(
  //       msg: e.response!.data['error'],
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.SNACKBAR,
  //       timeInSecForIosWeb: 1,
  //       fontSize: 18.0.sp,
  //     );
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  // }
}
