import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_try/autoplanner_add_tour/screen/round_tour.dart';
import 'package:new_try/autoplanner_add_tour/screen/tour_screen.dart';
import 'package:new_try/autoplanner_add_tour/screen/two_way_sceen.dart';
import 'package:new_try/autoplanner_appbar_flip/screen/second_screen.dart';

import '../custom/custom_tabbar.dart';

class AutoPlannerAddTourScreen extends StatefulWidget {
  const AutoPlannerAddTourScreen({super.key});

  @override
  State<AutoPlannerAddTourScreen> createState() =>
      _AutoPlannerAddTourScreenState();
}

class _AutoPlannerAddTourScreenState extends State<AutoPlannerAddTourScreen> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            onPressed: () {
              //   Navigator.pop(context);
            },
            alignment: Alignment(1.w, -0.2.h),
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Add Tour ',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            FlipSwitchWidget(
              color: Colors.blue,
              backgroundColor: Colors.white,
              leftLabel: "Round Tour",
              rightLabel: "Two Way",
              onUpdate: () {
                setState(() {
                  loading = !loading;
                });
              },
            ),
            Expanded(child: loading ? RoundTourScreen() : TwoWayScreen())
          ],
        ));
  }
}
