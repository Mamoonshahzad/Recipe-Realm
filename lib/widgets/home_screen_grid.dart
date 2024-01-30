import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenGrid extends StatelessWidget {
  const HomeScreenGrid({
    super.key,
    required this.gridText,
    required this.gridIcon,
    this.onTap,
  });

  final String gridText;
  final String gridIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1), borderRadius: BorderRadius.circular(5)),
      width: Get.width * 0.3,
      height: Get.width * 0.3,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              width: Get.width * 0.23,
              height: Get.width * 0.23,
              child: Image.asset(gridIcon, fit: BoxFit.contain),
            ),
            Text(gridText, style: GoogleFonts.notoSerifMalayalam()),
          ],
        ),
      ),
    );
  }
}
