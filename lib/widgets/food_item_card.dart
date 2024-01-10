import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_realm/utils/app_constants.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard(
      {super.key,
      required this.itemImage,
      required this.itemName,
      required this.isFavorite,
      required this.onFavoritePressed});
  final String itemImage;
  final String itemName;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    var custHeight = SizedBox(height: Get.width * .02);
    return Container(
        width: Get.width * .44,
        height: Get.width * .44,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: AppConstant.appMainColor, blurRadius: 2),
            ]),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                  width: Get.width * .4,
                  height: Get.width * .29,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      image: DecorationImage(
                          image: AssetImage(itemImage), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)))),
          Padding(
              padding: const EdgeInsets.only(top: 2, left: 8),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(itemName,
                      style: GoogleFonts.notoSerifMalayalam(
                          fontWeight: FontWeight.bold)))),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text('Add to Favorite', style: GoogleFonts.notoSerifMalayalam()),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                  onTap: onFavoritePressed,
                  child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color: isFavorite ? Colors.red : null))
            ])
          ])
        ]));
  }
}
