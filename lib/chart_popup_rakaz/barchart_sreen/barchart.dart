import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartData {
  final String x;
  final int y;
  final List<Map<String, List<String>>> details;

  ChartData(this.x, this.y, this.details);
}

class BarChartDataScreen extends StatefulWidget {
  @override
  _BarChartDataScreenState createState() => _BarChartDataScreenState();
}

class _BarChartDataScreenState extends State<BarChartDataScreen> {
  final List<ChartData> overviewData = [
    ChartData(
      'Apasana',
      20,
      [
        {
          'name': ['27/10', '22/10', '20/10', '10/11'],
          'value': ['3', '5', '1', '22']
        }
      ],
    ),
    ChartData(
      'Aafia',
      40,
      [
        {
          'name': ['7/10', '2/10', '9/10', '22/02'],
          'value': ['30', '25', '1', '7']
        }
      ],
    ),
  ];

  List<String>? selectedNames;
  String? DisplayName;
  List<double>? selectedValues;
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = overviewData;
  }

  void updateChartData(int index) {
    final details = overviewData[index].details.first;
    print('detail list is $details ');

    selectedNames = details['name'];
    print('selectedNames$selectedNames');
    print('selectedName Length${selectedNames!.length}');

    DisplayName = overviewData[index].x;
    selectedValues = details['value']?.map((v) => double.parse(v)).toList();
    print('selectedValues$selectedValues');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 140,
            color: Colors.black12,
            child: Center(
              child: Text(
                "FOR RAKAZ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            child: BarChart(
              BarChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 30,
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (selectedNames != null &&
                            index >= 0 &&
                            index < selectedNames!.length) {
                          //   print('selectedNames!.length${selectedNames!.length}');
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              selectedNames![index],
                              style: TextStyle(fontSize: 12),
                            ),
                          );
                        } else if (index >= 0 && index < data.length) {
                          //print('overviewData.length${overviewData.length}');
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              data[index].x,
                              style: const TextStyle(fontSize: 12),
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: overviewData.asMap().entries.map((entry) {
                  final i = entry.key;
                  final data = entry.value;
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY:
                            selectedValues != null && i < selectedValues!.length
                                ? selectedValues![i]
                                : data.y.toDouble(),
                        color: Colors.orange,
                        width: 20,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ],
                  );
                }).toList(),
                barTouchData: BarTouchData(
                  touchCallback: (event, response) {
                    if (event.isInterestedForInteractions &&
                        selectedNames == null &&
                        response != null &&
                        response.spot != null) {
                      final index = response.spot!.touchedBarGroupIndex;
                      if (index >= 0 && index < overviewData.length) {
                        setState(() {
                          updateChartData(index);
                        });
                      }
                    }
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          if (selectedNames != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Detailed view for $DisplayName",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          if (selectedNames != null)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedNames = null;
                  selectedValues = null;
                });
              },
              child: Text("Back to Overview"),
            ),
          SizedBox(height: 20),
          Container(
            height: 140,
            color: Colors.black12,
            child: Center(
              child: Text(
                "FOR RAKAZ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
