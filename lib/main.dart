import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_try/trip_booking/screen/scroll_img.dart';
import 'package:new_try/yaantrac_login_screen/screen/login_screen.dart';
import 'package:new_try/yaantrac_login_screen/screen/mainscreen.dart';
import 'package:new_try/yaantrac_login_screen/screen/try.dart';

import 'chart_popup_rakaz/barchart_sreen/barchart.dart';
import 'chart_popup_rakaz/barchart_sreen/pie_chart.dart';

void main() {
  runApp(MyApp());
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: YaantracLoginScreen(),
//     );
//   }
// }

//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(412, 846),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BarChartDataScreen(),
        );
      },
    );
  }
}
