import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loc_it/Screens/graph.dart';

import 'package:loc_it/Screens/splash_screen.dart';

import 'package:loc_it/firebase_options.dart';
import 'package:loc_it/provider/auth_provider.dart';
import 'package:loc_it/provider/count_down_provider.dart';
import 'package:loc_it/utilites/notifcation_services.dart';
import 'package:loc_it/utilites/theme/app_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await LocalNotifications.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CountDownProvider()),
    ChangeNotifierProvider(create: (context) => AuthProvider()),

    // ChangeNotifierProvider(create: (context) => AudioProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // init();
  }

  init() async {
    await Provider.of<CountDownProvider>(context, listen: false)
        .loadCountdownFromPrefs();
    DateTime now = DateTime.now();

    final currentCountdown =
        Provider.of<CountDownProvider>(context, listen: false).countdown;

    if (currentCountdown > 0) {
      final currentTime = DateTime.now();
      debugPrint('currentCountdown :${currentCountdown}');

      // Convert currentCountdown into a DateTime
      final currentCountdownDateTime =
          now.add(Duration(seconds: currentCountdown));

      // Calculate the time difference
      final timeDifference = currentCountdownDateTime.difference(currentTime);
      debugPrint('timeDifference:${timeDifference}');
      // Convert the time difference into seconds as an int
      final updatedCountdown = timeDifference.inSeconds;

      String formattedTime =
          '${updatedCountdown ~/ 3600}:${(updatedCountdown % 3600) ~/ 60}:${updatedCountdown % 60}';
      debugPrint('Updated countdown:${formattedTime}');

      if (updatedCountdown > 0) {
        Provider.of<CountDownProvider>(context, listen: false)
            .updateCountdown(updatedCountdown);
      } else {
        Provider.of<CountDownProvider>(context, listen: false)
            .updateCountdown(0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent, // Color for Android
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness:
            Brightness.light, // Dark == white status bar -- for IOS.
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getLightModeTheme(),
      home: SplashScreen(),
    );
  }
}
