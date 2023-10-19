import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loc_it/utilites/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph extends StatefulWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  int _currentIndex = 0;

  List<List<SalesData>> chartDataList = [
    [
      SalesData(DateTime(2023, 9, 1, 9, 0), 1),
      SalesData(DateTime(2023, 9, 1, 10, 0), 2),
      SalesData(DateTime(2023, 9, 1, 11, 0), 3),
      SalesData(DateTime(2023, 9, 1, 12, 0), 4),
      SalesData(DateTime(2023, 9, 1, 13, 0), 5),
      SalesData(DateTime(2023, 9, 1, 14, 0), 6),
      SalesData(DateTime(2023, 9, 1, 15, 0), 7),
      SalesData(DateTime(2023, 9, 1, 16, 0), 8),
      SalesData(DateTime(2023, 9, 1, 17, 0), 9),
      SalesData(DateTime(2023, 9, 1, 18, 0), 10),
      SalesData(DateTime(2023, 9, 1, 19, 0), 11),
      SalesData(DateTime(2023, 9, 1, 20, 0), 12),
    ],
    [
      SalesData(DateTime(2023, 9, 1, 21, 0), 2),
      SalesData(DateTime(2023, 9, 1, 22, 0), 3),
      SalesData(DateTime(2023, 9, 1, 23, 0), 4),
      SalesData(DateTime(2023, 9, 1, 24, 0), 5),
      SalesData(DateTime(2023, 9, 1, 25, 0), 7),
      SalesData(DateTime(2023, 9, 1, 26, 0), 9),
      SalesData(DateTime(2023, 9, 1, 27, 0), 11),
      SalesData(DateTime(2023, 9, 1, 28, 0), 15),
      SalesData(DateTime(2023, 9, 1, 29, 0), 36),
      SalesData(DateTime(2023, 9, 1, 30, 0), 12),
      SalesData(DateTime(2023, 9, 1, 31, 0), 10),
      SalesData(DateTime(2023, 9, 1, 33, 0), 2),
    ],
    [
      SalesData(DateTime(2023, 9, 1, 9, 0), 30),
      SalesData(DateTime(2023, 9, 1, 10, 0), 76),
      SalesData(DateTime(2023, 9, 1, 11, 0), 54),
      SalesData(DateTime(2023, 9, 1, 12, 0), 4),
      SalesData(DateTime(2023, 9, 1, 13, 0), 23),
      SalesData(DateTime(2023, 9, 1, 14, 0), 12),
      SalesData(DateTime(2023, 9, 1, 15, 0), 5),
      SalesData(DateTime(2023, 9, 1, 16, 0), 12),
      SalesData(DateTime(2023, 9, 1, 17, 0), 21),
      SalesData(DateTime(2023, 9, 1, 18, 0), 43),
      SalesData(DateTime(2023, 9, 1, 19, 0), 32),
      SalesData(DateTime(2023, 9, 1, 20, 0), 21),
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: chartDataList.length,
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: false,
            // aspectRatio: 10 / 5,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final data = chartDataList[index];
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                ),
                child: Container(
                  height: 220,
                  child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(
                      majorGridLines:
                          MajorGridLines(width: 0), // Hide grid lines
                      labelStyle: TextStyle(color: blackColor), // Hide labels
                    ),
                    primaryYAxis: NumericAxis(
                        labelFormat: '',
                        majorGridLines: MajorGridLines(width: 0),
                        majorTickLines:
                            MajorTickLines(size: 0), // Hide major grid lines
                        minorGridLines: MinorGridLines(width: 0),
                        labelStyle:
                            TextStyle(color: Colors.transparent), // Hide labels
                        axisLine: AxisLine(width: 0),
                        rangePadding: ChartRangePadding.round),
                    plotAreaBackgroundColor: Colors.transparent,
                    plotAreaBorderWidth: 0,
                    series: <ChartSeries>[
                      ColumnSeries<SalesData, DateTime>(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            topLeft: Radius.circular(100)),
                        dataSource: data,
                        xValueMapper: (SalesData sales, _) => sales.time,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                      ),
                    ],
                  ),
                ));
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: chartDataList.map((url) {
            int index = chartDataList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? kPrimaryColor
                    : greyColor.withOpacity(0.5),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class SalesData {
  DateTime time;
  int sales;
  SalesData(this.time, this.sales);
}
