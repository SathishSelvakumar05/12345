import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartData {
  final String x;
  final int y;

  ChartData(this.x, this.y);
}

class BarChartDataScreen extends StatefulWidget {
  @override
  _BarChartDataScreenState createState() => _BarChartDataScreenState();
}

class _BarChartDataScreenState extends State<BarChartDataScreen> {
  final List<ChartData> overviewData = [
    //  ChartData('Apasana', 20, [25, 15, 30, 22]),
    ChartData(
      'Apasana',
      20,
    ),
    ChartData('Aafia', 40),
  ];

  final Map<String, List<int>> detailedData = {
    'Apasana': [25, 15, 30, 22],
    'Aafia': [20, 30, 12, 11],
  };

  List<ChartData> currentData = [];
  String? selectedCategory;

  @override
  void initState() {
    super.initState();

    currentData = overviewData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interactive Bar Chart"),
      ),
      body: Column(
        children: [
          Container(
            height: 140,
            color: Colors.black,
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
                        if (index >= 0 && index < currentData.length) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              selectedCategory == null
                                  ? overviewData[index].x
                                  : "Month ${index + 1}",
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
                ),
                borderData: FlBorderData(show: false),
                barGroups: currentData
                    .asMap()
                    .entries
                    .map(
                      (entry) => BarChartGroupData(
                        x: entry.key,
                        barRods: [
                          BarChartRodData(
                            toY: entry.value.y.toDouble(),
                            color: Colors.orange,
                            width: 20,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ],
                      ),
                    )
                    .toList(),
                barTouchData: BarTouchData(
                  touchCallback: (event, response) {
                    if (event.isInterestedForInteractions &&
                        response != null &&
                        response.spot != null &&
                        selectedCategory == null) {
                      final index = response.spot!.touchedBarGroupIndex;
                      if (index >= 0 && index < overviewData.length) {
                        setState(() {
                          selectedCategory = overviewData[index].x;
                          print('now selectedcattegory$selectedCategory');
                          currentData = detailedData[selectedCategory]!
                              .map((value) =>
                                  ChartData(selectedCategory!, value))
                              .toList();
                        });
                      }
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (selectedCategory != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Detailed view for $selectedCategory",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          if (selectedCategory != null)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Reset to overview data when going back
                  currentData = overviewData;
                  selectedCategory = null;
                });
              },
              child: Text("Back to Overview"),
            ),
        ],
      ),
    );
  }
}

// [
// {
// "name":['27/10',"28/10"],
// "value":['3',4]
// },{
// "name":['27/10',"28/10"],
// "value":['3',4]
// }
// ]
