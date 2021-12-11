import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:personal_branding/models/response/general_response_model.dart';
import 'package:personal_branding/utills/utils.dart';
import 'app_exceptions.dart';

String MESSAGE_KEY = 'message';
String TOKEN = '';
bool _isLoading = true;

class ResponseHandler {
  Map<String, String> setTokenHeader() {
    return {
      '': ''
    }; //{'Authorization': 'Bearer ${Constants.authenticatedToken}'};
  }

  Future<GeneralResponseModel> post(String url, Map<String, dynamic> params,
      bool isHeaderRequired) async {
    var head = Map<String, String>();
    head['content-type'] = 'application/x-www-form-urlencoded';
    var responseJson;
    try {
      final response = await http.post(
          Uri.parse(url), body: params, headers: head);
      responseJson = json.decode(response.body.toString());
      print(responseJson);
      var res =
      GeneralResponseModel.fromJson(json.decode(response.body.toString()));
      if (!res.status) throw FetchDataException(res.message);
      return res;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<GeneralResponseModel> postt(String url,String token, bool isHeaderRequired,) async {


    // var head = Map<String, String>();
    // head['content-type'] = 'application/x-www-form-urlencoded';
    // head['Authorization'] = token;
    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), headers: {HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',HttpHeaders.authorizationHeader:'Bearer ${token}'});
      responseJson = json.decode(response.body.toString());
      print(responseJson);
      var res =
      GeneralResponseModel.fromJson(json.decode(response.body.toString()));
      if (!res.status) throw FetchDataException(res.message);
      return res;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<GeneralResponseModel> posttt(String url,String token, Map<String, dynamic> params, bool isHeaderRequired,) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(url),body: params ,headers: {HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',HttpHeaders.authorizationHeader:'Bearer ${token}'});
      responseJson = json.decode(response.body.toString());
      print(responseJson);
      var res =
      GeneralResponseModel.fromJson(json.decode(response.body.toString()));
      if (!res.status) throw FetchDataException(res.message);
      return res;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }


  Future<GeneralResponseModel> get(String url, bool isHeaderRequired) async {
    var head = Map<String, String>();
    head['content-type'] = 'application/json; charset=utf-8';
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: head);
      responseJson = json.decode(response.body.toString());
      print(responseJson);

      var res =
      GeneralResponseModel.fromJson(json.decode(response.body.toString()));
      if (!res.status) throw FetchDataException(res.message);
      return res;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<GeneralResponseModel> gett(String url,String token, bool isHeaderRequired) async {

    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: {HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',HttpHeaders.authorizationHeader:'Bearer ${token}'});
      responseJson = json.decode(response.body.toString());
      print(responseJson);

      var res =
      GeneralResponseModel.fromJson(json.decode(response.body.toString()));
      if (!res.status) throw FetchDataException(res.message);
      return res;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}