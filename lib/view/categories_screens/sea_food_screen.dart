import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_realm/model/food_items_model.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:recipe_realm/widgets/food_item_card.dart';

import '../../utils/app_constants.dart';
import '../details_screen.dart';
import '../../widgets/search_bar.dart';

class SeaFoodScreen extends StatefulWidget {
  const SeaFoodScreen({Key? key}) : super(key: key);

  @override
  State<SeaFoodScreen> createState() => _SeaFoodScreenState();
}

class _SeaFoodScreenState extends State<SeaFoodScreen> {
  TextEditingController searchController = TextEditingController();
  List<FoodItemsDataModel> foodItems = [];
  List<FoodItemsDataModel> filteredItems = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final jsondata =
        await root_bundle.rootBundle.loadString('jsonfiles/seafood.json');
    final list = json.decode(jsondata) as List<dynamic>;

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
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          title: Text('Sea Food',
              style: GoogleFonts.notoSerifMalayalam(color: Colors.white)),
        ),
        body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Container(
                    height: Get.width * .16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.red, blurRadius: 6),
                      ],
                    ),
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
                          borderSide: BorderSide(color: Colors.red.shade500),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.tealAccent),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                          width: Get.width,
                          height: Get.height,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: filteredItems.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () => navigateToDetailsScreen(
                                          context,
                                          filteredItems[index],
                                        ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: FoodItemCard(
                                            itemImage: filteredItems[index]
                                                .imageUrl
                                                .toString(),
                                            itemName: filteredItems[index]
                                                .itemName
                                                .toString())));
                              })))
                ]))));
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
        builder: (context) => DetailsScreen(selectedItem: selectedItem),
      ),
    );
  }
}
