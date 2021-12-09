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
}
