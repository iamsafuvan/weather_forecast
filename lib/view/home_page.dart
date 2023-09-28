import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_api/model/weather.dart';
import 'package:weather_app_api/repository/weather_model.dart';
import 'package:weather_app_api/res/constant/constant.dart';
import 'package:weather_app_api/res/widgets/main_weather_card.dart';
import 'package:weather_app_api/res/widgets/small_container.dart';

class HomePage extends StatefulWidget {
  final locationWeather;
  final forecastWeather;
  const HomePage({
    super.key,
    this.locationWeather,
    this.forecastWeather,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

// comment
class _HomePageState extends State<HomePage> {
  int? temperature;
  String? condition;
  String? cityName;
  String? country;
  String? weatherIcon;
  int? humidity;
  int? high;
  int? low;
  int? speed;
  String? tempIcon;
  int? hourlyTemp;
  var weatherForcast = {};
  String? main;
  WeatherRepository weatherModel = WeatherRepository();

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather, widget.forecastWeather);
  }

  void updateUi(Weather weather, weatherForcast) {
    setState(() {
      if (weather == null) {
        temperature = 0;
        weatherIcon = 'Error';
        condition = '';
        country = '';
        high = 0;
        low = 0;
        humidity = 0;
        speed = 0;
        hourlyTemp = 0;
        // main = '';

        tempIcon = 'Unable to get weather data';
        cityName = '';
      }
      this.weatherForcast = weatherForcast;
      temperature = weather.temp.toInt();
      country = weather.country;
      cityName = weather.name;
      condition = weather.description;
      tempIcon = weatherModel.getWeatherIcon(temperature!);
      high = weather.high.toInt();
      low = weather.low.toInt();
      humidity = weather.humidity.toInt();
      speed = weather.speed.toInt();
      main = weather.main;
      // hourlyTemp = weatherForecast.hourlyTemp.toInt();
    });
  }

  bool isDarkMode = false;
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  Future<void> refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    updateUi(widget.locationWeather, widget.forecastWeather);
    searchController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('MMM d, yyyy').format(now);
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor:
          isDarkMode ? Color.fromARGB(255, 206, 203, 203) : backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (isDarkMode == false) {
                setState(() {
                  isDarkMode = true;
                });
              } else {
                setState(() {
                  isDarkMode = false;
                });
              }
            },
            icon: isDarkMode
                ? const Icon(
                    Icons.dark_mode_outlined,
                    size: 30,
                    color: Colors.yellow,
                  )
                : const Icon(
                    Icons.wb_sunny_sharp,
                    size: 30,
                    color: Colors.yellow,
                  ),
          )
        ],
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              tileMode: TileMode.decal,
              sigmaX: 50,
              sigmaY: 50,
            ),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: isDarkMode
            ? const Color.fromARGB(255, 206, 203, 203)
            : backgroundColor,
        centerTitle: true,
        title: Text(
          'Weather Forecast ',
          style: GoogleFonts.kanit(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: isDarkMode ? Colors.black : fontColor,
          ),
        ),
      ),
      body: RefreshIndicator(
        color: cardColor,
        backgroundColor: Colors.yellow,
        onRefresh: refresh,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: searchController,
                    onChanged: (newValue) {
                      cityName = newValue;
                    },
                    style: GoogleFonts.kanit(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? Colors.black : fontColor,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      suffixIcon: TextButton(
                        onPressed: () async {
                          if (cityName != null) {
                            setState(() {
                              isLoading = true;
                            });
                            var weatherData =
                                await weatherModel.getCityWeather(cityName!);
                            var forecastData =
                                await weatherModel.getForcastWeather(cityName!);
                            updateUi(weatherData, forecastData);
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: isLoading
                            ? const SizedBox(
                                height: 27,
                                width: 27,
                                child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                  strokeWidth: 4.0,
                                ),
                              )
                            : Text(
                                'Search',
                                style: GoogleFonts.kanit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.yellow,
                                ),
                              ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: isDarkMode ? Colors.black : Colors.white,
                      ),
                      hintText: 'Search City',
                      hintStyle: GoogleFonts.kanit(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: isDarkMode ? Colors.black : fontColor,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 0.3),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                isLoading
                    ? const Center(
                        child: LinearProgressIndicator(
                          color: Colors.yellow,
                        ),
                      )
                    : MainWeatherCard(
                        date: formattedDate,
                        celsius: '$temperature °c ',
                        location: '$cityName',
                        main: main!,
                        description: '$condition',
                        country: '$country',
                        imageUrl: 'assets/images/$main.png',
                        color: isDarkMode
                            ? Color.fromARGB(255, 163, 160, 165)
                            : cardColor,
                      ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 150,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 14,
                        ),
                        SmallContainer(
                          imageUrl: 'assets/images/wind1.png',
                          text: '$speed km/h',
                          color: isDarkMode ? Color.fromARGB(255, 163, 160, 165) : cardColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SmallContainer(
                          imageUrl: 'assets/images/humidity.png',
                          text: '$humidity %',
                          color: isDarkMode ? Color.fromARGB(255, 163, 160, 165) : cardColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SmallContainer(
                          imageUrl: 'assets/images/high.png',
                          text: '$high °c',
                          color: isDarkMode ? Color.fromARGB(255, 163, 160, 165) : cardColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SmallContainer(
                          imageUrl: 'assets/images/low.png',
                          text: '$low °c',
                          color: isDarkMode ? Color.fromARGB(255, 163, 160, 165) : cardColor,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Next 24 hours',
                  style: GoogleFonts.kanit(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: isDarkMode ? Colors.black : fontColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 165,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 24,
                      itemBuilder: (context, index) {
                        // var item = hourlyTemp![index];
                        var forecastDatatHourly =
                            weatherForcast['hourly'][index];
                        // if(DateFormat('MMM d, yyyy').format(DateTime.parse(DateTime.fromMillisecondsSinceEpoch(forecastDatat['dt'] * 1000).toString())) == )
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 100,
                            width: 115,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color.fromARGB(255, 23, 18, 18),
                                  blurStyle: BlurStyle.outer,
                                ),
                              ],
                              color: isDarkMode
                                  ? Color.fromARGB(255, 163, 160, 165)
                                  : cardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/${forecastDatatHourly['weather'][0]['main']}.png',
                                    width: 60,
                                    height: 60,
                                  ),
                                  Text(
                                    '${DateFormat('hh:mm a').format(DateTime.parse(DateTime.fromMillisecondsSinceEpoch(forecastDatatHourly['dt'] * 1000).toString())).toString()}',
                                    style: GoogleFonts.kanit(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: fontColor,
                                    ),
                                  ),
                                  Text(
                                    '${forecastDatatHourly['temp'].toInt()} °c',
                                    style: GoogleFonts.kanit(
                                      fontSize: 20,
                                      color: fontColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                // SmallWeatherCard(
                //   imageUrl: 'assets/images/storm.png',
                //   time: '10 AM',
                //   weather: '12 °c',
                // ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Next 7 Days',
                  style: GoogleFonts.kanit(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: isDarkMode ? Colors.black : fontColor,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: weatherForcast.length,
                    itemBuilder: (context, index) {
                      var forecastDataDaily = weatherForcast['daily'][index];
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? Color.fromARGB(255, 163, 160, 165)
                                : cardColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat('dd-MM-yyy').format(DateTime.parse(
                                      DateTime.fromMillisecondsSinceEpoch(
                                              forecastDataDaily['dt'] * 1000)
                                          .toString())),
                                  style: GoogleFonts.kanit(
                                    fontSize: 18,
                                    color: fontColor,
                                  ),
                                ),
                                Text(
                                  '${forecastDataDaily['temp']['day'].toInt()} °c',
                                  style: GoogleFonts.kanit(
                                    fontSize: 18,
                                    color:
                                        const Color.fromARGB(255, 237, 200, 53),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/${forecastDataDaily['weather'][0]['main']}.png',
                                  width: 40,
                                  height: 40,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                // const NextFiveDaysWeatherList(
                //   date: '11-09-2023',
                //   weather: '34 °c',
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
