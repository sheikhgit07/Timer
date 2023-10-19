import 'dart:io';

import 'package:device_policy_manager/device_policy_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiosk_mode/kiosk_mode.dart';
import 'package:loc_it/Screens/home_screen.dart';
import 'package:loc_it/provider/auth_provider.dart';
import 'package:loc_it/provider/count_down_provider.dart';
import 'package:loc_it/utilites/colors.dart';
import 'package:loc_it/utilites/helper.dart';
import 'package:loc_it/widgets/background_timer.dart';
import 'package:loc_it/widgets/custom_inkwell_btn.dart';
import 'package:loc_it/widgets/custom_text.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:provider/provider.dart';

class CountDownTimerScreen extends StatefulWidget {
  bool isHomeScreen = false;
  CountDownTimerScreen(this.isHomeScreen);
  @override
  State<CountDownTimerScreen> createState() => _CountDownTimerScreenState();
}

class _CountDownTimerScreenState extends State<CountDownTimerScreen> {
  bool autoStart = false;
  int durationTime = 0;
  late final Stream<KioskMode> _currentMode = watchKioskMode();
  BackgroundTimer backgroundTimer = BackgroundTimer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<CountDownProvider>(context, listen: false).init();
    if (widget.isHomeScreen) {
      Provider.of<CountDownProvider>(context, listen: false)
          .loadCountdownFromPrefs();
      backgroundTimer.start();
    }
    startKioskMode().then(_handleStart);

    autoStart = true;
    debugPrint(
        '${Provider.of<CountDownProvider>(context, listen: false).time * 60}');
    durationTime =
        Provider.of<CountDownProvider>(context, listen: false).time * 60;
  }

  void _handleStart(bool didStart) {
    if (!didStart && Platform.isIOS) {
      Helper.showSnack(
        context,
        'Single App mode is supported only for devices that are supervised'
        ' using Mobile Device Management (MDM) and the app itself must'
        ' be enabled for this mode by MDM.',
      );
    }
  }

  void _handleStop(bool? didStop) {
    if (didStop == false) {
      Helper.showSnack(
        context,
        'Kiosk mode could not be stopped or was not active to begin with.',
      );
    }
    Helper.toReplacementScreenSlideLeftToRight(context, HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CountDownProvider>(
        builder: (context, countdowntimer, child) {
      return StreamBuilder(
          stream: _currentMode,
          builder: (context, snapshot) {
            final mode = snapshot.data;
            final message = mode == null
                ? 'Can\'t determine the mode'
                : 'Current mode: $mode';
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: "Phone Lock Countdown",
                          fontSize: 20,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 70),
                    NeonCircularTimer(
                      width: 200,
                      duration: countdowntimer.countdown,
                      onComplete: () async {
                        Navigator.pop(context);
                      },
                      isReverse: true,
                      isReverseAnimation: true,
                      textFormat: TextFormat.HH_MM_SS,
                      controller:
                          Provider.of<CountDownProvider>(context, listen: false)
                              .controller,
                      isTimerTextShown: true,
                      textStyle: TextStyle(
                          fontSize: 28,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500),
                      neumorphicEffect: false,
                      autoStart: autoStart,
                      innerFillGradient: LinearGradient(colors: [
                        // A light shade of gray
                        kPrimaryColor,
                        kPrimaryColor,
                      ]),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomInkWell(
                          onTap: () {
                            // String timeFormatted1 =
                            //     '${(countdowntimer.intialCountdown ~/ 3600).toString().padLeft(2, '0')}:${((countdowntimer.intialCountdown % 3600) ~/ 60).toString().padLeft(2, '0')}';
                            // String timeFormatted2 =
                            //     '${(countdowntimer.countdown ~/ 3600).toString().padLeft(2, '0')}:${((countdowntimer.countdown % 3600) ~/ 60).toString().padLeft(2, '0')}';
                            // List<String> parts1 = timeFormatted1.split(':');
                            // List<String> parts2 = timeFormatted2.split(':');
                            //
                            // int hours1 = int.parse(parts1[0]);
                            // int minutes1 = int.parse(parts1[1]);
                            //
                            // int hours2 = int.parse(parts2[0]);
                            // int minutes2 = int.parse(parts2[1]);
                            //
                            // int totalMinutes1 = (hours1 * 60) + minutes1;
                            // int totalMinutes2 = (hours2 * 60) + minutes2;
                            //
                            // int minuteDifference =
                            //     totalMinutes1 - totalMinutes2;

                            // print('Minute Difference: $minuteDifference');
                            // print('3,579 seconds in HH:MM format: $timeFormatted1');
                            // print('2,533 seconds in HH:MM format: $timeFormatted2');
                            // print(
                            //     'Time difference in minutes: $minuteDifference minutes');

                            // double initialCountdownInSeconds =
                            //     countdowntimer.intialCountdown / 60; // 3596 seconds
                            // double countdownInSeconds = countdowntimer.countdown / 60;
                            // double timeDifferenceInSeconds =
                            //     initialCountdownInSeconds - countdownInSeconds;
                            countdowntimer.controller!.pause();
                            backgroundTimer.stop();
                            int elapsedMinutes =
                                backgroundTimer.getElapsedMinutes();
                            debugPrint('elapsedminute:${elapsedMinutes}');
                            if (auth.currentUser != null) {
                              db
                                  .collection('Users')
                                  .doc(auth.currentUser!.uid)
                                  .collection('WeeklyData')
                                  .doc(countdowntimer.weekName)
                                  .update({'value': '${elapsedMinutes}'});
                              countdowntimer.updateMonthlyCollection(
                                  DateTime.now(), elapsedMinutes);
                            }
                            debugPrint(
                                'difference:${countdowntimer.highestWeekData?.highestValue}');
                            countdowntimer.resetCountdown();
                            countdowntimer.resetHourMinute();
                            stopKioskMode().then(_handleStop);
                          },
                          child: Icon(
                            Icons.stop_circle,
                            size: 60,
                            color: kPrimaryColor,
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            );
          });
    });
  }

  int _durationToSeconds(Duration duration) {
    return duration.inHours * 3600 +
        duration.inMinutes * 60 +
        duration.inSeconds;
  }

  String formatDuration(Duration duration) {
    return '${duration.inHours.toString().padLeft(2, '0')}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
  }

  int parseDuration(String formattedTime) {
    List<String> parts = formattedTime.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    int seconds = int.parse(parts[2]);
    return (hours * 3600) + (minutes * 60) + seconds;
  }
}
