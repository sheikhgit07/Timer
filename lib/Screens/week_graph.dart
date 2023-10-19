import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:loc_it/model/CustomModels/chart_model.dart';
import 'package:loc_it/model/week_model.dart';
import 'package:loc_it/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeekGraph extends StatelessWidget {
  List<WeekDataModel> weeklyDataList;

  WeekGraph({Key? key, required this.weeklyDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Colors.black);
    color.add(Colors.black);
    color.add(Colors.black);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors = LinearGradient(
        colors: color, begin: Alignment.topCenter, end: Alignment.bottomCenter);
    // final List<Color> colors = [
    //   Colors.red,
    //   Colors.blue,
    //   Colors.green,
    //   Colors.yellow,
    //   Colors.purple
    // ];
    // final List<Gradient> gradients =
    // colors.map((color) => LinearGradient(colors: [color, Colors.white])).toList();

    return BarChart(
      BarChartData(
        maxY: 60,
        alignment: BarChartAlignment.spaceAround,
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
              axisNameSize: 30,
              sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, tile) {
                    return CustomText(
                      title: value.toString(),
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    );
                  })),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                if (value.isFinite &&
                    value >= 0 &&
                    value < weeklyDataList.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '${weeklyDataList[value.toInt()].week}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
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
        barGroups: weeklyDataList.asMap().entries.map((entry) {
          return BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                toY: double.parse(entry.value.highestValue),
                width: 25,
                borderRadius: BorderRadius.circular(3),
                backDrawRodData: BackgroundBarChartRodData(
                    toY: 60, show: true, color: Colors.grey[200]),
                color: Colors.black,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
