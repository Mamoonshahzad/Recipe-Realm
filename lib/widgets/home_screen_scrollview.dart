import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonDishesWidget extends StatelessWidget {
  String scrollImage;

  String scrollText;

  CommonDishesWidget(
      {super.key, required this.scrollImage, required this.scrollText});

  @override
  Widget build(BuildContext context) {
    const goldenColor = Color(0xFFFFD700);
    return Stack(
      children: <Widget>[
        Container(
          width: Get.width * 0.8,
          height: Get.height * 0.2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              scrollImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 10,
            left: 10,
            child: Text(scrollText,
                style: GoogleFonts.poppins(
                    color: goldenColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold))),
      ],
    );
  }
}
