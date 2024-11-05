// import 'package:animated_custom_dropdown/custom_dropdown.dart';
// import 'package:flutter/material.dart';
// import 'dart:developer';
//
// const List<Job> _list = [
//   Job('Developer', Icons.developer_mode),
//   Job('Designer', Icons.design_services),
//   Job('Consultant', Icons.account_balance),
//   Job('Student', Icons.school),
//   Job('Developer', Icons.developer_mode),
//   Job('Designer', Icons.design_services),
//   Job('Consultant', Icons.account_balance),
//   Job('Student', Icons.school),
//   Job('Developer', Icons.developer_mode),
//   Job('Designer', Icons.design_services),
//   Job('Consultant', Icons.account_balance),
//   Job('Student', Icons.school),
// ];
//
// class SearchDropdown extends StatelessWidget {
//   const SearchDropdown({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CustomDropdown<Job>.search(
//           hintText: 'Select job role',
//           items: _list,
//           excludeSelected: false,
//           onChanged: (value) {
//             log('changing value to: $value');
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class Job with CustomDropdownListFilter {
//   final String name;
//   final IconData icon;
//   const Job(this.name, this.icon);
//
//   @override
//   String toString() {
//     return name;
//   }
//
//   @override
//   bool filter(String query) {
//     return name.toLowerCase().contains(query.toLowerCase());
//   }
// }
