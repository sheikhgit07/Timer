import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loc_it/model/CustomModels/chart_model.dart';
import 'package:loc_it/model/week_model.dart';
import 'package:loc_it/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:loc_it/model/CustomModels/chart_model.dart';
import 'package:loc_it/model/week_model.dart';
import 'package:loc_it/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:loc_it/model/CustomModels/chart_model.dart';
import 'package:loc_it/model/week_model.dart';
import 'package:loc_it/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonthlyGraph extends StatelessWidget {
  List<MonthDataModel> monthDataList;

  MonthlyGraph({Key? key, required this.monthDataList}) : super(key: key);

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
    final month = DateFormat('MMM').format(DateTime.now());

    return BarChart(
      BarChartData(
        maxY: 200,
        alignment: BarChartAlignment.spaceAround,
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
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
            axisNameSize: 30,
            axisNameWidget: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: CustomText(
                title: '$month',
                fontWeight: FontWeight.w600,
              ),
            ),
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                if (value.isFinite &&
                    value >= 0 &&
                    value < monthDataList.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '${monthDataList[value.toInt()].startDay}-${monthDataList[value.toInt()].endDay}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
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
        barGroups: monthDataList.asMap().entries.map((entry) {
          return BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                toY: entry.value.value,
                width: 14,
                borderRadius: BorderRadius.circular(3),
                backDrawRodData: BackgroundBarChartRodData(
                    toY: 200, show: true, color: Colors.grey[200]),
                color: Colors.black,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// class MonthlyGraph extends StatelessWidget {
//   List<MonthDataModel> monthDataList;
//
//   MonthlyGraph({Key? key, required this.monthDataList}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Color> color = <Color>[];
//     color.add(Colors.black);
//     color.add(Colors.black);
//     color.add(Colors.black);
//
//     final List<double> stops = <double>[];
//     stops.add(0.0);
//     stops.add(0.5);
//     stops.add(1.0);
//
//     final LinearGradient gradientColors = LinearGradient(
//         colors: color, begin: Alignment.topCenter, end: Alignment.bottomCenter);
//     // final List<Color> colors = [
//     //   Colors.red,
//     //   Colors.blue,
//     //   Colors.green,
//     //   Colors.yellow,
//     //   Colors.purple
//     // ];
//     // final List<Gradient> gradients =
//     // colors.map((color) => LinearGradient(colors: [color, Colors.white])).toList();
//     final now = DateTime.now();
//     final month = DateFormat('MMM').format(now);
//     return BarChart(
//
//       BarChartData(
//         maxY: 200,
//         // alignment: BarChartAlignment.spaceAround,
//         gridData: FlGridData(show: false),
//         titlesData: FlTitlesData(
//           leftTitles: AxisTitles(
//               axisNameSize: 30,
//               sideTitles: SideTitles(
//                   showTitles: true,
//                   getTitlesWidget: (value, tile) {
//                     return CustomText(
//                       title: value.toString(),
//                       color: Colors.black,
//                       fontSize: 10,
//                     );
//                   })),
//           bottomTitles: AxisTitles(
//             axisNameWidget: CustomText(
//               title: '$month',
//             ),
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: (value, _) {
//                 if (value.isFinite &&
//                     value >= 0 &&
//                     value < monthDataList.length) {
//                   return Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: Text(
//                       '${monthDataList[value.toInt()].startDay}-${monthDataList[value.toInt()].endDay}',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 10.0,
//                       ),
//                     ),
//                   );
//                 } else {
//                   if (value.isNaN) {
//                     return Text(
//                       'NaN',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12.0,
//                       ),
//                     );
//                   } else if (value.isNegative) {
//                     return Text(
//                       '-∞',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12.0,
//                       ),
//                     );
//                   } else {
//                     return Text('∞',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 12.0,
//                         ));
//                   }
//                 }
//               },
//             ),
//
//             // getTitles: (value) {
//             //   return 'Week ${(value + 1).toInt()}';
//             // },
//           ),
//         ),
//         borderData: FlBorderData(
//           show: false,
//         ),
//         barGroups: monthDataList.asMap().entries.map((entry) {
//           return BarChartGroupData(
//             x: entry.key,
//             barRods: [
//               BarChartRodData(
//                 toY: double.parse(entry.value.value),
//                 width: 12,
//                 borderRadius: BorderRadius.circular(3),
//                 backDrawRodData: BackgroundBarChartRodData(
//                     toY: 200, show: true, color: Colors.grey[200]),
//                 color: Colors.black,
//               ),
//             ],
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
