import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_realm/utils/app_constants.dart';

class HomeScreenCategoriesWidget extends StatelessWidget {
  final String categoryIcon;
  final String categoryName;
  final VoidCallback? onTap;

  const HomeScreenCategoriesWidget({
    super.key,
    required this.categoryIcon,
    required this.categoryName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width * .4,
        height: Get.width * .37,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(00),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.grey,
            ),
          ],
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: const Alignment(.8, .5),
          //   colors: [
          //     Colors.grey.withOpacity(.9),
          //     Colors.white,
          //   ],
          // ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                categoryName,
                style: GoogleFonts.notoSerifMalayalam(
                  color: AppConstant.appMainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                categoryIcon,
                width: Get.width * .25,
                height: Get.width * .25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
