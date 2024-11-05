// // import 'package:dio/dio.dart';
// import 'dart:ui';
//
// import 'package:animate_gradient/animate_gradient.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/services.dart';
// import 'package:new_try/yaantrac_login_screen/screen/policy_screen.dart';
// // import 'package:tracking/Features/Dashboard/Presentation/Screen/dashboardScreen.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// //
// // import '../../../../Others/privacyPolicy.dart';
// // import '../../../../../Helper/constants.dart';
// // import '../../../../Others/termsAndCondition.dart';
// // import '../../../ForgotPassword/Presentation/Screen/forgotPasswordScreen.dart';
// // import '../../Cubit/login_cubit.dart';
// // import '../../Cubit/login_state.dart';
// import 'PrivacyPolicyText.dart';
// import 'TermsOfServiceText.dart';
// import 'constantsColors.dart';
// import 'forget_password.dart';
//
// class LoginComponent extends StatefulWidget {
//   @override
//   State<LoginComponent> createState() => _LoginComponentState();
// }
//
// class _LoginComponentState extends State<LoginComponent>
//     with TickerProviderStateMixin {
//   bool _isChecked = false;
//   bool _isObsecure = true;
//   bool _loggedIn = false;
//   bool _checkboxValue = false;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool _isPasswordVisible = false;
//   double _buttonOpacity = 0.5;
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   bool loading = false;
//
// /*
//   Future<void> loginFunction(BuildContext context) async {
//     Map<String, dynamic> loginData = {
//       "roleType": "user",
//       "userID": _emailController.text,
//       "password": _passwordController.text,
//       "roleType": "user"
//     };
//     try {
//       await context.read<LoginCubit>().login(loginData);
//       if (context.read<LoginCubit>().statusCode == 200) {
//         Navigator.pushNamedAndRemoveUntil(
//             context, DashboardScreen.routeName, (route) => false);
//         Fluttertoast.showToast(
//           msg: "Login Successfully",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.TOP,
//           backgroundColor: Colors.green,
//           textColor: Colors.white,
//         );
//       }
//     } on DioException catch (err) {
//       if (context.read<LoginCubit>().statusCode == 400) {
//         Fluttertoast.showToast(
//           msg: "Invalid username or password",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.TOP,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//         );
//       } else {
//         Fluttertoast.showToast(
//           msg: 'Something went wrong',
//           //msg: err.response!.data["error"],
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.TOP,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//         );
//       }
//
//       rethrow;
//     }
//   }
// */
//
//   void _updateButtonOpacity() {
//     setState(() {
//       _buttonOpacity = (_emailController.text.isNotEmpty &&
//               _passwordController.text.isNotEmpty &&
//               _checkboxValue)
//           ? 1.0
//           : 0.8;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // return BlocBuilder<LoginCubit, Login>(
//     //   builder: (context, loginState) {
//     return Scaffold(
//       body: AnimateGradient(
//         primaryColors: [
//           Colors.blue,
//           Colors.white,
//           Colors.white,
//         ],
//         secondaryColors: [
//           Colors.white,
//           Colors.blueAccent,
//           Colors.lightBlueAccent,
//         ],
//         child: Container(
//           height: double.infinity,
//           width: double.infinity,
//           alignment: Alignment.center,
//           child: Container(
//             height: 450,
//             width: double.infinity,
//             margin: EdgeInsets.symmetric(horizontal: 30),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.white),
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.black.withOpacity(0.1),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Form(
//                       key: _formKey,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               Image.asset(
//                                 'aasets/images/favicon256.png',
//                                 width: 50.w,
//                                 height: 50.h,
//                               ),
//                               SizedBox(height: 5.h),
//                               Text(
//                                 'Constants.appName',
//                                 style: GoogleFonts.khula(
//                                   letterSpacing: 2,
//                                   fontSize: 15.sp,
//                                   color: Constants.secondary,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               Constants.isCoreYaantrac
//                                   ? SizedBox()
//                                   : Text(
//                                       'Tracking Partner',
//                                       style: GoogleFonts.khula(
//                                         letterSpacing: 2,
//                                         fontSize: 14.sp,
//                                         color: Constants.primary,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                               SizedBox(height: 10.h),
//                               Text(
//                                 'Login',
//                                 style: GoogleFonts.khula(
//                                   fontSize: 35.sp,
//                                   color: Constants.secondary,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 10.h),
//                           Form(
//                             key: _formKey,
//                             child: Column(
//                               children: [
//                                 TextFormField(
//                                   controller: _emailController,
//                                   keyboardType: TextInputType.emailAddress,
//                                   decoration: InputDecoration(
//                                     labelText: 'Username',
//                                     labelStyle: GoogleFonts.inter(
//                                         fontSize: 18.sp,
//                                         color: Constants.black),
//                                     hintText: 'Enter the Username ',
//                                     prefixIcon: Icon(
//                                       Icons.person_2_outlined,
//                                       size: 25.r,
//                                       color: Colors.black,
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(20.0).r,
//                                     ),
//                                   ),
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Please enter the username';
//                                     } else if (value.length < 3 ||
//                                         value.length > 30) {
//                                       return 'Username must be between 3 to 30 characters';
//                                     }
//                                     return null;
//                                   },
//                                   inputFormatters: [
//                                     LengthLimitingTextInputFormatter(30),
//                                   ],
//                                   onChanged: (value) {
//                                     _updateButtonOpacity();
//                                   },
//                                 ),
//                                 SizedBox(height: 30.h),
//                                 TextFormField(
//                                   controller: _passwordController,
//                                   keyboardType: TextInputType.visiblePassword,
//                                   obscureText: !_isPasswordVisible,
//                                   decoration: InputDecoration(
//                                     labelText: 'Password',
//                                     labelStyle: GoogleFonts.inter(
//                                         fontSize: 18.sp,
//                                         color: Constants.black),
//                                     hintText: 'Enter the password',
//                                     prefixIcon: Icon(
//                                       Icons.lock_outline,
//                                       size: 25.r,
//                                       color: Constants.black,
//                                     ),
//                                     suffixIcon: GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           _isPasswordVisible =
//                                               !_isPasswordVisible;
//                                         });
//                                       },
//                                       child: Icon(
//                                         _isPasswordVisible
//                                             ? Icons.visibility_outlined
//                                             : Icons.visibility_off_outlined,
//                                         size: 25.r,
//                                         color: Constants.black,
//                                       ),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(20.0).r,
//                                     ),
//                                   ),
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Please enter the password';
//                                     } else if (value.length < 8 ||
//                                         value.length > 16) {
//                                       return 'Password must be between 8 to 16 characters';
//                                     }
//                                     return null;
//                                   },
//                                   inputFormatters: [
//                                     LengthLimitingTextInputFormatter(30),
//                                   ],
//                                   onChanged: (value) {
//                                     _updateButtonOpacity();
//                                   },
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.fromLTRB(20, 20, 0, 20).r,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   ForgetPasswordScreen(),
//                                             ),
//                                           );
//                                         },
//                                         child: Text(
//                                           'Forgot Password ?',
//                                           style: GoogleFonts.inter(
//                                             color: Constants.primary,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 15.sp,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 10.h),
//                                 Wrap(
//                                   direction: Axis.horizontal,
//                                   crossAxisAlignment: WrapCrossAlignment.center,
//                                   children: [
//                                     Checkbox(
//                                       value: _checkboxValue,
//                                       onChanged: (bool? value) {
//                                         setState(() {
//                                           _checkboxValue = value!;
//                                           _updateButtonOpacity();
//                                         });
//                                       },
//                                     ),
//                                     Text(
//                                       "I agree to the ",
//                                       style: GoogleFonts.inter(
//                                         fontSize: 11.sp,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     InkWell(
//                                       child: Text(
//                                         "Privacy Policy ",
//                                         style: GoogleFonts.inter(
//                                           color: Constants.secondary,
//                                           fontSize: 11.sp,
//                                           fontWeight: FontWeight.w500,
//                                           decoration: TextDecoration.underline,
//                                         ),
//                                       ),
//                                       onTap: () async {
//                                         showModalBottomSheet(
//                                           isScrollControlled: true,
//                                           // barrierColor: Colors.white38,
//                                           shape: ContinuousRectangleBorder(
//                                               borderRadius: BorderRadius.only(
//                                                   topRight:
//                                                       Radius.circular(80).r,
//                                                   topLeft:
//                                                       Radius.circular(80).r)),
//                                           context: context,
//                                           builder: (BuildContext context) {
//                                             return Container(
//                                               height: 400.h,
//                                               child: SingleChildScrollView(
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.all(16.0)
//                                                           .r,
//                                                   child: PrivacyPolicyText(),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         );
//                                         /* Uri url = Uri.parse(
//                                         "https://www.yaantrac.com/privacy-policy/");
//                                     if (await canLaunchUrl(url)) {
//                                       await launchUrl(url);
//                                     }*/
//                                       },
//                                     ),
//                                     InkWell(
//                                       child: Text(
//                                         "Terms & Conditions",
//                                         style: GoogleFonts.inter(
//                                           color: Constants.secondary,
//                                           fontSize: 11.sp,
//                                           fontWeight: FontWeight.w500,
//                                           decoration: TextDecoration.underline,
//                                         ),
//                                       ),
//                                       onTap: () async {
//                                         showModalBottomSheet(
//                                           isScrollControlled: true,
//                                           // barrierColor: Colors.white38,
//                                           shape: ContinuousRectangleBorder(
//                                               borderRadius: BorderRadius.only(
//                                                   topRight:
//                                                       Radius.circular(80).r,
//                                                   topLeft:
//                                                       Radius.circular(80).r)),
//                                           context: context,
//                                           builder: (BuildContext context) {
//                                             return Container(
//                                               height: 400.h,
//                                               child: SingleChildScrollView(
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.all(16.0)
//                                                           .r,
//                                                   child: TermsOfServiceText(),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         );
//
//                                         // Uri url = Uri.parse(
//                                         //     "https://www.yaantrac.com/terms-and-conditions/");
//                                         // if (await canLaunchUrl(url)) {
//                                         //   await launchUrl(url);
//                                         // }
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 15.h),
//                                 // context.read<LoginCubit>().state.loginLoading!
//                                 //     ? CircularProgressIndicator()
//                                 //     :
//                                 //     AnimatedOpacity(
//                                 //         opacity: _buttonOpacity,
//                                 //         duration: Duration(milliseconds: 500),
//                                 //         child:
//                                 ElevatedButton(
//                                   onPressed: _emailController.text.isNotEmpty &&
//                                           _passwordController.text.isNotEmpty &&
//                                           _checkboxValue
//                                       ? () {
//                                           if (_formKey.currentState!
//                                               .validate()) {
//                                             // loginFunction(context);
//                                           }
//                                         }
//                                       : null,
//                                   child: Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(vertical: 15.0).r,
//                                     child: Text(
//                                       'Login',
//                                       style: GoogleFonts.inter(
//                                         fontSize: 20.sp,
//                                         color: _buttonOpacity == 1.0
//                                             ? Constants.white
//                                             : Constants.black,
//                                       ),
//                                     ),
//                                   ),
//                                   style: ElevatedButton.styleFrom(
//                                     minimumSize: Size(double.infinity.w, 60.h),
//                                     backgroundColor: Constants.secondary,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(20.0).r,
//                                     ),
//                                   ),
//                                 ),
// //),
//                               ],
//                             ),
//                           ),
//                         ],
//                       )),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//     //   },
//     // );
//   }
// }
