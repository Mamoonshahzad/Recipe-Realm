import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_realm/model/food_items_model.dart';
import 'package:recipe_realm/utils/app_constants.dart';

class DetailsScreen extends StatelessWidget {
  final FoodItemsDataModel selectedItem;

  const DetailsScreen({required this.selectedItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: Text(selectedItem.itemName as String,
            style: GoogleFonts.notoSerifMalayalam(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200, // Adjust the height as needed
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Clip the image
                  child: Image.network(
                    selectedItem.imageUrl as String,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(height: 1),
              Align(
                alignment: Alignment.center,
                child: Text(
                  selectedItem.itemName as String,
                  style: GoogleFonts.notoSerifMalayalam(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppConstant.appMainColor),
                ),
              ),
              const Divider(height: 1),
              AppConstant.custHeight,
              Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: AppConstant.appMainColor,
                          blurRadius: 1,
                          spreadRadius: 1)
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Text("Ingredients:",
                        style: GoogleFonts.notoSerifMalayalam(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                    Text(selectedItem.ingredients.toString(),
                        style: GoogleFonts.notoSerifMalayalam(fontSize: 15)),
                    Text("\nInstructions:",
                        style: GoogleFonts.notoSerifMalayalam(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                    Text(selectedItem.itemDescription.toString(),
                        style: GoogleFonts.notoSerifMalayalam(fontSize: 15)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
