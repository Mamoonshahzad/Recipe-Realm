import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_realm/model/food_items_model.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:recipe_realm/utils/app_constants.dart';
import 'package:recipe_realm/widgets/food_item_card.dart';
import 'package:recipe_realm/widgets/search_bar.dart';

import '../../widgets/details_screen.dart';

class DesertFoodScreen extends StatefulWidget {
  const DesertFoodScreen({super.key});

  @override
  State<DesertFoodScreen> createState() => _DesertFoodScreenState();
}

class _DesertFoodScreenState extends State<DesertFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        centerTitle: true,
        title: Text('Desert Food',
            style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(5),
              child: ReUsableSearchBar(),
            ),
            Expanded(
              child: Container(
                width: Get.width,
                height: Get.height,
                child: FutureBuilder(
                  future: ReadJsonData(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Center(child: Text('${data.error}'));
                    } else if (data.hasData) {
                      var foodItems = data.data as List<FoodItemsDataModel>;
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: foodItems.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => navigateToDetailsScreen(
                                  context, foodItems[index]),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: FoodItemCard(
                                    itemImage:
                                        foodItems[index].imageUrl.toString(),
                                    itemName:
                                        foodItems[index].itemName.toString()),
                              ),
                            );
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<FoodItemsDataModel>> ReadJsonData() async {
    final jsondata =
        await root_bundle.rootBundle.loadString('jsonfiles/deserts.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => FoodItemsDataModel.fromJson(e)).toList();
  }

  void navigateToDetailsScreen(
      BuildContext context, FoodItemsDataModel selectedItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(selectedItem: selectedItem),
      ),
    );
  }
}
