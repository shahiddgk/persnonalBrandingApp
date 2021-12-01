export 'debouncer.dart';
export 'utilities.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/utills/styles.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// const String USER_KEY = "user_session";
// SessionUserModel globalSessionUser;

Future showAlert(BuildContext context, String message, bool isError,
    VoidCallback cancelCallback, VoidCallback retryCallback) async {
  print("IsError:${isError}");
  Alert(
    context: context,
    type: isError ? AlertType.error : AlertType.success,
    title: isError ? "Error" : "Success",
    desc: message,
    style: AlertStyle(
        isCloseButton: false,
        isOverlayTapDismiss: false,
        alertElevation: 8.0,
        titleStyle: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 28)),
    buttons: [
      if (isError)
        DialogButton(
          color: Colors.white,
          border: Border.all(color: primaryColor, width: 1),
          radius: BorderRadius.circular(10),
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            cancelCallback();
          },
          width: 120,
        ),
      DialogButton(
        gradient: LinearGradient(colors: <Color>[primaryColor, primaryColor]),
        radius: BorderRadius.circular(10),
        child: Text(
          isError ? "Retry" : "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
          retryCallback();
        },
        width: 120,
      )
    ],
  ).show();
}