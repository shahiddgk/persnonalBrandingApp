import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:personal_branding/models/response/general_response_model.dart';
import 'app_exceptions.dart';

String MESSAGE_KEY = 'message';

class ResponseHandler {
  Map<String, String> setTokenHeader() {
    return {
      '': ''
    }; //{'Authorization': 'Bearer ${Constants.authenticatedToken}'};
  }

  Future<GeneralResponseModel> post(
      String url, Map<String, dynamic> params, bool isHeaderRequired) async {
    var head = Map<String, String>();
    head['content-type'] = 'application/x-www-form-urlencoded';
    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: params, headers: head);
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
