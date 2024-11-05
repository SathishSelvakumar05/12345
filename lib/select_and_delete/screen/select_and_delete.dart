// import 'package:creativedesign/views/codeView/code_view_screen.dart';
// import 'package:creativedesign/views/widgets/appbar_tool.dart';
// import 'package:creativedesign/utils/screen_size.dart';
// import 'package:creativedesign/utils/style_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class SelectListScreen extends StatefulWidget {
//   const SelectListScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SelectListScreen> createState() => _SelectListScreenState();
// }
//
// class _SelectListScreenState extends State<SelectListScreen> {
//   var userContactsList = <UserContacts>[
//     UserContacts(userId: 1, name: "Aman Gamit", mobile: "+91 1234567890"),
//     UserContacts(userId: 2, name: "Jayesh Gamit", mobile: "+91 1234509876"),
//     UserContacts(userId: 3, name: "Rahul Gamit", mobile: "+91 9087667890"),
//     UserContacts(userId: 4, name: "Tanay Gamit", mobile: "+91 8765467890"),
//     UserContacts(userId: 5, name: "Kajal Gamit", mobile: "+91 1265467890"),
//     UserContacts(userId: 6, name: "Riya Gamit", mobile: "+91 5432167890"),
//     UserContacts(userId: 7, name: "Somia Gamit", mobile: "+91 4532167890"),
//     UserContacts(userId: 8, name: "Krishna Gamit", mobile: "+91 3214567890"),
//     UserContacts(userId: 9, name: "Sumit Gamit", mobile: "+91 2564367890"),
//     UserContacts(userId: 10, name: "Mitesh Gamit", mobile: "+91 6789054321"),
//   ];
//
//   var selectedData = <UserContacts>[];
//   bool? allSelect = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: selectedData.isEmpty
//             ? AppBarTool(
//             title: "Select List",
//             left: () {
//               setState(() {
//                 Get.back();
//               });
//             },
//             right: () {
//               setState(() {
//                 String code = ;
//                 Get.to(() => CodeViewScreen("Select List", code));
//               });
//             })
//             : AppBar(
//           backgroundColor: Get.isDarkMode ? TextUtils.black : TextUtils.white,
//           elevation: 0.5,
//           shadowColor: Get.isDarkMode ? TextUtils.white : TextUtils.black,
//           title: Text(
//             "${selectedData.length}   Selected Item",
//             style: TextStyle(color: Get.isDarkMode ? TextUtils.white : TextUtils.black, shadows: [Shadow(color: TextUtils.black.withOpacity(0.2), blurRadius: size5, offset: Offset(0.0, 0.5))]),
//           ),
//           leading: IconButton(
//             icon: Icon(allSelect! ? Icons.check_circle_rounded : Icons.circle_outlined, size: size22, color: Get.isDarkMode ? TextUtils.white : TextUtils.black),
//             onPressed: () {
//               setState(() {
//                 allSelect = !allSelect!;
//                 if (allSelect!) {
//                   selectedData.clear();
//                   for (int i = 0; i < userContactsList.length; i++) {
//                     selectedData.add(userContactsList[i]);
//                   }
//                 } else {
//                   selectedData.clear();
//                 }
//               });
//             },
//           ),
//           actions: <Widget>[
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   for (int i = 0; i < userContactsList.length; i++) {
//                     for (int j = 0; j < selectedData.length; j++) {
//                       if (userContactsList[i].userId == selectedData[j].userId) {
//                         print("Name : ${userContactsList[i].name}");
//                         userContactsList.remove(userContactsList[i]);
//                       }
//                     }
//                   }
//                   selectedData.clear();
//                 });
//               },
//               splashRadius: size25,
//               icon: Icon(CupertinoIcons.delete, size: size22, color: Get.isDarkMode ? TextUtils.white : TextUtils.black),
//             ),
//           ],
//         ),
//         backgroundColor: Get.isDarkMode ? TextUtils.darkColor : TextUtils.primaryColor,
//         body: userContactsList.isNotEmpty
//             ? ListView.builder(
//           itemCount: userContactsList.length,
//           itemBuilder: (context, index) {
//             return Container(
//               color: selectedData.contains(userContactsList[index]) ? TextUtils.green : TextUtils.transparent,
//               margin: EdgeInsets.only(bottom: size2),
//               child: ListTile(
//                 onTap: () {
//                   setState(() {
//                     if (!selectedData.contains(userContactsList[index])) {
//                       selectedData.add(userContactsList[index]);
//                     }else{
//                       selectedData.remove(userContactsList[index]);
//                     }
//                   });
//                 },
//                 leading: Container(
//                   width: size45,
//                   height: size45,
//                   margin: EdgeInsets.only(top: size5),
//                   alignment: AlignmentDirectional.center,
//                   decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Get.isDarkMode ? TextUtils.white : TextUtils.black, width: 0.5)),
//                   child: Text(
//                     userContactsList[index].name.toString().substring(0, 1),
//                     style: TextStyle(color: Get.isDarkMode ? TextUtils.white : TextUtils.black, fontWeight: FontWeight.w300, fontSize: size30),
//                   ),
//                 ),
//                 title: Text(
//                   userContactsList[index].name.toString(),
//                   style: TextStyle(color: Get.isDarkMode ? TextUtils.white : TextUtils.black, fontWeight: TextUtils.titleTextWeight600, fontSize: size14),
//                 ),
//                 subtitle: Text(
//                   userContactsList[index].mobile.toString(),
//                   style: TextStyle(color: Get.isDarkMode ? TextUtils.white : TextUtils.black, fontWeight: TextUtils.normalTextWeight400, fontSize: size12),
//                 ),
//                 trailing: Icon(Icons.call_made_outlined, color: Get.isDarkMode ? TextUtils.white : TextUtils.black, size: size20),
//               ),
//             );
//           },
//         )
//             : Center(
//           child: Text(
//             "No Contact",
//             style: TextStyle(color: Get.isDarkMode ? TextUtils.white : TextUtils.black, fontWeight: FontWeight.w300, fontSize: size30),
//           ),
//         ));
//   }
// }
//
// class UserContacts {
//   int? userId;
//   String? name;
//   String? mobile;
//   bool? status;
//
//   UserContacts({this.userId, this.name, this.mobile,this.status});
// }
