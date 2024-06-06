import 'package:flutter/material.dart';
import 'package:pr_sky_scrapper/Controller/theme_controller.dart';
import 'package:pr_sky_scrapper/Controller/weather_controller.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => WeatherController()),
      ],
      child: const MyApp(),
    ),
  );
}
