import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsScreen extends StatelessWidget {
  // Sample data for weekly and monthly distraction-free time in hours
  final List<double> weeklyData = [10, 20, 42, 38, 48, 36, 50];
  final List<double> monthlyData = [170, 155, 180, 160];

  final List<String> dayNames = [
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distraction-Free Time Stats'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Weekly Stats'),
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          if (value.isFinite &&
                              value >= 0 &&
                              value < dayNames.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                '${dayNames[value.toInt()]}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              ),
                            );
                          } else {
                            if (value.isNaN) {
                              return Text(
                                'NaN',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              );
                            } else if (value.isNegative) {
                              return Text(
                                '-∞',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              );
                            } else {
                              return Text('∞',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ));
                            }
                          }
                        },
                      ),

                      // getTitles: (value) {
                      //   return 'Week ${(value + 1).toInt()}';
                      // },
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: weeklyData.asMap().entries.map((entry) {
                    return BarChartGroupData(
                      x: entry.key,
                      barRods: [
                        BarChartRodData(
                          toY: entry.value,
                          width: 16,
                          color: Colors.blue,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Monthly Stats'),
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          if (value.isFinite) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            );
                          } else {
                            if (value.isNaN) {
                              return Text(
                                'NaN',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              );
                            } else if (value.isNegative) {
                              return Text(
                                '-∞',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              );
                            } else {
                              return Text('∞',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ));
                            }
                          }
                        },
                      ),
                      // getTitles: (value) {
                      //   return 'Week ${(value + 1).toInt()}';
                      // },
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: monthlyData.asMap().entries.map((entry) {
                    return BarChartGroupData(
                      x: entry.key,
                      barRods: [
                        BarChartRodData(
                          toY: entry.value,
                          width: 16,
                          color: Colors.green,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
