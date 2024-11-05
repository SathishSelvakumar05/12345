// import 'dart:core';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlng/latlng.dart';
//
// import '../cubit/add_cubit.dart';
// import '../cubit/add_state.dart';
// import 'change_location.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   MapController _mapController = MapController();
//   late LatLng _currentLatLng;
//   final TextEditingController _searchController = TextEditingController();
//   String? _selectedNumber;
//   List<Marker> _markers = [];
//   LatLng? navigateLatLng;
//   Map<String, LatLng> _numberLatLngMap = {};
//   bool isShow = false;
//
//   get singaporeBounds => LatLngBounds(
//         LatLng(_currentLatLng.latitude - 0.05, _currentLatLng.longitude - 0.05),
//         LatLng(_currentLatLng.latitude + 0.05, _currentLatLng.longitude + 0.05),
//       );
//   void _animateToLocation(LatLng targetLatLng,
//       {double tagetZoom = 13.0}) async {
//     final lastTween = Tween<double>(
//       begin: _mapController.center.latitude,
//       end: targetLatLng.latitude,
//     );
//     final lngTween = Tween<double>(
//       begin: _mapController.center.longitude,
//       end: targetLatLng.longitude,
//     );
//     final zoomTween = Tween<double>(
//       begin: _mapController.zoom,
//       end: tagetZoom,
//     );
//
//     AnimationController controller = AnimationController(
//       duration: const Duration(milliseconds: 1000),
//       vsync: this,
//     );
//
//     Animation<double> animation =
//         CurvedAnimation(parent: controller, curve: Curves.easeInOut);
//
//     controller.addListener(() {
//       _mapController.move(
//           LatLng(lastTween.evaluate(animation), lngTween.evaluate(animation)),
//           zoomTween.evaluate(animation));
//     });
//     controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         controller.dispose();
//       }
//     });
//     controller.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<AddCubit, AddlocState>(
//         builder: (context, state) {
//           final loginData = state.items!;
//
//           if (state!.items != null && state.items.isNotEmpty) {
//             List<LatLng> latLngList = state.items.map((item) {
//               double latitude = double.parse(item.lat);
//               double longitude = double.parse(item.lan);
//               return LatLng(latitude, longitude);
//             }).toList();
//             // print(latLngList);
//
//             List<String> numStrings =
//                 state.items.map((item) => item.num).toList();
//             // print(numStrings);
//             for (int i = 0; i < numStrings.length; i++) {
//               _numberLatLngMap[numStrings[i]] = latLngList[i];
//             }
//             // print("Yann:$_numberLatLngMap");
//             _currentLatLng = latLngList.first;
//             //final _Reset = LatLng(13.067439, 80.237617);
//             _markers = state.items
//                 .map((e) => Marker(
//                       width: 90.0,
//                       height: 90.0,
//                       point: LatLng(double.parse(e.lat), double.parse(e.lan)),
//                       builder: (BuildContext context) {
//                         final icon = e.type == 'CAR'
//                             ? Icon(Icons.directions_car,
//                                 color: Colors.blueAccent)
//                             : Icon(Icons.motorcycle, color: Colors.black);
//                         return icon;
//                       },
//                     ))
//                 .toList();
//
//             return Stack(
//               children: [
//                 FlutterMap(
//                   mapController: _mapController,
//                   options: MapOptions(
//                     center: _currentLatLng,
//                     zoom: 13.0,
//                     bounds: singaporeBounds,
//                     onTap: (tapPosition, tappedPosition) {
//                       setState(() {
//                         navigateLatLng = tappedPosition;
//                         _currentLatLng = tappedPosition;
//                         isShow = true;
//                         print("Tapped Current Position: $_currentLatLng");
//                         _markers.add(
//                           Marker(
//                             width: 90.0,
//                             height: 90.0,
//                             point: _currentLatLng,
//                             builder: (BuildContext context) => Icon(
//                               Icons.location_on,
//                               color: Colors.blue,
//                               size: 50.0,
//                             ),
//                           ),
//                         );
//
//                         print("_markers:${_markers.length}");
//
//                         _animateToLocation(_currentLatLng);
//                       });
//                     },
//                   ),
//                   children: <Widget>[
//                     TileLayer(
//                       urlTemplate:
//                           'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                     ),
//                     MarkerLayer(
//                       markers: _markers,
//                     ),
//                     CircleLayer(
//                       circles: latLngList.map((latLng) {
//                         return CircleMarker(
//                           point: latLng,
//                           radius: 20,
//                           color: Colors.grey.withOpacity(0.5),
//                         );
//                       }).toList(),
//                     ),
//                   ],
//                 ),
//                 Positioned(
//                   top: 16.0,
//                   left: 16.0,
//                   right: 16.0,
//                   child: Container(
//                     height: 52,
//                     width: 34,
//                     color: Colors.white70,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: DropdownButton<String>(
//                               icon: const Icon(Icons.arrow_drop_down),
//                               items: numStrings.map((String numString) {
//                                 return DropdownMenuItem<String>(
//                                   value: numString,
//                                   child: Text(numString),
//                                 );
//                               }).toList(),
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   _selectedNumber = newValue;
//                                   _currentLatLng =
//                                       _numberLatLngMap[_selectedNumber]!;
//                                   _animateToLocation(_currentLatLng);
//                                 });
//                               },
//                               value: _selectedNumber,
//                             ),
//                           ),
//                         ),
//                         IconButton(onPressed: () {}, icon: Icon(Icons.search)),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 16.0,
//                   right: 16.0,
//                   child: Visibility(
//                       visible: isShow,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           print("Navigate:$navigateLatLng");
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ChangeLocation(
//                                       currentLatLng: navigateLatLng!)));
//                         },
//                         child: Text("Change"),
//                       )),
//                 ),
//               ],
//             );
//           } else {
//             return Center(child: Text("Error"));
//           }
//         },
//       ),
//     );
//   }
// }
