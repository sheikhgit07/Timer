import 'package:flutter/material.dart';
import 'package:loc_it/Screens/home_screen.dart';

import 'package:loc_it/utilites/colors.dart';
import 'package:loc_it/utilites/helper.dart';
import 'package:loc_it/widgets/custom_button.dart';
import 'package:loc_it/widgets/custom_text.dart';

import 'package:lottie/lottie.dart';

class GreetingScreen extends StatelessWidget {
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
                SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: "Thank you!",
                      fontSize: 35,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    Lottie.asset('assets/animation/hand_wave.json', width: 48),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 90,
                      child: CustomButton(
                        btnRadius: 50,
                        onPressed: () {
                          Helper.toReplacementScreenSlideLeftToRight(
                              context, HomeScreen());
                        },
                        btnColor: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                        title: 'Next',
                        fontSize: 13,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
