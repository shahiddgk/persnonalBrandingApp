import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/models/response/session_user_model.dart';
import 'package:personal_branding/utills/styles.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'debouncer.dart';
export 'utilities.dart';

const String USER_KEY = "user_session";
const String token = "token";

late SessionUserModel globalSessionUser = SessionUserModel(
    id: 0,
    name: '',
    usertype: '',
    updatedAt: '',
    createdAt: '',
    email: '',
    status: '',
    token: '');

Future showAlert(BuildContext context, String message, bool isError,
    VoidCallback cancelCallback, VoidCallback retryCallback) async {
  print("IsError:${isError}");
  message.contains("Authorization Token not found") ?
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
          gradient: LinearGradient(colors: <Color>[primaryColor, primaryColor]),
          border: Border.all(color: primaryColor, width: 1),
          radius: BorderRadius.circular(10),
          child: const Text(
            "Sign In",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));
            cancelCallback();
          },
          width: 120,
        ),
    ],
  ).show()
      :
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
          style: TextStyle(color: Colors.black, fontSize: 20),
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

saveUserSession(SessionUserModel sessionUserModel) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(USER_KEY, jsonEncode(sessionUserModel));
}

Future<SessionUserModel> getUserSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userSession = prefs.getString(USER_KEY);
  if (userSession == null) {
    return SessionUserModel(
        id: 0,
        name: '',
        usertype: '',
        updatedAt: '',
        createdAt: '',
        email: '',
        status: '',
        token: '');
  }
  return SessionUserModel.fromJson(jsonDecode(userSession));
}

Future<SessionUserModel> logoutSessionUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return getUserSession();
}
