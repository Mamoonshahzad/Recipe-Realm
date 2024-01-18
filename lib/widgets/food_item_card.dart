import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_constants.dart';

class FoodItemCard extends StatefulWidget {
  const FoodItemCard(
      {super.key, required this.itemImage, required this.itemName});

  final String itemImage;
  final String itemName;

  @override
  FoodItemCardState createState() => FoodItemCardState();
}

class FoodItemCardState extends State<FoodItemCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * .44,
        height: Get.width * .46,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: AppConstant.appMainColor, blurRadius: 2)
            ]),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Container(
                  width: Get.width * .4,
                  height: Get.width * .28,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      image: DecorationImage(
                        image: NetworkImage(widget.itemImage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10)))),
          Padding(
              padding:
                  EdgeInsets.only(top: Get.width * .01, left: Get.width * .031),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.itemName,
                      style: GoogleFonts.notoSerifMalayalam(
                          fontWeight: FontWeight.bold)))),
          Padding(
              padding: EdgeInsets.only(left: Get.width * .03),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 3),
                              child: Text('View Details',
                                  style: GoogleFonts.notoSerifMalayalam(
                                      color: Colors.white, fontSize: 11)))),
                      SizedBox(width: Get.width * .01),
                      const Icon(Icons.arrow_forward, size: 20)
                    ],
                  )))
        ]));
  }
}
