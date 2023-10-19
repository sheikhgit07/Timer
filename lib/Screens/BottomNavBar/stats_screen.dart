import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loc_it/Screens/count_down_screen.dart';
import 'package:loc_it/Screens/graph.dart';
import 'package:loc_it/Screens/monthly_graph.dart';
import 'package:loc_it/Screens/week_graph.dart';
import 'package:loc_it/provider/count_down_provider.dart';
import 'package:loc_it/utilites/colors.dart';
import 'package:loc_it/widgets/custom_inkwell_btn.dart';
import 'package:loc_it/widgets/custom_loader.dart';
import 'package:loc_it/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() {
    Provider.of<CountDownProvider>(context, listen: false).getWeeklyData();
    Provider.of<CountDownProvider>(context, listen: false).getMonthData();
  }

  @override
  Widget build(BuildContext context) {
    final month = DateFormat('MMM').format(DateTime.now());
    return Consumer<CountDownProvider>(
        builder: (context, countDownTimer, child) {
      return Scaffold(
        body: !countDownTimer.isLoading
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.share,
                              size: 25,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    CustomText(
                                      title: 'Total minutes',
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CustomText(
                                      title: countDownTimer.highestWeekData !=
                                              null
                                          ? '${countDownTimer.highestWeekData?.highestValue}'
                                          : '30',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 19,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                SizedBox(
                                  height: 28,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  children: [
                                    CustomText(
                                      title: 'Best Day',
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CustomText(
                                      title: countDownTimer.highestWeekData !=
                                              null
                                          ? '${countDownTimer.highestWeekData?.week}'
                                          : 'Fri',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 19,
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  if (countDownTimer.selectedIndex == 1)
                    CustomText(
                      title: '${month}${countDownTimer.currentRange}',
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  if (countDownTimer.selectedIndex == 1) SizedBox(height: 20),
                  countDownTimer.selectedIndex == 0
                      ? Container(
                          padding: EdgeInsets.only(left: 13),
                          height: 320,
                          width: double.maxFinite,
                          child: MonthlyGraph(
                              monthDataList: countDownTimer.monthlyDataList))
                      : Container(
                          padding: EdgeInsets.only(left: 13),
                          height: 320,
                          width: double.maxFinite,
                          child: WeekGraph(
                              weeklyDataList: countDownTimer.weeklyDataList)),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 1.0, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(60.0), // Border radius
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomInkWell(
                          onTap: () {
                            countDownTimer.updateIndex(0);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 10),
                            child: Text('Month',
                                style: TextStyle(
                                    color: countDownTimer.selectedIndex == 0
                                        ? Colors.black26
                                        : Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14)),
                          ),
                        ),
                        Container(
                          width: 1.0, // Vertical divider width
                          height: 20.0, // Height of the divider
                          color: Colors.black, // Divider color
                        ),
                        CustomInkWell(
                          onTap: () {
                            countDownTimer.updateIndex(1);
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0, vertical: 10),
                              child: Text('Weekly',
                                  style: TextStyle(
                                      color: countDownTimer.selectedIndex == 1
                                          ? Colors.black26
                                          : Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Center(child: CustomLoader()),
      );
    });
  }
}
