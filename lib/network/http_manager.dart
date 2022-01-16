import 'package:http/http.dart' as http;

import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:personal_branding/models/request/loin_request.dart';
import 'package:personal_branding/models/request/register_request.dart';
import 'package:personal_branding/models/request/social_login_request.dart';
import 'package:personal_branding/models/request/user_save_start_up_request.dart';
import 'package:personal_branding/models/request/user_start_up_request.dart';
import 'package:personal_branding/models/request/widget_upload_file.dart';
import 'package:personal_branding/models/response/about_response_model.dart';
import 'package:personal_branding/models/response/achievement_response_list.dart';
import 'package:personal_branding/models/response/biography_response_model.dart';
import 'package:personal_branding/models/response/career_response_list.dart';
import 'package:personal_branding/models/response/experience_response_list.dart';
import 'package:personal_branding/models/response/future_goals_response_list.dart';
import 'package:personal_branding/models/response/general_response_model.dart';
import 'package:personal_branding/models/response/session_user_model.dart';
import 'package:personal_branding/models/response/start_up_save_response.dart';
import 'package:personal_branding/models/response/startup_response_model.dart';
import 'package:personal_branding/models/response/testimonials_response_list.dart';
import 'package:personal_branding/network/api_urls.dart';
import 'package:personal_branding/network/response_handler.dart';
import 'package:personal_branding/utills/utils.dart';

class HTTPManager {
  static bool internetCheck = true;
  ResponseHandler _handler = ResponseHandler();

  Future<GeneralResponseModel> registerUser(RegisterRequest registerRequest) async {
    final url = ApplicationURLs.API_REGISTER;
    final GeneralResponseModel response =
    await _handler.post(url, registerRequest.toJson(), false);
    // SessionUserModel sessionUserModel =
    // SessionUserModel.fromJson(response.user);
     return response;
  }

  Future<SessionUserModel> registerUserWithSocialAccount(SocialLoginRequest socialLoginRequest) async {
    final url =  ApplicationURLs.SOCIAL_URL;
    final GeneralResponseModel response =
    await _handler.post(url, socialLoginRequest.toJson(), false);
    SessionUserModel sessionUserModel =
    SessionUserModel.fromJson(response.user);
    return sessionUserModel;
  }

  Future<SessionUserModel> loginUser(LoginRequest loginRequest) async {
    final url = ApplicationURLs.API_LOGIN;
    final GeneralResponseModel response =
        await _handler.post(url, loginRequest.toJson(), false);
    SessionUserModel sessionUserModel =
        SessionUserModel.fromJson(response.user);
    return sessionUserModel;
  }

  Future<GeneralResponseModel> logoutuser(token) async {

    print("token:::$token");
    final url = ApplicationURLs.API_LOGOUT;
    final GeneralResponseModel response = await _handler.post_with_token(url,token,true);
    return response;
  }

  Future<AboutReadResponse> about() async {
    final url = ApplicationURLs.API_ABOUT;
    final GeneralResponseModel response = await _handler.get(url, true);
    AboutReadResponse aboutReadResponse =
        AboutReadResponse.fromJson(response.data);
    return aboutReadResponse;
  }

  Future<List<BiographyReadResponse>> Biography() async {
    final url = ApplicationURLs.API_BIOGRAPHY;
    final GeneralResponseModel response = await _handler.get(url, true);
    BiographyListResponse biographyReadResponse =
        BiographyListResponse.fromJson(response.data);
    return biographyReadResponse.biographyList;
  }

  Future<List<ExperienceReadResponse>> Experience() async {
    final url = ApplicationURLs.API_EXPERIENCE;

    final GeneralResponseModel response = await _handler.get(url, true);
    ExperienceListResponse experienceListResponse =
    ExperienceListResponse.fromJson(response.data);
    return experienceListResponse.experienceList;
  }

  Future<List<TestimonialsReadResponse>> Testimonials() async {
    final url = ApplicationURLs.API_TESTIMONIALS;
    final GeneralResponseModel response = await _handler.get(url, true);
    TestimonialsListResponse testimonialsListResponse =
    TestimonialsListResponse.fromJson(response.data);
    return testimonialsListResponse.testimonialsList;
  }

  Future<List<CareerReadResponse>> Careers() async {
    final url = ApplicationURLs.API_CAREER;
    final GeneralResponseModel response = await _handler.get(url, true);
    CareerListResponse careerListResponse =
    CareerListResponse.fromJson(response.data);
    return careerListResponse.careerList;
  }

  Future<List<AchievementsReadResponse>> Achievement() async {
    final url = ApplicationURLs.API_ACHIEVEMENT;
    final GeneralResponseModel response = await _handler.get(url, true);
    AchievementsListResponse achievementsListResponse =
    AchievementsListResponse.fromJson(response.data);
    return achievementsListResponse.achievementList;
  }

  Future<List<FutureGoalsReadResponse>> FutureGoals() async {
    final url = ApplicationURLs.API_FUTURE_GOALS;
    final GeneralResponseModel response = await _handler.get(url, true);
    FutureGoalsListResponse futureGoalsListResponse =
    FutureGoalsListResponse.fromJson(response.data);
    return futureGoalsListResponse.futureGoalsList;
  }

  Future<List<StartUpReadResponse>> StartUp(String token,int id) async {
    print(token);
   print(id);
   String userid;
    final url = ApplicationURLs.API_STARTUP_LIST + "?userid=$id";
    print(url);
    final GeneralResponseModel response = await _handler.get_with_token(url,token, true);
    StartUpListResponse startUpListResponse =
    StartUpListResponse.fromJson(response.data);
    return startUpListResponse.startUpList;
  }

  Future<SaveStartUpReadResponse> savestartUpUser(String token,SaveStartUpRequest startUpRequest) async {

    print(startUpRequest.title);
    print(startUpRequest.message);
    print(startUpRequest.industry);
    print(startUpRequest.purpose);
    print(startUpRequest.date);
    print(startUpRequest.userid);
    print(token);

    final url = ApplicationURLs.API_SAVE_STARTUP;
    final GeneralResponseModel response =
    await _handler.post_with_token_params(url, token,startUpRequest.toJson(),true);
    print(response.token);
    SaveStartUpReadResponse startUpReadResponse =
    SaveStartUpReadResponse.fromJson(response.data);
    return startUpReadResponse;
  }

  Future uploadFile(String token,Map<String, String> id,files) async {

    final url = ApplicationURLs.API_UPLOAD_FILE;
    final GeneralResponseModel response =
    await _handler.postWithFile(url,id,files,true,token);
    print(response.token);
  }

}
