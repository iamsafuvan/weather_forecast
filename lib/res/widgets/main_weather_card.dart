import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_api/res/constant/constant.dart';

class MainWeatherCard extends StatelessWidget {
  final String date;
  final String celsius;
  final String location;
  final String description;
  final String main;
  final String country;
  final String imageUrl;
  final Color color;

  const MainWeatherCard({
    super.key,
    required this.date,
    required this.celsius,
    required this.location,
    required this.description,
    required this.country,
    required this.imageUrl,
    required this.main,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Color.fromARGB(255, 23, 18, 18),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Today',
                  style: GoogleFonts.kanit(
                    fontSize: 26,
                    color: fontColor,
                  ),
                ),
                Text(
                  date,
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    color: fontColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  celsius,
                  style: GoogleFonts.kanit(
                    fontSize: 60,
                    color: fontColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Image.asset(
                  imageUrl,
                  height: 120,
                  width: MediaQuery.of(context).size.width / 3,
                )
              ],
            ),
            Text(
              main,
              style: GoogleFonts.kanit(
                fontSize: 25,
                color: fontColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              description,
              style: GoogleFonts.kanit(
                fontSize: 16,
                color: Colors.yellow,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.yellow,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '$country  ',
                  style: GoogleFonts.kanit(
                    fontSize: 18,
                    color: fontColor,
                  ),
                ),
                Text(
                  location,
                  style: GoogleFonts.kanit(
                    fontSize: 18,
                    color: fontColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
