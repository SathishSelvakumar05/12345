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
          'name': ['27/10', '22/10', '20/10'],
          'value': ['3', '5', '10']
        }
      ],
    ),
    ChartData(
      'Aafia',
      40,
      [
        {
          'name': ['7/10', '2/10', '0/10'],
          'value': ['30', '25', '1']
        }
      ],
    ),
  ];

  List<Map<String, String>>? selectedDetails;

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
                        if (index >= 0 && index < overviewData.length) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              overviewData[index].x,
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
                barGroups: overviewData
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
                        response.spot != null) {
                      final index = response.spot!.touchedBarGroupIndex;
                      if (index >= 0 && index < overviewData.length) {
                        setState(() {
                          selectedDetails = [];
                          final details = overviewData[index].details.first;
                          final names = details['name'] ?? [];
                          final values = details['value'] ?? [];

                          // Pair names and values together
                          for (int i = 0; i < names.length; i++) {
                            selectedDetails!.add({
                              'name': names[i],
                              'value': values[i],
                            });
                          }
                        });
                      }
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (selectedDetails != null) ...[
            Text(
              "Detailed Values",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...selectedDetails!.map(
              (detail) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  "${detail['name']}: ${detail['value']}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedDetails = null;
                });
              },
              child: Text("Back to Overview"),
            ),
          ] else
            const Text(
              "Tap on a bar to see details",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
        ],
      ),
    );
  }
}
