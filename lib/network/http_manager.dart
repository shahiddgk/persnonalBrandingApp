import 'package:personal_branding/models/request/loin_request.dart';
import 'package:personal_branding/models/response/general_response_model.dart';
import 'package:personal_branding/models/response/session_user_model.dart';
import 'package:personal_branding/network/api_urls.dart';
import 'package:personal_branding/network/response_handler.dart';

class HTTPManager{
  static bool internetCheck = true;
  ResponseHandler _handler = ResponseHandler();

  Future<SessionUserModel> loginUser(LoginRequest loginRequest) async {
    final url = ApplicationURLs.API_LOGIN;
    final GeneralResponseModel response =
    await _handler.post(url, loginRequest.toJson(), false);
    SessionUserModel sessionUserModel =
    SessionUserModel.fromJson(response.data);
    return sessionUserModel;
  }



}