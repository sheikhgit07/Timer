import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loc_it/model/week_model.dart';
import 'package:loc_it/provider/auth_provider.dart';

import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountDownProvider extends ChangeNotifier {
  bool isLoading = false;
  CountDownController? controller;

  init() {
    controller = CountDownController();
  }

  int time = 0;
  onTimeChanged(int selectedTime) {
    time = selectedTime;
    notifyListeners();
  }

  int _countdown = 0;
  int intialCountdown = 0;

  static const _countdownKey = 'countdown_value';
  WeekDataModel? weekData;

  CountdownProvider() {
    // Load the countdown value from SharedPreferences during initialization
    loadCountdownFromPrefs();
  }

  int get countdown => _countdown;

  int _selectedIndex = 0; // Default index is 0 (Weekly)

  int get selectedIndex => _selectedIndex;

  void updateIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners(); // Notify listeners that the index has changed
  }

  getHourMinute(int hour, int minute) {
    selectedHour = hour;
    selectedMinute = minute;

    notifyListeners();
    debugPrint('selected hour:$selectedHour selected minute: $selectedMinute');
  }

  resetHourMinute() {
    selectedHour = null;
    selectedMinute = null;

    notifyListeners();
    debugPrint(
        'reset selected hour:$selectedHour selected minute: $selectedMinute');
  }

  // Update the countdown value
  void updateCountdown(int newValue) {
    _countdown = newValue;
    debugPrint('count down :$_countdown');
    notifyListeners();
    // Save the updated countdown value to SharedPreferences
    saveCountdownToPrefs();
  }

  //Update the intial countdown
  void updateIntialCountdown(int newValue) {
    intialCountdown = newValue;
    notifyListeners();
    // Save the updated countdown value to SharedPreferences
    intialCountdownToPrefs();
  }

  // Load countdown value from SharedPreferences
  Future<void> loadCountdownFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _countdown = prefs.getInt(_countdownKey) ?? 0;
    debugPrint('loaded countdown value $_countdown');

    notifyListeners();
  }

  //get highest value

  WeekDataModel? highestWeekData;
  WeekDataModel emojiWithHighestMoodCount(List<WeekDataModel> emojis) {
    debugPrint('<this method is called >');
    return emojis.reduce((a, b) =>
        int.parse(a.highestValue) > int.parse(b.highestValue) ? a : b);
  }

  // Save countdown value to SharedPreferences
  Future<void> saveCountdownToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_countdownKey, _countdown);
  }

  String intialCountkey = 'initial_countdown';
  Future<void> intialCountdownToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(intialCountkey, intialCountdown);
  }

  // Load countdown value from SharedPreferences
  Future<void> getInitailCountdownFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    intialCountdown = prefs.getInt(intialCountkey) ?? 0;

    notifyListeners();
  }

  // Reset the countdown to zero
  void resetCountdown() {
    _countdown = 0;
    notifyListeners();
    // Save the updated countdown value to SharedPreferences
    saveCountdownToPrefs();
  }

  List<WeekDataModel> weeklyDataList = [];
  //  read data from firebase firstore
  Future<void> getWeeklyData() async {
    if (auth.currentUser != null) {
      isLoading = true;
      // notifyListeners();
      // Reference to the user's document in the 'User' collection
      weeklyDataList.clear();
      DocumentReference userRef =
          db.collection('Users').doc(auth.currentUser!.uid);

// Reference to the 'weeklydata' subcollection
      CollectionReference weeklyDataRef = userRef.collection('WeeklyData');

// Fetch the documents in the 'weeklydata' subcollection

      weeklyDataRef.get().then((QuerySnapshot querySnapshot) {
        debugPrint('${querySnapshot.docs.isNotEmpty}');
        if (querySnapshot.docs.isNotEmpty) {
          // Iterate through the documents in the 'weeklydata' subcollection
          for (QueryDocumentSnapshot doc in querySnapshot.docs) {
            debugPrint('this is called');
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            debugPrint('${data['day']}');
            weeklyDataList.add(WeekDataModel.fromMap(data));

            highestWeekData = emojiWithHighestMoodCount(weeklyDataList);
            isLoading = false;
            debugPrint(
                'highest value:${highestWeekData!.highestValue} weeklyDataList:${weeklyDataList[0].week}');
            notifyListeners();
            // Process the data as needed
          }
        } else {
          // No documents found in the 'weeklydata' subcollection
          print('No documents found in weeklydata.');
          isLoading = false;
          notifyListeners();
        }
      }).catchError((error) {
        print('Error fetching data: $error');
        isLoading = false;
        notifyListeners();
      });
    }
  }

  List<MonthDataModel> monthlyDataList = [];
  //  read data from firebase firstore
  Future<void> getMonthData() async {
    final now = DateTime.now();
    final currentMonth = DateFormat.MMM().format(now);
    final currentYear = DateFormat.y().format(now);
    isLoading = true;

    // Reference to the user's document in the 'User' collection
    monthlyDataList.clear();
    DocumentReference userRef =
        db.collection('MonthlyData').doc(auth.currentUser!.uid);

// Reference to the 'weeklydata' subcollection
    CollectionReference monthlyDataRef = userRef
        .collection('Years')
        .doc(currentYear)
        .collection('Month')
        .doc(currentMonth)
        .collection('days');

// Fetch the documents in the 'weeklydata' subcollection

    monthlyDataRef.get().then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        // Iterate through the documents in the 'weeklydata' subcollection
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          monthlyDataList.add(MonthDataModel.fromMap(data));
          for (var val in monthlyDataList) {
            debugPrint('response:${val.startDay}-${val.endDay}');
          }

          isLoading = false;
          notifyListeners();
          // Process the data as needed
        }
      } else {
        // No documents found in the 'weeklydata' subcollection
        print('No documents found in monthlydata.');
        isLoading = false;
        notifyListeners();
      }
    }).catchError((error) {
      print('Error fetching data: $error');
      isLoading = false;
      notifyListeners();
    });
  }

  void createWeeklyData() {
    // Get the current date and time
    final now = DateTime.now();
    DateTime currentDay = now.subtract(
        Duration(days: now.weekday - 1)); // Set to Monday of the current week

    final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    for (int i = 0; i < 7; i++) {
      // Get the day name (e.g., 'Mon', 'Tue', etc.)
      String dayName = daysOfWeek[i];

      // Define data for the document
      Map<String, dynamic> documentData = {
        'value': '0',
        'day': dayName,
      };

      // Create the document in Firestore
      db
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .collection('WeeklyData')
          .doc(weekName)
          .get()
          .then((doc) {
        if (doc.exists) {
          debugPrint('documents already exist');
        } else {
          db
              .collection('Users')
              .doc(auth.currentUser!.uid)
              .collection('WeeklyData')
              .doc(dayName) // Use the date as the document ID
              .set(documentData)
              .then((_) {
            print('Document created for $dayName');
          }).catchError((error) {
            print('Error creating document: $error');
          });
        }
      });

      // Move to the next day (Tuesday, Wednesday, etc.)
      currentDay = currentDay.add(Duration(days: 1));
    }
  }

  String currentRange = '';
  void createMonthlyCollection() {
    final now = DateTime.now();
    final currentMonth = DateFormat.MMM().format(now);
    final currentYear = DateFormat.y().format(now);
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    for (int i = 1; i <= daysInMonth; i += 5) {
      final startDay = i;
      final endDay = (i + 4 < daysInMonth) ? i + 4 : daysInMonth;

      final documentName = '$startDay-$endDay';

      // Create a document within the collection

      // You can store data within the document if needed
      final data = {
        'startDay': startDay,
        'endDay': endDay,
        'value': 0.0,
        // Add other data fields here
      };

      db
          .collection('MonthlyData')
          .doc(auth.currentUser!.uid)
          .collection('Years')
          .doc(currentYear)
          .collection('Month')
          .doc(currentMonth)
          .collection('days')
          .doc(documentName)
          .get()
          .then((doc) {
        if (doc.exists) {
          debugPrint('documents already exist');
        } else {
          db
              .collection('MonthlyData')
              .doc(auth.currentUser!.uid)
              .collection('Years')
              .doc(currentYear)
              .collection('Month')
              .doc(currentMonth)
              .collection('days')
              .doc(documentName)
              // Use the date as the document ID
              .set(data)
              .then((_) {
            print('Document created for $currentMonth');
          }).catchError((error) {
            print('Error creating document: $error');
          });
        }
      });
    }
  }

  int daysInMonth(int year, int month) {
    final date = DateTime(year, month + 1, 0);
    return date.day;
  }

  void updateMonthlyCollection(DateTime date, int userFocusTime) {
    // Calculate the current day and the range of days for the document name
    final currentDay = date.day;
    final startDay =
        currentDay - (currentDay % 5) + 1; // Calculate the start day
    final endDay = startDay + 4; // Calculate the end day

    final currentMonth = DateFormat.MMM().format(date);
    final currentYear = DateFormat.y().format(date);

    // Generate the document name based on the date range
    final documentName = '$startDay-$endDay';
    currentRange = documentName;
    debugPrint('name : $documentName');

    // Reference to the Firestore document
    final documentReference = db
        .collection('MonthlyData')
        .doc(auth.currentUser!.uid)
        .collection('Years')
        .doc(currentYear)
        .collection('Month')
        .doc(currentMonth)
        .collection('days')
        .doc(documentName);

    // Retrieve the existing document
    documentReference.get().then((doc) {
      if (doc.exists) {
        // Document exists, update the fields
        final existingData = doc.data() as Map<String, dynamic>;
        final currentValue = existingData['value'];

        // Calculate the updated average value
        final updatedValue = (currentValue + userFocusTime) / 2;

        // Update the document with the new average value
        documentReference.update({
          'value': updatedValue,
          // Add other data fields here
        }).then((_) {
          print('Document updated for $currentMonth');
        }).catchError((error) {
          print('Error updating document: $error');
        });
      } else {
        print('Document does not exist for $currentMonth');
      }
    });
  }

  String weekName = '';
  String getCurrentWeekName() {
    final now = DateTime.now();
    final weekNameFormat = DateFormat('E', 'en_US');
    weekName = weekNameFormat.format(now);
    debugPrint('week name:$weekName');
    return weekName;
  }

// Function to read the hour and minute from Shared Preferences
  Future<List<int?>?> readHourMinuteFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? selectedHour = prefs.getInt('selectedHour');
    int? selectedMinute = prefs.getInt('selectedMinute');
    return [selectedHour, selectedMinute];
  }

  int? selectedHour;
  int? selectedMinute;
  // getHourAndMinutes(context) async {
  //   // Read the hour and minute from Shared Preferences
  //   List<int?>? hourMinute =
  //       await Provider.of<CountDownProvider>(context, listen: false)
  //           .readHourMinuteFromSharedPreferences();
  //   if (hourMinute != null) {
  //     selectedHour = hourMinute[0];
  //     selectedMinute = hourMinute[1];
  //     notifyListeners();
  //
  //     if (selectedHour != null && selectedMinute != null) {
  //       print('Selected Hour: $selectedHour');
  //       print('Selected Minute: $selectedMinute');
  //     }
  //   }
  // }
}
