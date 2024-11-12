import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_try/svg_image_generator/screen/car_screen.dart';
import 'package:new_try/trip_booking/screen/scroll_img.dart';
import 'package:new_try/yaantrac_login_screen/github/login_git1/screen/screeen1.dart';
import 'package:new_try/yaantrac_login_screen/screen/login_screen.dart';
import 'package:new_try/yaantrac_login_screen/screen/mainscreen.dart';
import 'package:new_try/yaantrac_login_screen/screen/try.dart';
import 'package:new_try/yaantrac_login_screen/screen/yaantrac_slidable_1st_install.dart';

import 'UI_code_guide/bottom_navigation/scroll_hide_bottom/example1.dart';
import 'UI_code_guide/bottom_navigation/scroll_hide_bottom/example_2.dart';
import 'UI_code_guide/tabbar/screen/screen1.dart';
import 'animated_icon/screen/screen1.dart';
import 'animation_tab_to_fullscreen/screen/screen1.dart';
import 'autoplanner_add_tour/screen/add_external_vehicle/screen1.dart';
import 'autoplanner_add_tour/screen/tabbar_tour.dart';
import 'autoplanner_add_tour/screen/tour_screen.dart';
import 'autoplanner_appbar_flip/screen/mainscreen.dart';
import 'autoplanner_flip/presentation/home_screen.dart';
import 'chart_popup_rakaz/barchart_sreen/barchart.dart';
import 'chart_popup_rakaz/barchart_sreen/combine chart_1_2.dart';
import 'chart_popup_rakaz/barchart_sreen/pie_chart.dart';
import 'egypt_filePicker/screen/pick_image.dart';
import 'egypt_filePicker/screen/try_screen1.dart';
import 'image_tap_to_full/screen/screen1.dart';
import 'ola_map2/screen.dart';

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
          home: BottomExampleTwo(),
        );
      },
    );
  }
}
