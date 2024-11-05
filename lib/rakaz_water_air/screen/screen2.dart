//
//
// import 'package:flutter/material.dart';
// import 'package:new_try/rakaz_water_air/screen/star_menu.dart';
//
// class NextScreen extends StatelessWidget {
//   final List<Item> items;
//
//   const NextScreen({Key? key, required this.items}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Item List'),
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           final item = items[index];
//           return Card(
//             color: _getCardColor(item.name),
//             child: Column(
//               children: [
//                 ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: _getAvatarImage(item.name),
//                       // backgroundColor: Colors.black,
//                     ),
//                     title: Text(item.name.toUpperCase())),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           print('View button pressed for ${item.name}');
//                         },
//                         child: Text(
//                           'View',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           print('Delete button pressed for ${item.name}');
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                         ),
//                         child: Text(
//                           'Delete',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   ImageProvider _getAvatarImage(String name) {
//     switch (name.toLowerCase()) {
//       case 'air':
//         print('object');
//         return AssetImage('assets/images/air.jpg');
//       case 'water':
//         return AssetImage('assets/images/water.jpg');
//       case 'streetlight':
//         return AssetImage('assets/images/streetlight.jpg');
//       default:
//         return AssetImage('assets/images/default.jpg');
//     }
//   }
//
//   Color _getCardColor(String name) {
//     switch (name.toLowerCase()) {
//       case 'air':
//         return Colors.white;
//       case 'water':
//         return Colors.white;
//       case 'streetlight':
//         return Colors.blueGrey.withOpacity(0.77);
//       default:
//         return Colors.brown;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:new_try/rakaz_water_air/screen/screen1.dart';

class NextScreen extends StatelessWidget {
  final List<Item> items;

  const NextScreen({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rakaz Task'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Image(
                      image: _getBackgroundImage(item.name),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 170,
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: _getAvatarImage(item.name),
                          ),
                          SizedBox(height: 4),
                          Text(
                            item.name.toUpperCase(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'View',
                                    style: TextStyle(color: Colors.black),
                                  )),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ImageProvider _getBackgroundImage(String name) {
    switch (name.toLowerCase()) {
      case 'air':
        return AssetImage('assets/images/air.jpg');
      case 'water':
        return AssetImage('assets/images/water.jpg');
      case 'streetlight':
        return AssetImage('assets/images/streetlight.jpg');
      default:
        return AssetImage('assets/images/default.jpg');
    }
  }

  ImageProvider _getAvatarImage(String name) {
    switch (name.toLowerCase()) {
      case 'air':
        return AssetImage('assets/images/air.jpg');
      case 'water':
        return AssetImage('assets/images/water.jpg');
      case 'streetlight':
        return AssetImage('assets/images/streetlight.jpg');
      default:
        return AssetImage('assets/images/default.jpg');
    }
  }
}
