import 'package:flutter/material.dart';
import 'package:pr_sky_scrapper/Controller/theme_controller.dart';
import 'package:pr_sky_scrapper/Controller/weather_controller.dart';
import 'package:pr_sky_scrapper/utils/Globals/globals.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    WeatherController listenable = Provider.of<WeatherController>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    Provider.of<WeatherController>(context, listen: false).loadAllWeatherData();
    // DateTime d = DateTime();
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(
            icon: Icon(
                themeProvider.isDarkTheme ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              initialValue: Globals.globals.SearchData,
              onFieldSubmitted: (val) =>
                  Globals.globals.SearchData = val ?? 'surat',
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    listenable.loadAllWeatherData();
                  },
                  icon: Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.015),
            listenable.weather_List.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Text(
                    '${listenable.weather_List[0]['localtime']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      letterSpacing: 1,
                    ),
                  ),
            SizedBox(height: size.height * 0.02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height * 0.2,
                  width: size.width * 0.2,
                  // color: Colors.blue,
                  child: Column(
                    children: [
                      Image(
                        image: NetworkImage(
                          "${listenable.weather_List[1]['condition']['icon']}",
                        ),
                        height: size.height * 0.15,
                        width: size.width * 0.15,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "${listenable.weather_List[1]['condition']['text'] ?? ''}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.2,
                  width: size.width * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${listenable.weather_List[1]['temp_c']}°C',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        '${listenable.weather_List[1]['temp_f']}°F',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              'Lat = ${listenable.weather_List[0]['lat']}, Lon = ${listenable.weather_List[0]['lon']}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
            Divider(
              indent: size.width * 0.1,
              endIndent: size.width * 0.1,
              color: Colors.blue,
              thickness: 1,
            ),
            Text(
              '${listenable.weather_List[0]['name']},${listenable.weather_List[0]['region']},${listenable.weather_List[0]['country']}',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
            Divider(
              indent: size.width * 0.1,
              endIndent: size.width * 0.1,
              color: Colors.blue,
              thickness: 1,
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    Globals.globals.card.length,
                    (i) => Container(
                      margin: EdgeInsets.all(10),
                      height: size.height * 0.05,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(3, 3),
                                blurRadius: 2)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                          "${Globals.globals.card[i]}  =  ${listenable.weather_List[1]['${Globals.globals.card[i]}']}"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
