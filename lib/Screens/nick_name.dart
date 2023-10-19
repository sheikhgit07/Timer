import 'package:flutter/material.dart';
import 'package:loc_it/Screens/permission_screen.dart';
import 'package:loc_it/provider/auth_provider.dart';
import 'package:loc_it/utilites/colors.dart';
import 'package:loc_it/utilites/helper.dart';
import 'package:loc_it/utilites/notifcation_services.dart';
import 'package:loc_it/widgets/custom_button.dart';
import 'package:loc_it/widgets/custom_text.dart';
import 'package:loc_it/widgets/custom_textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class NicknameScreen extends StatelessWidget {
  final TextEditingController _nicknameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                      SizedBox(height: 10),
                      CustomText(
                        title: "Enter your nickname:",
                        fontSize: 22,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        controller: _nicknameController,
                        labelText: 'Nick Name',
                        validation: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return 'length should be greater than 3';
                          }
                        },
                        labelColor: kPrimaryColor,
                        isOutlineInputBorderColor: kPrimaryColor,
                        isOutlineInputBorder: true,
                      ),
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
                            // if (formKey.currentState!.validate()) {
                            //   Provider.of<AuthProvider>(context, listen: false)
                            //       .getUserName(_nicknameController.text);
                            //   Provider.of<AuthProvider>(context, listen: false)
                            //       .saveUserNickName(_nicknameController.text);
                            //   Helper.toScreen(context, PermissionScreen());
                            // }
                            debugPrint('clicled');
                            LocalNotifications.showPeriodicNotifications(
                                title: 'hello',
                                body: 'your phone has been locked',
                                payload: '12455');
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
      ),
    );
  }
}
