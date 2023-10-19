import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:loc_it/Screens/BottomNavBar/settings_screen.dart';
import 'package:loc_it/Screens/BottomNavBar/stats_screen.dart';
import 'package:loc_it/Screens/BottomNavBar/timer_screen.dart';
import 'package:loc_it/Screens/count_down_screen.dart';
import 'package:loc_it/Screens/home_screen.dart';
import 'package:loc_it/provider/count_down_provider.dart';
import 'package:loc_it/utilites/colors.dart';
import 'package:loc_it/utilites/helper.dart';
import 'package:loc_it/widgets/custom_text.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTime = 5; // Default time in minutes
  bool adsRemoved = false;
  double progress = 0.0;
  late ValueNotifier<double> progressNotifier;
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    TimerScreen(),
    StatsScreen(),
    SettingsScreen(),
  ];

  // void startTimer() {
  //   const duration = Duration(seconds: 1);
  //   int totalTime = selectedTime * 60;
  //
  //   Timer.periodic(duration, (Timer timer) {
  //     if (totalTime > 0) {
  //       setState(() {
  //         progress = (totalTime / (selectedTime * 60));
  //         progressNotifier.value = progress;
  //         totalTime--;
  //       });
  //     } else {
  //       timer.cancel();
  //       // Implement screen lock logic here
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<CountDownProvider>(
        builder: (context, countDownProvider, child) {
      return Scaffold(
        body: _screens[_selectedIndex],
        floatingActionButton: _selectedIndex == 0
            ? FloatingActionButton.extended(
                backgroundColor: kPrimaryColor.withOpacity(0.73),
                onPressed: () {
                  if (countDownProvider.selectedHour != null) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CountDownTimerScreen(true)),
                        (Route<dynamic> route) => false);
                    // Helper.toReplacementScreenSlideLeftToRight(
                    //     context, CountDownTimerScreen(true));
                  }
                },
                label: CustomText(
                  title: 'Start Session',
                  color: Colors.white,
                ))
            : null,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },

          type: BottomNavigationBarType.fixed, // To allow multiple items
          selectedItemColor: Colors.black, // Change this color as needed
          unselectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(color: blackColor),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: kPrimaryColor),
          selectedFontSize: 13,

          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _selectedIndex == 0
                        ? Colors.grey.withOpacity(0.2)
                        : Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Icon(Icons.timer),
                ),
              ),
              label: "Timer",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _selectedIndex == 1
                        ? Colors.grey.withOpacity(0.2)
                        : Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Icon(Icons.stacked_bar_chart),
                ),
              ),
              label: "Stats",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _selectedIndex == 2
                        ? Colors.grey.withOpacity(0.2)
                        : Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Icon(Icons.settings),
                ),
              ),
              label: "Settings",
            ),
          ],
        ),
      );
    });
  }
}

void countdownIsolate(SendPort sendPort) {
  Timer timer;
  int initialCountdown;

  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  receivePort.listen((message) {
    if (message is int) {
      initialCountdown = message;
      int remainingTime = initialCountdown;
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (remainingTime > 0) {
          sendPort.send(remainingTime);
          remainingTime--;
        } else {
          // Countdown timer reached zero, stop the timer
          timer.cancel();
        }
      });
    }
  });
}
