import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_realm/model/food_items_model.dart';
import 'package:recipe_realm/utils/app_constants.dart';

class FoodItemCard extends StatefulWidget {
  const FoodItemCard({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.onFavorite,
  });

  final String itemImage;
  final String itemName;
  final Function(bool isFavorite) onFavorite;

  @override
  FoodItemCardState createState() => FoodItemCardState();
}

class FoodItemCardState extends State<FoodItemCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .44,
      height: Get.width * .44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: AppConstant.appMainColor, blurRadius: 2)
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              width: Get.width * .4,
              height: Get.width * .29,
              decoration: BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                  image: AssetImage(widget.itemImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.itemName,
                style:
                    GoogleFonts.notoSerifMalayalam(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                    widget.onFavorite(isFavorite);
                  });
                },
                child: Text(
                  'Add to Favorite',
                  style: GoogleFonts.notoSerifMalayalam(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 20,
                    color: isFavorite ? Colors.red : null,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
