import 'package:flutter/material.dart';
import '../../trip_booking/screen/bottom_screens/profile.dart';
import 'custom/custom_star_menu.dart';

class PopupMenuExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MenuItem> data = [
      MenuItem(
        icon: Icons.edit,
        color: Colors.blue,
        onPressed: () {
          print('Edit pressed');
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProfileScreen1(),
          ));
        },
      ),
      MenuItem(
        icon: Icons.delete,
        color: Colors.black,
        onPressed: () {
          print('Delete pressed');
        },
      ),
      MenuItem(
        icon: Icons.remove_red_eye_outlined,
        color: Colors.green,
        onPressed: () {
          print('View pressed');
        },
      ),
      MenuItem(
        icon: Icons.people_outline,
        color: Colors.purple,
        onPressed: () {
          print('People pressed');
        },
      ),
    ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StarMenuComponent(items: data),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:new_try/trip_booking/screen/bottom_screens/profile.dart';
// import 'package:star_menu/star_menu.dart';
//
// import 'custom/custom_star_menu.dart';
//
// class PopupMenuExample extends StatelessWidget {
//   final Map<String, dynamic> menuData = {
//     'icon': [
//       Icons.mode_edit_rounded,
//       Icons.delete,
//       Icons.remove_red_eye_outlined,
//     ],
//     'color': [
//       Colors.blue,
//       Colors.red,
//       Colors.green,
//     ],
//     'onPressed': [
//       () {
//         // Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditScreen(),));
//         print("Edit clicked");
//       },
//       () {
//         print("Delete clicked");
//       },
//       () {
//         print("View clicked");
//       },
//     ],
//   };
//   List<MenuItem> data = [
//     MenuItem(
//         icon: Icons.edit,
//         color: Colors.blue,
//         onPressed: () {
//           print('object');
//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => ProfileScreen1(),
//           ));
//         }),
//     MenuItem(icon: Icons.delete, color: Colors.black, onPressed: () {}),
//     MenuItem(
//         icon: Icons.remove_red_eye_outlined,
//         color: Colors.green,
//         onPressed: () {}),
//     MenuItem(
//         icon: Icons.people_outline,
//         color: Colors.yellowAccent,
//         onPressed: () {}),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Container(
//           //   decoration: BoxDecoration(
//           //     borderRadius: BorderRadius.circular(10),
//           //     color: Colors.blueGrey,
//           //   ),
//           //   height: 200,
//           //   child: Row(
//           //     crossAxisAlignment: CrossAxisAlignment.start,
//           //     mainAxisAlignment: MainAxisAlignment.end,
//           //     children: [
//           //       StarMenu(
//           //         params: StarMenuParameters(
//           //             shape: MenuShape.grid,
//           //             centerOffset: Offset(15, 15),
//           //             boundaryBackground:
//           //                 BoundaryBackground(color: Colors.white)),
//           //         items: [
//           //           IconButton(
//           //             icon: Icon(Icons.mode_edit_rounded, color: Colors.blue),
//           //             onPressed: () {
//           //               print("Update clicked");
//           //             },
//           //           ),
//           //           IconButton(
//           //             icon: Icon(Icons.delete, color: Colors.red),
//           //             onPressed: () {
//           //               print("Delete clicked");
//           //             },
//           //           ),
//           //           IconButton(
//           //             icon: Icon(Icons.visibility, color: Colors.green),
//           //             onPressed: () {
//           //               print("View clicked");
//           //             },
//           //           ),
//           //         ],
//           //         child: Icon(Icons.more_vert, size: 30),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//           Container(
//             width: double.infinity,
//             height: 100,
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               border: Border.all(
//                 color: Colors.black,
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(3, 3),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 StarMenuComponent(
//                   items:
//                       menuData['icon'].asMap().entries.map<MenuItem>((entry) {
//                     int index = entry.key;
//                     print(index.toString());
//                     return MenuItem(
//                       icon: menuData['icon'][index],
//                       color: menuData['color'][index],
//                       onPressed: menuData['onPressed'][index],
//                     );
//                   }).toList(),
//                 ),
//
//                 // StarMenu(
//                 //   params: StarMenuParameters(
//                 //       shape: MenuShape.grid,
//                 //       closeDurationMs: 500,
//                 //       openDurationMs: 500,
//                 //       startItemScaleAnimation: 1,
//                 //       gridShapeParams: GridShapeParams(columns: 5),
//                 //       backgroundParams:
//                 //           BackgroundParams(backgroundColor: Colors.grey),
//                 //       animationCurve: Curves.easeInCirc,
//                 //       centerOffset: Offset(15, 15),
//                 //       boundaryBackground:
//                 //           BoundaryBackground(color: Colors.white)),
//                 //   items: [
//                 //     IconButton(
//                 //       icon: Icon(Icons.mode_edit_rounded, color: Colors.blue),
//                 //       onPressed: () {
//                 //         print("Update clicked");
//                 //       },
//                 //     ),
//                 //   ],
//                 //   child: Icon(Icons.more_vert, size: 30),
//                 // ),
//                 StarMenuComponent(items: data.toList())
//                 // MenuItem(
//                 //     icon: Icons.edit, color: Colors.blue, onPressed: () {}),
//                 // MenuItem(
//                 //     icon: Icons.delete,
//                 //     color: Colors.black,
//                 //     onPressed: () {}),
//                 // MenuItem(
//                 //     icon: Icons.remove_red_eye_outlined,
//                 //     color: Colors.green,
//                 //     onPressed: () {}),
//                 // MenuItem(
//                 //     icon: Icons.people_outline,
//                 //     color: Colors.yellowAccent,
//                 //     onPressed: () {}),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // StarMenuComponent(
// //   items: List.generate(menuData['icon'].length, (index) {
// //     return MenuItem(
// //       icon: menuData['icon'][index],
// //       color: menuData['color'][index],
// //       onPressed: menuData['onPressed'][index],
// //     );
// //   }),
// // ),
//
// // print(" inedx is ${index.bitLength}");
// // print('icon is ${menuData['icon'][index].toString()}');
// // print('color is ${menuData['color'][index].toString()}');
// // print(' onPressed is${menuData['onPressed'][index].toString()}');
// // import 'package:flutter/material.dart';
// // import 'package:star_menu/star_menu.dart';
// //
// // class PopupMenuExample extends StatelessWidget {
// //   final Map<String, dynamic> menuData;
// //
// //   PopupMenuExample({Key? key}) : super(key: key)
// //       : menuData = {
// //   'icon': [
// //   Icons.mode_edit_rounded,
// //   Icons.delete,
// //   Icons.remove_red_eye_outlined,
// //   ],
// //   'color': [
// //   Colors.blue,
// //   Colors.red,
// //   Colors.green,
// //   ],
// //   'onPressed': [], // Initialize with an empty list
// //   } {
// //   menuData['onPressed'] = [
// //   () => editPressed(),
// //   () => deletePressed(),
// //   () => sharePressed(),
// //   ];
// //   }
// //
// //   // Define the callback functions
// //   void editPressed(BuildContext context) {
// //     Navigator.of(context).push(MaterialPageRoute(
// //       builder: (context) => EditScreen(),
// //     ));
// //     print("Edit clicked");
// //   }
// //
// //   void deletePressed(BuildContext context) {
// //     Navigator.pop(context);
// //     print("Delete clicked");
// //   }
// //
// //   void sharePressed() {
// //     print("Share clicked");
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.spaceAround,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Container(
// //             width: double.infinity,
// //             height: 100,
// //             decoration: BoxDecoration(
// //               color: Colors.blue,
// //               border: Border.all(
// //                 color: Colors.black,
// //                 width: 2,
// //               ),
// //               borderRadius: BorderRadius.circular(10),
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.grey.withOpacity(0.5),
// //                   spreadRadius: 2,
// //                   blurRadius: 5,
// //                   offset: Offset(3, 3),
// //                 ),
// //               ],
// //             ),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.end,
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 StarMenuComponent(
// //                   items: menuData['icon'].asMap().entries.map<MenuItem>((entry) {
// //                     int index = entry.key;
// //                     return MenuItem(
// //                       icon: menuData['icon'][index],
// //                       color: menuData['color'][index],
// //                       onPressed: () => menuData['onPressed'][index](context), // Pass context here
// //                     );
// //                   }).toList(),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // // Dummy EditScreen for demonstration
// // class EditScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Edit Screen')),
// //       body: Center(child: Text('Edit Screen Content')),
// //     );
// //   }
// // }
