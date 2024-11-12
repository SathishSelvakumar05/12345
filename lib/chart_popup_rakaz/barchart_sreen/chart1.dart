// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// import 'chart2.dart';
//
// class AgeBarChart extends StatelessWidget {
//   final List<Map<String, dynamic>> data = [
//     {"name": "apasana", "age": 26},
//     {"name": "addul", "age": 26},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BarChart(
//       BarChartData(
//         alignment: BarChartAlignment.spaceAround,
//         maxY: 30,
//         barGroups: data.asMap().entries.map((entry) {
//           int index = entry.key;
//           double age = entry.value["age"].toDouble();
//
//           return BarChartGroupData(
//             x: index,
//             barRods: [
//               BarChartRodData(
//                 toY: age,
//                 color: Colors.blue,
//                 width: 20,
//               ),
//             ],
//           );
//         }).toList(),
//         titlesData: FlTitlesData(
//           leftTitles: AxisTitles(
//             sideTitles: SideTitles(showTitles: true),
//           ),
//           bottomTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: (value, meta) {
//                 return Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: Text(
//                     data[value.toInt()]["name"],
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         gridData: FlGridData(show: false),
//         borderData: FlBorderData(show: false),
//         barTouchData: BarTouchData(
//           touchCallback: (event, response) {
//             if (event.isInterestedForInteractions &&
//                 response != null &&
//                 response.spot != null) {
//               final index = response.spot!.touchedBarGroupIndex;
//               if (index >= 0 && index < data.length) {
//                 print(index);
//                 // ChangeBool();
//               }
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
