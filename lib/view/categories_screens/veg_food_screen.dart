import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_realm/model/food_items_model.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:recipe_realm/widgets/food_item_card.dart';

import '../../utils/app_constants.dart';
import '../details_screen.dart';

class VegFoodScreen extends StatefulWidget {
  const VegFoodScreen({super.key});

  @override
  State<VegFoodScreen> createState() => _VegFoodScreenState();
}

class _VegFoodScreenState extends State<VegFoodScreen> {
  TextEditingController searchController = TextEditingController();
  List<FoodItemsDataModel> foodItems = [];
  List<FoodItemsDataModel> filteredItems = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final jsonData =
        await root_bundle.rootBundle.loadString('jsonfiles/veg_food.json');
    final list = json.decode(jsonData) as List<dynamic>;

    setState(() {
      foodItems = list.map((e) => FoodItemsDataModel.fromJson(e)).toList();
      filteredItems = List.from(foodItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppConstant.appMainColor,
            leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
            centerTitle: true,
            title: Text('Veg Food',
                style: GoogleFonts.notoSerifMalayalam(color: Colors.white))),
        body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(children: [
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: Get.width * .16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: TextFormField(
                        onChanged: (query) {
                          _filterItems(query);
                        },
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.search),
                            hintText: 'search',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: AppConstant.appMainColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: AppConstant.appMainColor))))),
                Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.all(3),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () => navigateToDetailsScreen(
                                  context, filteredItems[index]),
                              child: FoodItemCard(
                                  itemImage:
                                      filteredItems[index].imageUrl.toString(),
                                  itemName: filteredItems[index]
                                      .itemName
                                      .toString()));
                        }))
              ]),
            )));
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = foodItems
          .where((item) =>
              item.itemName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void navigateToDetailsScreen(
      BuildContext context, FoodItemsDataModel selectedItem) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(selectedItem: selectedItem)));
  }
}
