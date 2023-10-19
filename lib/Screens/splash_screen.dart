import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loc_it/Screens/count_down_screen.dart';
import 'package:loc_it/Screens/home_screen.dart';
import 'package:loc_it/Screens/nick_name.dart';
import 'package:loc_it/Screens/onbaording_screen.dart';
import 'package:loc_it/provider/auth_provider.dart';
import 'package:loc_it/provider/count_down_provider.dart';
import 'package:loc_it/utilites/colors.dart';
import 'package:loc_it/utilites/helper.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  _checkCurrentUser() async {
    AuthProvider _authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    User? user = await _authProvider.getCurrentUser();

    // Delay the navigation for a few seconds to show the splash screen
    await Future.delayed(Duration(seconds: 5));
    debugPrint('checking user:$user');

    // if (Provider.of<CountDownProvider>(context, listen: false).countdown > 0) {
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => CountDownTimerScreen(false)));
    // } else {
    if (user != null) {
      // User is signed in, navigate to the home screen
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      // No user is signed in, navigate to the sign-in screen
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NicknameScreen()));
    }
    // }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Rotation duration
    )..repeat(); // Make the rotation animation repeat
    _checkCurrentUser(); // Start the timer for navigation
  }

  void _startTimer() {
    Timer(Duration(seconds: 5), () {
      // Navigate to another screen after 5 seconds
      Helper.toReplacementScreenSlideLeftToRight(context, NicknameScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Use your chosen background color
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: Text(
            "Brick-ed",
            style: TextStyle(
              fontSize: 48,
              color: kPrimaryColor, // Use your chosen text color
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
