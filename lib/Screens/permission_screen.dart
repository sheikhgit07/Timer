import 'package:flutter/material.dart';
import 'package:loc_it/Screens/greeting_screen.dart';
import 'package:loc_it/utilites/colors.dart';
import 'package:loc_it/utilites/helper.dart';
import 'package:loc_it/widgets/custom_button.dart';
import 'package:loc_it/widgets/custom_text.dart';
import 'package:loc_it/widgets/custom_textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:device_policy_manager/device_policy_manager.dart';

class PermissionScreen extends StatelessWidget {
  final TextEditingController _nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Hi",
                          fontSize: 24,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        Lottie.asset('assets/animation/hand_wave.json',
                            width: 45),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      title: "Grant permission to lock your screen",
                      fontSize: 22,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 30),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        btnRadius: 50,
                        btnHeight: 40,
                        btnBorderColor: kPrimaryColor,
                        title: 'Back',
                        fontSize: 13,
                        textColor: kPrimaryColor,
                        btnBorderWidth: 1.5,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 150,
                      child: CustomButton(
                        btnColor: kPrimaryColor,
                        title: 'Grant permission',
                        fontSize: 15,
                        btnRadius: 60,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w600,
                        onPressed: () async {
                          await DevicePolicyManager.requestPermession(
                              "Your app is requesting the Adminstration permission");
                          final status =
                              await DevicePolicyManager.isPermissionGranted();
                          if (status) {
                            Helper.toScreen(context, GreetingScreen());
                          } else {
                            Helper.showSnack(context, 'Permission denied');
                          }
                          // showDialog(
                          //     context: context,
                          //     builder: (context) =>
                          //         LockScreenPermissionDialog());
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LockScreenPermissionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Screen Lock Permission"),
      content:
          Text("Are you sure you want to give permission to lock your screen?"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Perform action when "Cancel" is pressed
            Navigator.of(context).pop();
          },
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () {
            // Perform action when "OK" is pressed
            // You can implement your screen lock logic here
            Helper.showSnack(context, 'Permission granted successfully',
                color: kPrimaryColor);
            Navigator.of(context).pop();
            Helper.toScreen(context, GreetingScreen());
            // Optionally, you can navigate to the next screen
          },
          child: Text(
            "OK",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
