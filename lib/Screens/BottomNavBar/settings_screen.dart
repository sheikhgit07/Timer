import 'package:flutter/material.dart';
import 'package:loc_it/Screens/uninstallation_guide.dart';
import 'package:loc_it/utilites/colors.dart';
import 'package:loc_it/utilites/helper.dart';
import 'package:loc_it/widgets/custom_text.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _BasicSettingsScreenState createState() => _BasicSettingsScreenState();
}

class _BasicSettingsScreenState extends State<SettingsScreen> {
  bool includeUninstallationGuide = false;

  void toggleUninstallationGuide(bool value) {
    setState(() {
      includeUninstallationGuide = value;
    });

    // You can implement the logic to enable or disable the uninstallation guide here.
    if (includeUninstallationGuide) {
      print("Uninstallation Guide Enabled");
    } else {
      print("Uninstallation Guide Disabled");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Settings Screen",
                  fontSize: 20,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Helper.toScreen(context, UninstallationScreen());
              },
              title: CustomText(
                title: 'How to uninstall',
                fontWeight: FontWeight.w500,
                fontSize: 17.5,
              ),
              subtitle: CustomText(
                title: 'Step by Step guide to uninstall app',
              ),
            ),
            ListTile(
              onTap: () {
                Helper.toScreen(context, UninstallationScreen());
              },
              title: CustomText(
                title: 'Privacy Policy',
                fontWeight: FontWeight.w500,
                fontSize: 17.5,
              ),
              subtitle: CustomText(
                title: 'Click to check privacy policy',
              ),
            ),
            ListTile(
              onTap: () {
                Helper.toScreen(context, UninstallationScreen());
              },
              title: CustomText(
                title: 'Terms and Condition',
                fontWeight: FontWeight.w500,
                fontSize: 17.5,
              ),
              subtitle: CustomText(
                title: 'Click to check Terms and Condition',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
