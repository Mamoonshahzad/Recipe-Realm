import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonDishesWidget extends StatelessWidget {
  final String scrollImage;

  final String scrollText;

  const CommonDishesWidget(
      {super.key, required this.scrollImage, required this.scrollText});

  @override
  Widget build(BuildContext context) {
    const goldenColor = Color(0xFFFFD700);
    return Stack(children: <Widget>[
      SizedBox(
          width: Get.width * 0.8,
          height: Get.height * 0.2,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                scrollImage,
                fit: BoxFit.cover,
              ))),
      Positioned(
          top: 10,
          left: 15,
          child: SizedBox(
              width: Get.width * .3,
              child: Text(scrollText,
                  style: GoogleFonts.notoSerifMalayalam(
                      color: goldenColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold))))
    ]);
  }
}
