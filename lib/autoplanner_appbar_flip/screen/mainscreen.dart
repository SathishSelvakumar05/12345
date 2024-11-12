// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:new_try/autoplanner_appbar_flip/screen/second_screen.dart';
//
// import 'first_screen.dart';
// import 'flip.dart';
//
// class AutoPlannerHomeScreen extends StatefulWidget {
//   const AutoPlannerHomeScreen({super.key});
//
//   @override
//   State<AutoPlannerHomeScreen> createState() => _AutoPlannerHomeScreenState();
// }
//
// class _AutoPlannerHomeScreenState extends State<AutoPlannerHomeScreen> {
//   bool loading = false;
//   // void reload() {
//   //   Future.delayed(const Duration(milliseconds: 100), () {
//   //     setState(() {
//   //       loading = false;
//   //     });
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         surfaceTintColor: Colors.transparent,
//         centerTitle: true,
//         title: FlipSwitchWidget(
//           color: Theme.of(context).primaryColor,
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           leftLabel: "Car",
//           rightLabel: "Train",
//           onUpdate: () {
//             setState(() {
//               loading = !loading;
//             });
//             // reload();
//           },
//         ),
//       ),
//       body: loading ? FirstScreen1() : SecondScreen(),
//     );
//   }
// }
