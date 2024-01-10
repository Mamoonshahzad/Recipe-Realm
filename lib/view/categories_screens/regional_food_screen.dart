// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:recipe_realm/model/food_items_model.dart';
// import 'package:flutter/services.dart' as root_bundle;
// import 'package:recipe_realm/utils/app_constants.dart';
// import 'package:recipe_realm/widgets/food_item_card.dart';
// import '../details_screen.dart';
//
// class RegionalFoodScreen extends StatefulWidget {
//   const RegionalFoodScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RegionalFoodScreen> createState() => _RegionalFoodScreenState();
// }
//
// class _RegionalFoodScreenState extends State<RegionalFoodScreen> {
//   List<FoodItemsDataModel> foodItems = [];
//   List<FoodItemsDataModel> filteredItems = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }
//
//   Future<void> _loadData() async {
//     final jsondata =
//         await root_bundle.rootBundle.loadString('jsonfiles/regional_food.json');
//     final list = json.decode(jsondata) as List<dynamic>;
//
//     setState(() {
//       foodItems = list.map((e) => FoodItemsDataModel.fromJson(e)).toList();
//       filteredItems = List.from(foodItems);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppConstant.appMainColor,
//           centerTitle: true,
//           leading: GestureDetector(
//             onTap: () => Get.back(),
//             child: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           ),
//           title: Text('Regional Food',
//               style: GoogleFonts.notoSerifMalayalam(color: Colors.white)),
//         ),
//         body: GestureDetector(
//             onTap: () {
//               FocusScopeNode currentFocus = FocusScope.of(context);
//               if (!currentFocus.hasPrimaryFocus) {
//                 currentFocus.unfocus();
//               }
//             },
//             child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(children: [
//                   Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 5, vertical: 5),
//                       height: Get.width * .16,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.white,
//                         boxShadow: const [
//                           BoxShadow(
//                               color: AppConstant.appMainColor, blurRadius: 3),
//                         ],
//                       ),
//                       child: TextFormField(
//                           onChanged: (query) {
//                             _filterItems(query);
//                           },
//                           decoration: InputDecoration(
//                               suffixIcon: const Icon(Icons.search),
//                               hintText: 'search',
//                               fillColor: Colors.white,
//                               filled: true,
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                                 borderSide: const BorderSide(
//                                     color: AppConstant.appMainColor),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                   borderSide: const BorderSide(
//                                       color: AppConstant.appMainColor))))),
//                   Expanded(
//                       child: FutureBuilder(
//                           future: ReadJsonData(),
//                           builder: (context, data) {
//                             if (data.hasError) {
//                               return Center(child: Text('${data.error}'));
//                             } else if (data.hasData) {
//                               return GridView.builder(
//                                   gridDelegate:
//                                       const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2,
//                                   ),
//                                   itemCount: filteredItems.length,
//                                   itemBuilder: (context, index) {
//                                     return GestureDetector(
//                                         onTap: () => navigateToDetailsScreen(
//                                             context, filteredItems[index]),
//                                         child: Padding(
//                                             padding: const EdgeInsets.all(8),
//                                             child: FoodItemCard(
//                                                 itemImage: filteredItems[index]
//                                                     .imageUrl
//                                                     .toString(),
//                                                 itemName: filteredItems[index]
//                                                     .itemName
//                                                     .toString())));
//                                   });
//                             } else {
//                               return const Center(
//                                   child: CircularProgressIndicator());
//                             }
//                           }))
//                 ]))));
//   }
//
//   Future<List<FoodItemsDataModel>> ReadJsonData() async {
//     final jsondata =
//         await root_bundle.rootBundle.loadString('jsonfiles/regional_food.json');
//     final list = json.decode(jsondata) as List<dynamic>;
//
//     return list.map((e) => FoodItemsDataModel.fromJson(e)).toList();
//   }
//
//   void navigateToDetailsScreen(
//       BuildContext context, FoodItemsDataModel selectedItem) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => DetailsScreen(selectedItem: selectedItem),
//       ),
//     );
//   }
//
//   void _filterItems(String query) {
//     setState(() {
//       filteredItems = foodItems
//           .where((item) =>
//               item.itemName!.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }
// }
