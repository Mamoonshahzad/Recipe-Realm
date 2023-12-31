import 'package:flutter/material.dart';
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
        title: Text(selectedItem.itemName as String,
            style: GoogleFonts.poppins(color: Colors.white)),
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
                  child: Image.asset(
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
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppConstant.appMainColor),
                ),
              ),
              const Divider(height: 1),
              Text(selectedItem.itemDescription.toString(),
                  style: GoogleFonts.poppins())
            ],
          ),
        ),
      ),
    );
  }
}
