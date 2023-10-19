import 'package:flutter/material.dart';
import 'package:loc_it/Screens/greeting_screen.dart';
import 'package:loc_it/Screens/home_screen.dart';
import 'package:loc_it/Screens/nick_name.dart';
import 'package:loc_it/Screens/permission_screen.dart';
import 'package:loc_it/utilites/colors.dart';
import 'package:loc_it/utilites/helper.dart';
import 'package:loc_it/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                _currentPage = index;
                setState(() {});
              },
              children: [
                NicknameScreen(),
                PermissionScreen(),
                GreetingScreen()
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage != 0)
                  Expanded(
                    child: CustomButton(
                      btnRadius: 50,
                      btnBorderColor: kPrimaryColor,
                      title: 'Back',
                      fontSize: 14,
                      textColor: kPrimaryColor,
                      btnBorderWidth: 1.5,
                      onPressed: () {
                        _pageController.previousPage(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.linear);
                      },
                    ),
                  ),
                SizedBox(
                  width: _currentPage != 0 ? 200 : 260,
                ),
                Expanded(
                  child: CustomButton(
                    btnRadius: 50,
                    onPressed: () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 600),
                          curve: Curves.linear);
                      if (_currentPage == 2) {
                        Helper.toScreen(context, HomeScreen());
                      }
                    },
                    btnColor: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    title: 'Next',
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
