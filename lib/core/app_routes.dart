
import 'package:flutter/material.dart';
import 'package:movies/authentication/forget_password_screen/forget_password_screen.dart';
import 'package:movies/authentication/login_screen/login_screen.dart';
import 'package:movies/authentication/regiester_screen/regiester_screen.dart';
import 'package:movies/authentication/update_profile_screen/update_profile_screen.dart';
import 'package:movies/main_layout/main_layout.dart';
import 'package:movies/onBoarding/onBoarding2.dart';
import 'package:movies/onBoarding/onBoarding3.dart';
import 'package:movies/onBoarding/onBoarding4.dart';
import 'package:movies/onBoarding/onBoarding5.dart';
import 'package:movies/onBoarding/onBoarding6.dart';

import '../onBoarding/onBoarding1.dart';

class AppRoutes {
  static final String onBoarding1 = "/onBoarding1";
  static final String onBoarding2 = "/onBoarding2";
  static final String onBoarding3 = "/onBoarding3";
  static final String onBoarding4 = "/onBoarding4";
  static final String onBoarding5 = "/onBoarding5";
  static final String onBoarding6 = "/onBoarding6";
  static final String loginScreen = "/loginScreen";
  static final String registerScreen = "/registerScreen";
  static final String forgetPassword = "/forgetPassword";
  static final String updateProfileScreen = "/updateProfileScreen";
  static final String mainLayout = "/mainLayout";
  // static final String editProfile = "/editProfile";

  static Map<String , WidgetBuilder> routes = {
    onBoarding1 : (context) => Onboarding1(),
    onBoarding2 : (context) => Onboarding2(),
    onBoarding3 : (context) => Onboarding3(),
    onBoarding4 : (context) => Onboarding4(),
    onBoarding5 : (context) => Onboarding5(),
    onBoarding6 : (context) => Onboarding6(),
    loginScreen : (context) => LoginScreen(),
    registerScreen : (context) => RegiesterScreen(),
    forgetPassword : (context) => ForgetPasswordScreen(),
    updateProfileScreen : (context) => UpdateProfileScreen(),
    mainLayout: (context) => MainLayout(),
    // editProfile: (context) => EditProfile()
  };
}