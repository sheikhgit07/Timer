import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loc_it/provider/auth_provider.dart';
import 'package:loc_it/utilites/colors.dart';
import 'package:loc_it/widgets/custom_cached_network_image.dart';
import 'package:loc_it/widgets/custom_inkwell_btn.dart';
import 'package:loc_it/widgets/custom_text.dart';
import 'package:provider/provider.dart';

void showdialog(BuildContext context, User? user) {
  debugPrint('user:$user');

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(user);
    },
  );
}

class CustomDialog extends StatefulWidget {
  CustomDialog(
    this.user,
  );

  User? user;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      debugPrint('model ${authProvider.user}');
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 70,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                AlertDialog(
                  insetPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomInkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: 15.5,
                        ),
                      ),
                      CustomText(
                        title: "Block-ed",
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                      SizedBox(),
                    ],
                  ),
                  content: Column(
                    children: [
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: kPrimaryColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            authProvider.user == null || widget.user == null
                                ? CustomInkWell(
                                    onTap: () {
                                      authProvider.signInWithGoogle(context);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.account_circle),
                                        SizedBox(width: 8.0),
                                        Text("Sign in with Google"),
                                      ],
                                    ),
                                  )
                                : Row(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: CustomCachedNetworkImage(
                                              url: authProvider.user!.photoURL),
                                        ),
                                      ),
                                      // CircleAvatar(
                                      //     backgroundImage: NetworkImage(
                                      //         authProvider.user != null
                                      //             ? authProvider.user!.photoURL
                                      //                 .toString()
                                      //             : '')),
                                      SizedBox(width: 8.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("${authProvider.user!.email}"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          CustomInkWell(
                                            onTap: () {
                                              authProvider.signOut(context);
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: Colors.black,
                                                ),
                                                child: Text(
                                                  "Sign out",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                            SizedBox(height: 16.0),
                            Row(
                              children: <Widget>[
                                Icon(Icons.block),
                                SizedBox(width: 8.0),
                                Text("Remove Ads"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Icon(Icons.star),
                                SizedBox(width: 8.0),
                                Text("Rate the App"),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.share),
                                SizedBox(width: 8.0),
                                Text("Share"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
