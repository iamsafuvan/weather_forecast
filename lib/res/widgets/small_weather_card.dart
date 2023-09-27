import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_api/res/constant/constant.dart';

class SmallWeatherCard extends StatelessWidget {
  // final String time;
  // final String weather;
  // final String imageUrl;
  const SmallWeatherCard({
    super.key,
    // required this.time,
    // required this.weather,
    // required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 165,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 24,
          itemBuilder: (context, index) {
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
                  color: cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/storm.png',
                        width: 60,
                        height: 60,
                      ),
                      Text(
                        '10 AM',
                        style: GoogleFonts.kanit(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: fontColor,
                        ),
                      ),
                      Text(
                        '12 °c',
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
    );
  }
}
