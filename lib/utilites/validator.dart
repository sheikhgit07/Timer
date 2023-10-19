import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'colors.dart';

void showToast(String toast) {
  Fluttertoast.showToast(
    msg: toast,
    gravity: ToastGravity.CENTER,
    backgroundColor: blackColor,
    textColor: whiteColor,
  );
}

String? firstNameField(String? fieldContent) {
  //<-- add String? as a return type
  if (fieldContent!.isEmpty) {
    return 'Please enter Username';
  } else if (fieldContent.length < 4) {
    return 'Please enter valid Username';
  }
  return null;
}

String? lastNameField(String? fieldContent) {
  //<-- add String? as a return type
  if (fieldContent!.isEmpty) {
    return 'Invalid Last Name';
  }
  return null;
}

String? emailField(String? fieldContent) {
  //<-- add String? as a return type
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (fieldContent!.isEmpty) {
    return "Invalid email";
  } else if (fieldContent.isNotEmpty) {
    if (!regExp.hasMatch(fieldContent)) {
      return "Invalid email";
    }
  }
  return null;
}

String? loginEmailField(String? fieldContent) {
  //<-- add String? as a return type
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (fieldContent!.isEmpty) {
    return "Invalid email/phone";
  }
  return null;
}

String? phoneField(String? fieldContent) {
  //<-- add String? as a return type
  if (fieldContent!.isEmpty) {
    return 'Invalid Phone Number';
  }
  return null;
}

String? validateMobile(String? value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (value!.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String? oldPasswordField(String? value) {
  oldPassValue = value;
  if (value!.isEmpty) {
    return 'Invalid password';
  } else if (value.length < 6) {
    return "Password should be between 6-20 characters";
  } else {
    return null;
  }
}

String? oldPassValue;
String? validatePassword(String? value) {
  oldPassValue = value;
  if (value!.isEmpty) {
    return 'Invalid password';
  } else if (value.length < 6) {
    return "Password should be between 6-20 characters";
  } else {
    return null;
  }
}

bool areTextFieldsEqual(String text1, String text2) {
  return text1.contains(text2);
}

String? validateRepeatPassword(String? value) {
  if (value!.isEmpty) {
    return 'Invalid password';
  } else if (value.length < 6) {
    return "Password should be between 6-20 characters";
  } else if (!value.contains(oldPassValue.toString())) {
    return "Password and Confirm Password should be same";
  } else {
    return null;
  }
}

String? newValidatePassword(String? value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value!.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid password';
    } else {
      return null;
    }
  }
}

String? labelField(String? fieldContent) {
  //<-- add String? as a return type
  if (fieldContent!.isEmpty) {
    return 'Must fill';
  }
  return null;
}

String? portField(String? fieldContent) {
  //<-- add String? as a return type
  if (fieldContent!.isEmpty) {
    return 'Must fill';
  }
  return null;
}

String? domainField(String? fieldContent) {
  //<-- add String? as a return type
  if (fieldContent!.isEmpty) {
    return 'Must fill';
  }
  return null;
}

String? pathField(String? fieldContent) {
  //<-- add String? as a return type
  if (fieldContent!.isEmpty) {
    return 'Must fill';
  }
  return null;
}
