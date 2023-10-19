import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loc_it/model/UserModel/user_model.dart';
import 'package:loc_it/provider/count_down_provider.dart';
import 'package:loc_it/utilites/helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore db = FirebaseFirestore.instance;

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  bool createWeeklyDataCalled = false;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String? nickName;
  UserModel? user;
  User? userInfo;

  getUserName(String name) {
    nickName = name;
    notifyListeners();
  }

  // Function to save the hour and minute in Shared Preferences
  Future<void> saveUserNickName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nickname', name);
  }

  Future<void> getNickName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    nickName = prefs.getString('nickname');
    notifyListeners();
  }

  // Sign in with Google
  Future<UserModel?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        return null; // The user canceled the sign-in process
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential authResult =
            await auth.signInWithCredential(credential);
        final User? firebaseUser = authResult.user;

        if (firebaseUser != null) {
          // Retrieve the user's profile picture URL
          userInfo = getCurrentUser();
          await getUserDetails();
          Navigator.pop(context);
          Helper.showSnack(context, 'Signed was successful');

          final String? profilePictureURL = googleSignInAccount.photoUrl;

          user = UserModel(
            uid: firebaseUser.uid,
            nickName: nickName.toString(),
            displayName: firebaseUser.displayName ?? '',
            email: firebaseUser.email ?? '',
            photoURL: profilePictureURL,
          );
          db.collection('Users').doc(auth.currentUser!.uid).set(user!.toMap());

          Provider.of<CountDownProvider>(context, listen: false)
              .createWeeklyData();
          Provider.of<CountDownProvider>(context, listen: false)
              .createMonthlyCollection();

          return user;
        } else {
          Navigator.pop(context);

          return null;
        }
      } catch (e) {
        Navigator.pop(context);

        Helper.showSnack(context, "Google Sign-In Error: $e");
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        Helper.showSnack(
          context,
          'The account already exists with a different credential',
        );
      } else if (e.code == 'invalid-credential') {
        Helper.showSnack(
          context,
          'Error occurred while accessing credentials. Try again.',
        );
      }
    } catch (e) {
      Helper.showSnack(
        context,
        'Error occurred using Google Sign In. Try again.',
      );
    }
  }

  // Sign out
  Future<void> signOut(BuildContext context) async {
    await _googleSignIn.signOut();
    await auth.signOut();

    notifyListeners();

    Navigator.pop(context);
  }

  // Check if the user is signed in
  User? getCurrentUser() {
    return auth.currentUser;
  }

//  read data from firebase firstore
  Future<void> getUserDetails() async {
    isLoading = true;

    debugPrint('<<<<<<<getting user info...>>>>>>>>');
    notifyListeners();

    final DocumentReference document =
        db.collection("Users").doc(auth.currentUser!.uid);

    try {
      final DocumentSnapshot snapshot = await document.get();

      if (snapshot.exists) {
        final userData = snapshot.data() as Map<String, dynamic>;
        user = UserModel.fromMap(userData);
      } else {
        user = null;
      }

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
      isLoading = false;
      notifyListeners();
    }
  }
}
