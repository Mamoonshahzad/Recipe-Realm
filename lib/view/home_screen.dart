import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_realm/utils/app_constants.dart';
import 'package:recipe_realm/view/categories_screens/fast_food.dart';
import 'package:recipe_realm/view/categories_screens/main_course_screen.dart';
import 'package:recipe_realm/view/categories_screens/regional_food_screen.dart';
import 'package:recipe_realm/view/categories_screens/sea_food_screen.dart';
import 'package:recipe_realm/view/categories_screens/special_diet_screen.dart';
import 'package:recipe_realm/view/categories_screens/veg_food_screen.dart';
import 'package:recipe_realm/widgets/food_item_card.dart';
import 'package:recipe_realm/widgets/home_screen_scrollview.dart';

import '../model/food_items_model.dart';
import '../widgets/home_screen_grid.dart';
import 'categories_screens/barbecue.dart';
import 'categories_screens/desert_food.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String pizzaIngredients =
        "\nFor the Pizza Dough:\n2 1/4 teaspoons (1 packet) active dry yeast\n1 teaspoon sugar\n1 cup warm water (110°F/43°C)\n3 cups all-purpose flour\n1 teaspoon salt\n1 tablespoon olive oil\n\nFor the Pizza Sauce:\n\n1 can (14 ounces) crushed tomatoes\n2 cloves garlic, minced\n1 teaspoon dried oregano\n1 teaspoon dried basil\nSalt and pepper to taste\nFor Toppings:\nShredded mozzarella cheese\nAdditional toppings of your choice (pepperoni, sliced bell peppers, onions, mushrooms, olives, etc.)";
    String pizzaDesc =
        '\nFor the Pizza Dough:\n Activate the Yeast:\nIn a small bowl, combine the warm water, sugar, and active dry yeast. Let it sit for about 5-10 minutes until the mixture becomes frothy.\n\nMix the Dough:\nIn a large bowl, combine the flour and salt. Make a well in the center and add the yeast mixture and olive oil. Mix until a dough forms.\n\nKnead the Dough:\nTransfer the dough to a floured surface and knead for about 5-7 minutes until it becomes smooth and elastic.\n\nFirst Rise:\nPlace the dough in a lightly oiled bowl, cover it with a damp cloth, and let it rise in a warm place for 1-2 hours, or until it doubles in size.\n\nFor the Pizza Sauce:\nPrepare the Sauce:\nIn a small saucepan, combine the crushed tomatoes, minced garlic, oregano, basil, salt, and pepper. Simmer over low heat for about 15-20 minutes, stirring occasionally.\n\nAssembling the Pizza:\nPreheat the Oven:\nPreheat your oven to the highest temperature it can go (usually around 475°F/245°C or higher).\n\nRoll Out the Dough:\nPunch down the risen dough and roll it out on a floured surface to your desired thickness.\n\nPrepare the Pizza:\nTransfer the rolled-out dough to a pizza stone or baking sheet.\nSpread a thin layer of the pizza sauce over the dough, leaving a border around the edges.\nSprinkle a generous amount of shredded mozzarella cheese over the sauce.\nAdd your favorite toppings.\n\nBake the Pizza:\nBake in the preheated oven for 12-15 minutes or until the crust is golden and the cheese is bubbly and slightly browned.\n\nServe:\nRemove the pizza from the oven, let it cool for a few minutes, then slice and serve.';

    String grilledChickenIngredients =
        "\n4 boneless, skinless chicken breasts\n1/4 cup olive oil\n3 tablespoons soy sauce\n2 tablespoons lemon juice\n2 teaspoons honey\n2 teaspoons Dijon mustard\n2 cloves garlic, minced\n1 teaspoon dried oregano\n1 teaspoon dried thyme\nSalt and pepper to taste\n\nOptional: Fresh herbs for garnish (parsley, cilantro, or thyme)";
    String grilledChickenDesc =
        "\nPrepare the Marinade:\nIn a bowl, whisk together the olive oil, soy sauce, lemon juice, honey, Dijon mustard, minced garlic, dried oregano, and dried thyme. Season with salt and pepper to taste.\n\nMarinate the Chicken:\nPlace the chicken breasts in a resealable plastic bag or shallow dish.\nPour the marinade over the chicken, ensuring that each piece is well-coated.\nSeal the bag or cover the dish and refrigerate for at least 30 minutes to allow the flavors to infuse. For more flavor, you can marinate for up to 24 hours.\n\nPreheat the Grill:\nPreheat your grill to medium-high heat.\n\nGrill the Chicken:\nRemove the chicken from the marinade and let any excess drip off.\nPlace the chicken on the preheated grill and cook for about 6-8 minutes per side, or until the internal temperature reaches 165°F (74°C) and the chicken is no longer pink in the center.\nCooking times may vary depending on the thickness of the chicken breasts.\n\nRest and Garnish:\nOnce the chicken is cooked through, remove it from the grill and let it rest for a few minutes. This allows the juices to redistribute.\nOptionally, garnish with fresh herbs like parsley, cilantro, or thyme before serving.\n\nServe:\nServe the grilled chicken with your favorite sides, such as a salad, grilled vegetables, or rice.";

    String applePieIngredients =
        "\nFor the Pie Crust:\n2 1/2 cups all-purpose flour\n1 cup unsalted butter, chilled and cut into small cubes\n1 teaspoon salt\n1 teaspoon granulated sugar\n1/4 to 1/2 cup ice water\n\nFor the Apple Filling:\n\n6 cups peeled, cored, and sliced apples (a mix of sweet and tart varieties like Granny Smith)\n3/4 cup granulated sugar\n1/4 cup brown sugar\n2 tablespoons all-purpose flour\n1 teaspoon ground cinnamon\n1/4 teaspoon ground nutmeg\n1 tablespoon lemon juice\n1 teaspoon vanilla extract\nFor Assembly:\n1 tablespoon unsalted butter (for dotting the filling)\n1 egg (for egg wash)\n1 tablespoon milk or cream (for egg wash)\n\nAdditional sugar (for sprinkling on top)";
    String applePieDesc =
        "\nFor the Pie Crust:\nPrepare the Dough:\nIn a food processor, combine the flour, salt, and sugar.\nAdd the chilled butter cubes and pulse until the mixture resembles coarse crumbs.\nGradually add ice water, 1 tablespoon at a time, and pulse until the dough comes together. Be careful not to overmix.\nDivide the dough into two equal portions, shape into disks, wrap in plastic wrap, and refrigerate for at least 1 hour.\n\nFor the Apple Filling:\n\nPrepare the Apples:\nPeel, core, and slice the apples.\nToss the apple slices with lemon juice to prevent browning.\n\nMix the Filling:\nIn a large bowl, combine the sliced apples, granulated sugar, brown sugar, flour, cinnamon, nutmeg, and vanilla extract. Toss until the apples are evenly coated.\n\nFor Assembly:\nPreheat the Oven:\n\nPreheat your oven to 425°F (220°C).\n\nRoll Out the Dough:\nOn a lightly floured surface, roll out one disk of pie dough into a circle to fit your pie dish.\n\nLine the Pie Dish:\nPlace the rolled-out dough into a 9-inch pie dish, leaving any excess hanging over the edges.\n\nAdd the Apple Filling:\nSpoon the prepared apple filling into the pie crust, leveling it with a spatula.\n\nDot with Butter:\nCut 1 tablespoon of butter into small pieces and dot the top of the apple filling.\n\nRoll Out the Second Dough:\nRoll out the second disk of pie dough and place it over the apple filling.\n\nSeal and Crimp the Edges:\nTrim excess dough, leaving a slight overhang. Fold the edges of the top and bottom crusts together and crimp to seal.\n\nMake Vents:\nCut a few slits in the top crust to allow steam to escape.\n\nEgg Wash:\nIn a small bowl, beat the egg with milk or cream to create an egg wash. Brush the top crust with the egg wash.\n\nSprinkle Sugar:\nSprinkle a little sugar over the top crust for a golden finish.\n\nBake:\nPlace the pie on a baking sheet and bake in the preheated oven for 45-55 minutes, or until the crust is golden brown, and the filling is bubbly.\n\nCool:\nAllow the pie to cool for at least 2 hours before slicing. This helps the filling set.";

    String payeIngredients =
        "\n4 to 6 pieces of cow or goat trotters (cleaned and split)\n1 cup wheat grains (soaked overnight)\n2 large onions (finely sliced)\n4 tomatoes (chopped)\n1/2 cup yogurt\n1/2 cup cooking oil or ghee (clarified butter)\n1 tablespoon ginger paste\n1 tablespoon garlic paste\n1 tablespoon cumin powder\n1 tablespoon coriander powder\n1 teaspoon turmeric powder\n1 teaspoon red chili powder (adjust to taste)\nSalt to taste\n\nFresh coriander leaves (for garnish)\nFresh ginger slices (for garnish)\nGaram masala (whole spices) for baghar/tempering (optional)";
    String payeDesc =
        "\nClean and Soak the Trotters:\nClean the trotters thoroughly and soak them in water for a few hours or overnight to remove any excess blood.\n\nBoil Trotters and Wheat:\nIn a large pot, add the trotters and soaked wheat grains.\nAdd enough water to cover the trotters and wheat.\nBring it to a boil, then reduce the heat to low and simmer until the trotters and wheat are tender. This may take several hours, and you can use a pressure cooker to expedite the process.\n\nPrepare the Masala:\nIn a separate pan, heat oil or ghee over medium heat.\nAdd sliced onions and sauté until golden brown.\nAdd ginger paste and garlic paste, and cook until the raw smell disappears.\nAdd chopped tomatoes and cook until they are soft and the oil starts to separate.\nAdd yogurt, cumin powder, coriander powder, turmeric powder, red chili powder, and salt. Cook the masala until the oil separates from the spices.\n\nCombine Trotters, Wheat, and Masala:\nOnce the trotters and wheat are tender, add the prepared masala to the pot.\nMix everything well and let it simmer on low heat for at least another 30 minutes, allowing the flavors to meld.\n\nPrepare Baghar (Optional):\nIn a small pan, heat a few tablespoons of oil or ghee.\nAdd garam masala (whole spices) and let them sizzle for a few seconds.\nPour this baghar over the simmering Siri Paye for added flavor.\n\nServe:\nGarnish the Siri Paye with fresh coriander leaves and ginger slices.\nServe hot with naan or crusty bread.";
    var custHeight = SizedBox(height: Get.height * .02);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppConstant.appMainColor,
          title: Text('Home Screen',
              style: GoogleFonts.notoSerifMalayalam(color: Colors.white)),
          leading: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        ),
        // leading: Builder(
        //     builder: (context) => IconButton(
        //           icon: const Icon(Icons.menu, color: Colors.white),
        //           onPressed: () {
        //             Scaffold.of(context).openDrawer();
        //           },
        //         ))),
        // drawer: Drawer(
        //   width: Get.width * .7,
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: <Widget>[
        //       DrawerHeader(
        //         decoration: const BoxDecoration(
        //           color: AppConstant.appMainColor,
        //         ),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Container(
        //                 width: Get.width * .25,
        //                 height: Get.width * .25,
        //                 child: Image.asset(
        //                     'assets/images/home_screen/welcome_drink.png')),
        //             Text('Welcome Foodie',
        //                 style: GoogleFonts.notoSerifMalayalam(
        //                     color: Colors.white,
        //                     fontSize: 19,
        //                     fontWeight: FontWeight.bold)),
        //           ],
        //         ),
        //       ),
        //       ListTile(
        //         title: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             const Icon(Icons.favorite),
        //             Text('Favorite Items',
        //                 style: GoogleFonts.notoSerifMalayalam())
        //           ],
        //         ),
        //         onTap: () {},
        //       ),
        //       const Divider(height: 1, color: Colors.grey),
        //       ListTile(
        //         title: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             const Icon(Icons.star),
        //             Text('Popular Items',
        //                 style: GoogleFonts.notoSerifMalayalam())
        //           ],
        //         ),
        //         onTap: () {},
        //       ),
        //       const Divider(height: 1, color: Colors.grey),
        //       ListTile(
        //         title: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             const Icon(Icons.recommend),
        //             Text('Recommended Items',
        //                 style: GoogleFonts.notoSerifMalayalam())
        //           ],
        //         ),
        //         onTap: () {},
        //       ),
        //       const Divider(height: 1, color: Colors.grey),
        //     ],
        //   ),
        // ),
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
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Common Dishes',
                                      style: GoogleFonts.notoSerifMalayalam(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)))),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                CommonDishesWidget(
                                    scrollImage:
                                        'assets/images/home_screen/white curry.jpg',
                                    scrollText: 'Very Delicious\nWhite Curry'),
                                SizedBox(width: Get.width * .02),
                                CommonDishesWidget(
                                    scrollImage:
                                        'assets/images/home_screen/chicken curry.jpg',
                                    scrollText:
                                        'Mouth Watering\nChicken Curry'),
                                SizedBox(width: Get.width * .02),
                                CommonDishesWidget(
                                    scrollImage:
                                        'assets/images/home_screen/rice.jpg',
                                    scrollText: 'The Famous\nKabuli Pulao')
                              ])),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Categories',
                                      style: GoogleFonts.notoSerifMalayalam(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)))),
                          custHeight,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomeScreenGrid(
                                  onTap: () => Get.to(const FastFoodScreen()),
                                  gridText: 'Fast Food',
                                  gridIcon:
                                      'assets/images/home_screen/fast food.png'),
                              HomeScreenGrid(
                                  onTap: () => Get.to(const BarbecueScreen()),
                                  gridText: 'Barbecue',
                                  gridIcon:
                                      'assets/images/home_screen/barbecue.png'),
                              HomeScreenGrid(
                                  onTap: () => Get.to(const DesertFoodScreen()),
                                  gridText: 'Deserts',
                                  gridIcon:
                                      'assets/images/home_screen/desert.png'),
                              HomeScreenGrid(
                                  onTap: () => Get.to(const SeaFoodScreen()),
                                  gridText: 'Sea Food',
                                  gridIcon:
                                      'assets/images/home_screen/fish.png'),
                            ],
                          ),
                          custHeight,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomeScreenGrid(
                                  onTap: () =>
                                      Get.to(const MainCoursesScreen()),
                                  gridText: 'Courses',
                                  gridIcon:
                                      'assets/images/home_screen/main-course.png'),
                              HomeScreenGrid(
                                  onTap: () =>
                                      Get.to(const RegionalFoodScreen()),
                                  gridText: 'Regional',
                                  gridIcon:
                                      'assets/images/home_screen/regional food.png'),
                              HomeScreenGrid(
                                  onTap: () =>
                                      Get.to(const SpecialDietsScreen()),
                                  gridText: 'Diets',
                                  gridIcon:
                                      'assets/images/home_screen/special diet.png'),
                              HomeScreenGrid(
                                  onTap: () => Get.to(const VegFoodScreen()),
                                  gridText: 'Veg Food',
                                  gridIcon:
                                      'assets/images/home_screen/veg food.png'),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Recommended Items',
                                    style: GoogleFonts.notoSerifMalayalam(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    GestureDetector(
                                      onTap: () => navigateToDetailsScreen(
                                        context,
                                        FoodItemsDataModel(
                                            itemName: "Pizza",
                                            imageUrl:
                                                'assets/images/fast_food/Pizza.jpg',
                                            itemDescription: pizzaDesc,
                                            ingredients: pizzaIngredients),
                                      ),
                                      child: const FoodItemCard(
                                          itemImage:
                                              'assets/images/fast_food/Pizza.jpg',
                                          itemName: "Pizza"),
                                    ),
                                    SizedBox(width: Get.width * .04),
                                    GestureDetector(
                                      onTap: () => navigateToDetailsScreen(
                                          context,
                                          FoodItemsDataModel(
                                              itemName: "Grilled Chicken",
                                              imageUrl:
                                                  'assets/images/barbecue/grilled chicken.jpg',
                                              itemDescription:
                                                  grilledChickenDesc,
                                              ingredients:
                                                  grilledChickenIngredients)),
                                      child: const FoodItemCard(
                                          itemImage:
                                              'assets/images/barbecue/grilled chicken.jpg',
                                          itemName: "Grilled Chicken"),
                                    ),
                                    SizedBox(width: Get.width * .04),
                                    GestureDetector(
                                        onTap: () => navigateToDetailsScreen(
                                            context,
                                            FoodItemsDataModel(
                                                itemName: "Apple Pie",
                                                imageUrl:
                                                    'assets/images/deserts/apple pie.jpg',
                                                itemDescription: applePieDesc,
                                                ingredients:
                                                    applePieIngredients)),
                                        child: const FoodItemCard(
                                            itemImage:
                                                'assets/images/deserts/apple pie.jpg',
                                            itemName: "Apple Pie")),
                                    SizedBox(width: Get.width * .04),
                                    GestureDetector(
                                        onTap: () => navigateToDetailsScreen(
                                            context,
                                            FoodItemsDataModel(
                                                itemName: "Paye",
                                                imageUrl:
                                                    'assets/images/regional/paye.jpg',
                                                itemDescription: payeDesc,
                                                ingredients: payeIngredients)),
                                        child: const FoodItemCard(
                                            itemImage:
                                                'assets/images/regional/paye.jpg',
                                            itemName: "Paye"))
                                  ])))
                        ])))));
  }
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
