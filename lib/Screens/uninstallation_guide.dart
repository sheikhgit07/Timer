import 'package:flutter/material.dart';
import 'package:loc_it/utilites/colors.dart';
import 'package:loc_it/widgets/custom_inkwell_btn.dart';
import 'package:loc_it/widgets/custom_text.dart';

class UninstallationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomInkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            )),
        title: CustomText(
          title: 'Uninstallation Guide',
          fontSize: 18,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                title: 'To uninstall the app, follow these steps:',
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              CustomText(
                  title:
                      '1. Locate the app icon on your device’s home screen or app drawer.',
                  fontSize: 16),
              SizedBox(height: 10),
              CustomText(
                title: '2. Tap and hold the app icon until a menu appears.',
                fontSize: 16,
              ),
              SizedBox(height: 10),
              CustomText(
                title:
                    '3. Look for an option that says "Uninstall", "Remove", or a trash bin icon.',
                fontSize: 16,
              ),
              SizedBox(height: 10),
              CustomText(
                  title:
                      '4. Tap the uninstall option and confirm any prompts that appear.',
                  fontSize: 16),
              SizedBox(height: 10),
              CustomText(
                  title: '5. The app will be uninstalled from your device.',
                  fontSize: 16),
            ],
          ),
        ),
      ),
    );
  }
}
