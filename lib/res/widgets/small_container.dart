import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_api/res/constant/constant.dart';

class SmallContainer extends StatelessWidget {
  final String imageUrl;
  final String text;
  final Color color;
  const SmallContainer({
    super.key,
    required this.imageUrl,
    required this.text, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        boxShadow: const [
          BoxShadow(
            blurRadius: 3.5,
            color: Colors.white,
            blurStyle: BlurStyle.outer,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 40,
            height: 50,
          ),
          Text(
            text,
            style: GoogleFonts.kanit(
              fontSize: 16,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
