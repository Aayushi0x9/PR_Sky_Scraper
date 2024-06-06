import 'package:flutter/material.dart';
import 'package:pr_sky_scrapper/utils/routes_utils.dart';

import 'Controller/theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeProvider.themeProvider.isDarkTheme
          ? ThemeData.dark()
          : ThemeData.light(),
      routes: AppRoutes.appRoutes.routes,
    );
  }
}
