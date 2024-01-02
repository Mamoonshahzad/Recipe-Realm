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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     color: Colors.white,
        //     boxShadow: const [
        //       BoxShadow(
        //         color: Colors.red,
        //         blurRadius: 6,
        //         offset: Offset(0, 0),
        //       )
        //     ]),
        // width: Get.width * 0.2,
        // height: Get.height * 0.13,
        child: Column(
          children: [
            Container(
              width: Get.width * 0.15,
              height: Get.width * 0.15,
              child: Image.asset(gridIcon, fit: BoxFit.contain),
            ),
            Text(gridText, style: GoogleFonts.poppins()),
          ],
        ),
      ),
    );
  }
}
