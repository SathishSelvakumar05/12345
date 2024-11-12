// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class Constants {
//   static const bool isCoreYaantrac = true;
//
//   static const primaryBlue = Colors.blue;
//   static const primary = isCoreYaantrac ? primaryBlue : Color(0xFFFf39527);
//   static const customGrey = Color(0xFFF6F6F6);
//   static const primaryColor = isCoreYaantrac ? primaryBlue : Color(0xFFFf39527);
//
//   static MaterialColor primarySwatch = _generateMaterialColor(primaryColor);
//   static List<Color> blueShade = [
//     Colors.blue.shade50,
//     Colors.blue[800]!,
//     Colors.lightBlueAccent,
//     Colors.blue.shade50
//   ];
//   static List<Color> aykaShade = [
//     Colors.orange.shade50,
//     Colors.teal,
//     Colors.orangeAccent,
//     Colors.orange.shade50
//   ];
//   static MaterialColor _generateMaterialColor(Color color) {
//     return MaterialColor(color.value, {
//       50: color.withOpacity(0.1),
//       100: color.withOpacity(0.2),
//       200: color.withOpacity(0.3),
//       300: color.withOpacity(0.4),
//       400: color.withOpacity(0.5),
//       500: color.withOpacity(0.6),
//       600: color.withOpacity(0.7),
//       700: color.withOpacity(0.8),
//       800: color.withOpacity(0.9),
//       900: color.withOpacity(1.0),
//     });
//   }
//
//   static const secondary1 = const MaterialColor(
//     0xFFeceeff,
//     const <int, Color>{
//       50: const Color(0xFF2DAFBC),
//       100: const Color(0xFF2DAFBC),
//       200: const Color(0xFF2DAFBC),
//       300: const Color(0xFF2DAFBC),
//       400: const Color(0xFF2DAFBC),
//       500: const Color(0xFF2DAFBC),
//       600: const Color(0xFF2DAFBC),
//       700: const Color(0xFF2DAFBC),
//       800: const Color(0xFF2DAFBC),
//       900: const Color(0xFF2DAFBC),
//     },
//   );
//
//   //static final secondary = Colors.blue[800];
//   static final secondary = isCoreYaantrac ? primaryBlue : Color(0xFFF0a585c);
//   static const buttontxt = Colors.white;
//   static const textLink = Colors.blueAccent;
//   static const ErrorText = Colors.red;
//   static const on = Colors.green;
//   static const ons = Colors.greenAccent;
//   static const AlertText = Colors.redAccent;
//   static const AppbarText = Colors.white;
//   static const BottomNavbar = Colors.white;
//   static const CardColor = Colors.white;
//   static const black = Colors.black;
//   static const white = Colors.white;
//   static const splashColor = Colors.grey;
//   static const splashScreenColor = Colors.blue;
//   static const yellowColor = Colors.yellow;
//   static const orange = Colors.orange;
//   static const Color darkTitleColor = Color(0xFF0D0D26);
//
//   static const appName = isCoreYaantrac ? 'Yaantrac' : "Ayka";
//   // static const appLogo =
//   //   isCoreYaantrac ? ImageConstants.yaantracLogo : ImageConstants.ayka;
//   static List<Color> appShade =
//       isCoreYaantrac ? Constants.blueShade : Constants.aykaShade;
//   //dateFormat
//   static String dateFormat = "d-MMM-y";
//
//   //App Version
//   static const String appVersion = "2.2.0";
//
//   //Styles
//   static final yaantracStyle = TextStyle(
//       color: Constants.AppbarText,
//       fontWeight: FontWeight.bold,
//       fontSize: 22.sp);
//   static final CardHeadingStyle = TextStyle(
//       color: Constants.primary, fontWeight: FontWeight.bold, fontSize: 20.sp);
//   static final WelcomeHeaderStyle = TextStyle(
//       color: Constants.AppbarText,
//       fontSize: 25.sp,
//       fontWeight: FontWeight.bold);
//   static final CalendarStyle = TextStyle(
//       color: Constants.primary, fontSize: 20.sp, fontWeight: FontWeight.bold);
//
//   //Organization Details
//   static const organizationName = "Datayaan Solutions Private Limited";
//   static const organizationType = "IT";
//   static const address = "Tambaram MPEZ";
//   static const city = "Chennai";
//   static const state = "TamilNadu";
//   static const country = "India";
//   static const postCode = "600048";
//   static const email = "contact@datayaan.com";
//   static const website = "datayaan.com";
//   static const phone = "044 2227 1400";
//   static const humanResources = "31";
//   static const statement =
//       "I hereby certify that I have conducted the above vehicle inspection and that the vehicle has been thoroughly inspected for safety and compliance.Any identified issues have been documented, and necessary corrective actions have been recommended.";
//
//   //Constant Text
//   static const dispatchManagement = "Dispatch Management";
//
//   //Linear Gradient
//   static LinearGradient get MainGradient {
//     return LinearGradient(
//       colors: [
//         Color.fromRGBO(21, 101, 192, 1),
//         Color.fromRGBO(33, 150, 243, 1),
//       ],
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//       stops: [0, 1],
//     );
//   }
//
//   // static Container get ImageCover {
//   //   // return Container(
//   //   //   child: Image(
//   //   //     image: AssetImage(ImageConstants.truckCover),
//   //   //     fit: BoxFit.fill,
//   //   //     height: 250.h,
//   //   //     width: 100.sw,
//   //   //   ),
//   //   // );
//   // }
//
//   //Main Appbar container
//   static Widget ImageMainAppBar() {
//     return Stack(
//       alignment: AlignmentDirectional.center,
//       children: <Widget>[
//         //  ImageCover,
//         Column(
//           children: <Widget>[
//             // Image(
//             //   image: AssetImage(ImageConstants.yaantracLogo),
//             //   height: 75.h,
//             //   width: 75.w,
//             // ),
//             Text(
//               "Yaantrac",
//               style: yaantracStyle,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   static Container MainAppbar() {
//     return Container(
//       height: 300.h,
//       decoration: BoxDecoration(
//         gradient: MainGradient,
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(50.r),
//           bottomRight: Radius.circular(50.r),
//         ),
//       ),
//       child: Center(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 100.h,
//             ),
//             // Image(
//             //   image: AssetImage(ImageConstants.yaantracLogo),
//             //   height: 75.h,
//             //   width: 75.w,
//             // ),
//             Text(
//               "Yaantrac",
//               style: yaantracStyle,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   static Container drawerTopBar(String userName) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 20.h),
//       decoration: BoxDecoration(
//         gradient: MainGradient,
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(40.r),
//           bottomRight: Radius.circular(40.r),
//         ),
//       ),
//       child: SafeArea(
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               Icon(
//                 Icons.account_circle,
//                 size: 80.r,
//                 color: Colors.white,
//               ),
//               Text(
//                 '${userName.toUpperCase()}',
//                 style: TextStyle(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
