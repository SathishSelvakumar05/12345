// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:latlng/latlng.dart';
//
// import '../cubit/add_cubit.dart';
// import 'home.dart';
//
// class ChangeLocation extends StatefulWidget {
//   final LatLng currentLatLng;
//   const ChangeLocation({required this.currentLatLng, super.key});
//
//   @override
//   State<ChangeLocation> createState() => _ChangeLocationState();
// }
//
// class _ChangeLocationState extends State<ChangeLocation> {
//   String? _selectedVehicleType;
//   LatLng? currentLatLng;
//   late TextEditingController Num;
//   late TextEditingController Lat;
//   late TextEditingController Lan;
//   late TextEditingController Type;
//
//   @override
//   void initState() {
//     super.initState();
//     currentLatLng = widget.currentLatLng;
//
//     Num = TextEditingController();
//     Lat = TextEditingController(text: currentLatLng?.latitude.toString() ?? '');
//     Lan =
//         TextEditingController(text: currentLatLng?.longitude.toString() ?? '');
//     Type = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     Num.dispose();
//     Lat.dispose();
//     Lan.dispose();
//     Type.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: Num,
//               decoration: InputDecoration(
//                 labelText: 'Vehicle No',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(21),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: Lat,
//               readOnly: true,
//               decoration: InputDecoration(
//                 labelText: 'Lat',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(21),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: Lan,
//               readOnly: true,
//               decoration: InputDecoration(
//                 labelText: 'Lan',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(21),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 labelText: 'Select Vehicle Type',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(21),
//                 ),
//               ),
//               value: _selectedVehicleType,
//               items: <String>['CAR', 'Bike'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedVehicleType = newValue;
//                   Type.text = newValue ?? '';
//                 });
//               },
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 context
//                     .read<AddCubit>()
//                     .AddLoc(Num.text, Lat.text, Lan.text, Type.text);
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => HomePage()));
//               },
//               child: Text("Add"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
