import 'package:flutter/cupertino.dart';
import 'package:pr_sky_scrapper/Pages/HomePage/homepage.dart';

class AppRoutes {
  // static String splashScreen = '/';
  static String homePage = '/';

  Map<String, WidgetBuilder> routes = {
    // AppRoutes.splashScreen: (context) => SplashScreen(),
    AppRoutes.homePage: (context) => HomePage(),
    // AppRoutes.homePage:(context)=> ,
  };
  AppRoutes._();
  static final AppRoutes appRoutes = AppRoutes._();
}
