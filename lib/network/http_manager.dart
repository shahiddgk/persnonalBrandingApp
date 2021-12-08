import 'package:personal_branding/models/request/loin_request.dart';
import 'package:personal_branding/models/response/about_response_model.dart';
import 'package:personal_branding/models/response/achievement_response_list.dart';
import 'package:personal_branding/models/response/biography_response_model.dart';
import 'package:personal_branding/models/response/experience_response_list.dart';
import 'package:personal_branding/models/response/future_goals_response_list.dart';
import 'package:personal_branding/models/response/general_response_model.dart';
import 'package:personal_branding/models/response/session_user_model.dart';
import 'package:personal_branding/models/response/testimonials_response_list.dart';
import 'package:personal_branding/network/api_urls.dart';
import 'package:personal_branding/network/response_handler.dart';

class HTTPManager {
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

  Future<ExperienceReadResponse> experience() async {
    final url = ApplicationURLs.API_EXPERIENCE;
    final GeneralResponseModel response = await _handler.get(url, true);
    ExperienceReadResponse experienceReadResponse =
        ExperienceReadResponse.fromJson(response.data);
    return experienceReadResponse;
  }

  Future<TestimonialsReadResponse> testimonials() async {
    final url = ApplicationURLs.API_TESTIMONIALS;
    final GeneralResponseModel response = await _handler.get(url, true);
    TestimonialsReadResponse testimonialsReadResponse =
        TestimonialsReadResponse.fromJson(response.data);
    return testimonialsReadResponse;
  }

  Future<AchievementReadResponse> achievement() async {
    final url = ApplicationURLs.API_ACHIEVEMENT;
    final GeneralResponseModel response = await _handler.get(url, true);
    AchievementReadResponse achievementReadResponse =
        AchievementReadResponse.fromJson(response.data);
    return achievementReadResponse;
  }

  Future<FutureGoalsReadResponse> futureGoals() async {
    final url = ApplicationURLs.API_FUTURE_GOALS;
    final GeneralResponseModel response = await _handler.get(url, true);
    FutureGoalsReadResponse futureGoalsReadResponse =
        FutureGoalsReadResponse.fromJson(response.data);
    return futureGoalsReadResponse;
  }
}
