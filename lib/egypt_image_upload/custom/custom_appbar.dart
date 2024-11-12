// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../Helper/constants.dart';
// // import 'package:anim_search_bar/anim_search_bar.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final bool? isBackFunction;
//   final Function? backFunction;
//   final bool isDashBoard;
//   final Widget? actions;
//
//   const CustomAppBar(
//       {Key? key,
//       this.title = "",
//       this.isDashBoard = false,
//       this.isBackFunction = false,
//       this.backFunction,
//       this.actions})
//       : preferredSize = const Size.fromHeight(kToolbarHeight),
//         super(key: key);
//   @override
//   final Size preferredSize; // default is 56.0
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0.0,
//       backgroundColor: Constants.secondary1,
//       automaticallyImplyLeading: false,
//       title: Text(
//         title,
//         style: TextStyle(
//             fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black),
//       ),
//       centerTitle: true,
//       leading: isDashBoard == true
//           ? const SizedBox()
//           : IconButton(
//               icon: const Icon(
//                 Icons.arrow_back_ios_new,
//                 // color: Colors.black,
//               ),
//               onPressed: () => isBackFunction!
//                   ? backFunction!()
//                   : Navigator.of(context).pop(),
//             ),
//       actions: actions != null
//           ? [
//               Padding(
//                 padding: const EdgeInsets.only(right: 15.0),
//                 child: actions!,
//               )
//             ]
//           : [],
//     );
//   }
// }
