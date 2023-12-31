import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_realm/utils/app_constants.dart';
import 'package:recipe_realm/view/categories_screens/desert_food.dart';
import 'package:recipe_realm/view/categories_screens/fast_food.dart';
import 'package:recipe_realm/view/categories_screens/regional_food_screen.dart';
import 'package:recipe_realm/view/categories_screens/special_diet_screen.dart';
import 'package:recipe_realm/view/categories_screens/veg_food_screen.dart';
import 'package:recipe_realm/widgets/food_item_card.dart';
import 'package:recipe_realm/widgets/home_screen_scrollview.dart';
import 'package:recipe_realm/widgets/search_bar.dart';

import '../widgets/home_screen_grid.dart';
import 'categories_screens/barbecue.dart';
import 'categories_screens/main_course_screen.dart';
import 'categories_screens/sea_food_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List choice = [
  //   {'title': 'Fast Food', 'image': 'assets/images/home_screen/fast food.png'},
  //   {'title': 'Barbecue', 'image': 'assets/images/home_screen/barbecue.png'},
  //   {'title': 'Desert', 'image': 'assets/images/home_screen/desert.png'},
  //   {'title': 'Sea Food', 'image': 'assets/images/home_screen/fish.png'},
  //   {'title': 'Diets', 'image': 'assets/images/home_screen/special diet.png'},
  //   {'title': 'Courses', 'image': 'assets/images/home_screen/main-course.png'},
  //   {
  //     'title': 'Regional',
  //     'image': 'assets/images/home_screen/regional food.png'
  //   },
  //   {'title': 'Veg Food', 'image': 'assets/images/home_screen/veg food.png'}
  // ];
  @override
  Widget build(BuildContext context) {
    var custHeight = SizedBox(height: Get.height * .02);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppConstant.appMainColor,
          title: Text('Home Screen',
              style: GoogleFonts.poppins(color: Colors.white)),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.white),
              onPressed: () {},
            ),
          ],
          leading: Builder(
              builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ))),
      drawer: Drawer(
        width: Get.width * .7,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppConstant.appMainColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: Get.width * .25,
                      height: Get.width * .25,
                      child: Image.asset(
                          'assets/images/home_screen/welcome_drink.png')),
                  Text('Welcome Foodie',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.favorite),
                  Text('Favorite Items', style: GoogleFonts.poppins())
                ],
              ),
              onTap: () {},
            ),
            const Divider(height: 1, color: Colors.grey),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star),
                  Text('Popular Items', style: GoogleFonts.poppins())
                ],
              ),
              onTap: () {},
            ),
            const Divider(height: 1, color: Colors.grey),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.recommend),
                  Text('Recommended Items', style: GoogleFonts.poppins())
                ],
              ),
              onTap: () {},
            ),
            const Divider(height: 1, color: Colors.grey),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Common Dishes',
                        style: GoogleFonts.poppins(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CommonDishesWidget(
                          scrollImage:
                              'assets/images/home_screen/white curry.jpg',
                          scrollText: 'Very Delicious\nWhite Curry'),
                      SizedBox(width: Get.width * .02),
                      CommonDishesWidget(
                          scrollImage:
                              'assets/images/home_screen/chicken curry.jpg',
                          scrollText: 'Mouth Watering\nChicken Curry'),
                      SizedBox(width: Get.width * .02),
                      CommonDishesWidget(
                          scrollImage: 'assets/images/home_screen/rice.jpg',
                          scrollText: 'The Famous\nKabuli Pulao')
                    ],
                  ),
                ),
                custHeight,
                const ReUsableSearchBar(),
                custHeight,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Categories',
                        style: GoogleFonts.poppins(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                custHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeScreenGrid(
                        onTap: () => Get.to(const FastFoodScreen()),
                        gridText: 'Fast Food',
                        gridIcon: 'assets/images/home_screen/fast food.png'),
                    HomeScreenGrid(
                        onTap: () => Get.to(const BarbecueScreen()),
                        gridText: 'Barbecue',
                        gridIcon: 'assets/images/home_screen/barbecue.png'),
                    HomeScreenGrid(
                        onTap: () => Get.to(const DesertFoodScreen()),
                        gridText: 'Deserts',
                        gridIcon: 'assets/images/home_screen/desert.png'),
                    HomeScreenGrid(
                        onTap: () => Get.to(const SeaFoodScreen()),
                        gridText: 'Sea Food',
                        gridIcon: 'assets/images/home_screen/fish.png'),
                  ],
                ),
                custHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeScreenGrid(
                        onTap: () => Get.to(const MainCoursesScreen()),
                        gridText: 'Courses',
                        gridIcon: 'assets/images/home_screen/main-course.png'),
                    HomeScreenGrid(
                        onTap: () => Get.to(const RegionalFoodScreen()),
                        gridText: 'Regional',
                        gridIcon:
                            'assets/images/home_screen/regional food.png'),
                    HomeScreenGrid(
                        onTap: () => Get.to(const SpecialDietsScreen()),
                        gridText: 'Diets',
                        gridIcon: 'assets/images/home_screen/special diet.png'),
                    HomeScreenGrid(
                        onTap: () => Get.to(const VegFoodScreen()),
                        gridText: 'Veg Food',
                        gridIcon: 'assets/images/home_screen/veg food.png'),
                  ],
                ),
                custHeight,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Recommended Items',
                        style: GoogleFonts.poppins(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const FoodItemCard(
                            itemImage: 'assets/images/fast_food/Pizza.jpg',
                            itemName: "Pizza"),
                        SizedBox(width: Get.width * .02),
                        const FoodItemCard(
                            itemImage:
                                'assets/images/barbecue/grilled chicken.jpg',
                            itemName: "Grilled Chicken"),
                        SizedBox(width: Get.width * .02),
                        const FoodItemCard(
                            itemImage: 'assets/images/deserts/apple pie.jpg',
                            itemName: "Apple Pie"),
                        SizedBox(width: Get.width * .02),
                        const FoodItemCard(
                            itemImage: 'assets/images/regional/paye.jpg',
                            itemName: "Paye"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
