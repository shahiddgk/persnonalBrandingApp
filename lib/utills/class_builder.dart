
import 'package:personal_branding/Pages/About/about.dart';
import 'package:personal_branding/Pages/Achievement/achievement.dart';
import 'package:personal_branding/Pages/Authentication/login.dart';
import 'package:personal_branding/Pages/Authentication/register.dart';
import 'package:personal_branding/Pages/Biography/biography.dart';
import 'package:personal_branding/Pages/Career/careers.dart';
import 'package:personal_branding/Pages/Contact/contacts.dart';
import 'package:personal_branding/Pages/Entrepreneur/entrepreneur.dart';
import 'package:personal_branding/Pages/Experience/experience.dart';
import 'package:personal_branding/Pages/Future_Goals/future_goals.dart';
import 'package:personal_branding/Pages/Home/home.dart';
import 'package:personal_branding/Pages/Partnership/partnership.dart';
import 'package:personal_branding/Pages/Professional_Coaching/professional_coaching.dart';
import 'package:personal_branding/Pages/Testimonial/testimonials.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<About>(() => About());
    register<Biography>(() => Biography());
    register<Achievement>(() => Achievement());
    register<FutureGoals>(() => FutureGoals());
    register<Experience>(() => Experience());
    register<Testimonials>(() => Testimonials());
    register<ProfessionalCoaching>(() => ProfessionalCoaching());
    register<Entrepreneur>(() => Entrepreneur());
    register<Partnership>(() => Partnership());
    register<Career>(() => Career());
    register<LogIn>(() => LogIn());
    register<Register>(() => Register());
    register<Contacts>(() => Contacts());
  }

  static fromString(String s) {}

  // static dynamic fromString(String type) {
  //   return _constructors[type]();
  // }
}