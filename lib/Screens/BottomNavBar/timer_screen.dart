import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loc_it/Screens/BottomNavBar/timer_screen.dart';
import 'package:loc_it/dialog/custom_dialog.dart';
import 'package:loc_it/provider/auth_provider.dart';
import 'package:loc_it/provider/count_down_provider.dart';
import 'package:loc_it/utilites/colors.dart';
import 'package:loc_it/widgets/custom_cached_network_image.dart';
import 'package:loc_it/widgets/custom_inkwell_btn.dart';
import 'package:loc_it/widgets/custom_loader.dart';
import 'package:loc_it/widgets/custom_text.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatefulWidget {
  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with SingleTickerProviderStateMixin {
  User? user;

  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20), // Rotation duration
    )..repeat();
    Provider.of<CountDownProvider>(context, listen: false).init();
    init();
    user = Provider.of<AuthProvider>(context, listen: false).getCurrentUser();
    Provider.of<AuthProvider>(context, listen: false).getNickName();
  }

  TimeOfDay selectedTimeCounter = TimeOfDay.now();

  Future<void> _setCountdownTime() async {
    TimeOfDay? timeOfDay;
    final TimeOfDay? selectedTime = await await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 12, minute: 00),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      },
    ).then((value) {
      timeOfDay = value;

      debugPrint('${timeOfDay!.hour} ${timeOfDay!.minute}||||||');
      if (timeOfDay != null) {
        final now = DateTime.now();
        final selectedTimeDateTime = DateTime(
          now.year,
          now.month,
          now.day,
          timeOfDay!.hour,
          timeOfDay!.minute,
        );
        // Provider.of<CountDownProvider>(context, listen: false)
        //     .saveHourMinuteToSharedPreferences(
        //         timeOfDay!.hour, timeOfDay!.minute);
        Provider.of<CountDownProvider>(context, listen: false)
            .getHourMinute(timeOfDay!.hour, timeOfDay!.minute);
        // Calculate the initial countdown value
        int initialCountdown = timeOfDay!.hour * 3600 + timeOfDay!.minute * 60;

        debugPrint('total seconds:$initialCountdown');
        // final initialCountdown = selectedTimeDateTime.isAfter(now)
        //     ? selectedTimeDateTime.hour
        //     : (selectedTimeDateTime
        //         .add(Duration(days: 1))
        //         .difference(now)
        //         .inSeconds);
        debugPrint('times ${selectedTimeDateTime.difference(now)}');
        Provider.of<CountDownProvider>(context, listen: false)
            .updateCountdown(initialCountdown);

        // Provider.of<CountDownProvider>(context, listen: false)
        //     .updateIntialCountdown(initialCountdown);

        // Set the countdown value in the provider
        // Provider.of<CountDownProvider>(context, listen: false)
        //     .updateCountdown(initialCountdown);

        // // Start the countdown timer
        // final timer = Timer.periodic(Duration(seconds: 1), (timer) {
        //   final currentTime = DateTime.now();
        //   final remainingTime = selectedTimeDateTime.isAfter(currentTime)
        //       ? selectedTimeDateTime.difference(currentTime).inSeconds
        //       : 0;
        //   if (remainingTime > 0) {
        //     Provider.of<CountDownProvider>(context, listen: false)
        //         .updateCountdown(initialCountdown);
        //   } else {
        //     // Countdown timer reached zero, stop the timer
        //     timer.cancel();
        //     Provider.of<CountDownProvider>(context, listen: false)
        //         .updateCountdown(0);
        //   }
        // });
      }
    });
  }

  init() async {
    user = Provider.of<AuthProvider>(context, listen: false).getCurrentUser();

    if (user != null) {
      debugPrint('<<<<<<<<<<<<<<<called>>>>>>>>>');

      Provider.of<AuthProvider>(context, listen: false).getUserDetails();
    }
    debugPrint(
        'user at init state ${Provider.of<AuthProvider>(context, listen: false).isLoading}');
    Provider.of<CountDownProvider>(context, listen: false).getCurrentWeekName();
    Provider.of<CountDownProvider>(context, listen: false)
        .loadCountdownFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, CountDownProvider>(
        builder: (context, authProvider, countdownProvider, child) {
      return Scaffold(
        body: user == null
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: <Widget>[
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/ban_ads.png',
                        width: 26,
                        color: Colors.black,
                      ),
                      CustomText(
                        title: "Block-ed",
                        fontSize: 20,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomInkWell(
                        onTap: () {
                          showdialog(context, user);
                        },
                        child: Icon(
                          Icons.account_circle,
                          size: 38,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 90),
                  Container(
                      child: Stack(
                    alignment: Alignment.center,
                    children: [
                      RotationTransition(
                        turns: _controller,
                        child: DottedBorder(
                          color: Colors.grey
                              .withOpacity(0.3), //color of dotted/dash line
                          strokeWidth: 3,
                          borderType:
                              BorderType.Circle, //thickness of dash/dots
                          dashPattern: [10, 6],

                          //dash patterns, 10 is dash width, 6 is space width
                          child: SizedBox(
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.height * 0.38,
                          ),
                        ),
                      ),
                      Positioned(
                        child: CustomInkWell(
                          onTap: () {
                            _setCountdownTime();
                          },
                          child: CustomText(
                              title: countdownProvider.selectedHour != null
                                  ? countdownProvider.selectedHour
                                          .toString()
                                          .padLeft(2, '0') +
                                      ':' +
                                      countdownProvider.selectedMinute
                                          .toString()
                                          .padLeft(2, '0')
                                  : '00:00',
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )),
                ]),
              )
            : user != null &&
                    Provider.of<AuthProvider>(context, listen: false).isLoading
                ? Center(
                    child: CustomLoader(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: <Widget>[
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/ban_ads.png',
                            width: 26,
                            color: Colors.black,
                          ),
                          CustomText(
                            title: "${authProvider.nickName}",
                            fontSize: 20,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomInkWell(
                            onTap: () {
                              showdialog(context, user);
                            },
                            child: user == null
                                ? Icon(
                                    Icons.account_circle,
                                    size: 38,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SizedBox(
                                      width: 35,
                                      height: 35,
                                      child: CustomCachedNetworkImage(
                                          url: authProvider.user!.photoURL),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      SizedBox(height: 90),

                      Container(
                          child: Stack(
                        alignment: Alignment.center,
                        children: [
                          RotationTransition(
                            turns: _controller,
                            child: DottedBorder(
                              color: Colors.grey
                                  .withOpacity(0.3), //color of dotted/dash line
                              strokeWidth: 3,
                              borderType:
                                  BorderType.Circle, //thickness of dash/dots
                              dashPattern: [10, 6],

                              //dash patterns, 10 is dash width, 6 is space width
                              child: SizedBox(
                                width: double.maxFinite,
                                height:
                                    MediaQuery.of(context).size.height * 0.38,
                              ),
                            ),
                          ),
                          Positioned(
                            child: CustomInkWell(
                              onTap: () {
                                _setCountdownTime();
                              },
                              child: CustomText(
                                  title: countdownProvider.selectedHour != null
                                      ? countdownProvider.selectedHour
                                              .toString()
                                              .padLeft(2, '0') +
                                          ':' +
                                          countdownProvider.selectedMinute
                                              .toString()
                                              .padLeft(2, '0')
                                      : '00:00',
                                  fontSize: 40,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      )),
                      // NeonCircularTimer(
                      //   width: 200,
                      //   duration: 20,
                      //   textFormat: TextFormat.HH_MM_SS,
                      //   isReverse: true,
                      //   controller: Provider.of<CountDownProvider>(context,
                      //           listen: false)
                      //       .controller,
                      //   isTimerTextShown: true,
                      //   textStyle: TextStyle(
                      //       fontSize: 28,
                      //       color: kPrimaryColor,
                      //       fontWeight: FontWeight.w500),
                      //   neumorphicEffect: false,
                      //   autoStart: false,
                      //   innerFillGradient: LinearGradient(colors: [
                      //     // A light shade of gray
                      //     kPrimaryColor,
                      //     kPrimaryColor,
                      //   ]),
                      // ),
                    ]),
                  ),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
