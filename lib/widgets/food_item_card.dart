import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard(
      {super.key, required this.itemImage, required this.itemName});
  final String itemImage;
  final String itemName;

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
          BoxShadow(
            color: Colors.red,
            blurRadius: 6,
            offset: Offset(0, 0), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              width: Get.width * .38,
              height: Get.width * .29,
              decoration: BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                    image: AssetImage(itemImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(itemImage, fit: BoxFit.fill),
            ),
          ),
          Text(itemName, style: GoogleFonts.poppins()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Ratings', style: GoogleFonts.poppins()),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  Icon(Icons.star_border_rounded, size: 20)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
