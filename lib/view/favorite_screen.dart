import 'package:flutter/material.dart';
import 'package:recipe_realm/widgets/food_item_card.dart';

import '../model/food_items_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<FoodItemsDataModel> favoriteItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: favoriteItems.isNotEmpty
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                return FoodItemCard(
                  itemImage: favoriteItems[index].imageUrl.toString(),
                  itemName: favoriteItems[index].itemName.toString(),
                  onFavorite: (isFavorite) {
                    // Handle favorite action if needed in the FavoriteScreen
                  },
                );
              },
            )
          : const Center(
              child: Text('No favorites yet.'),
            ),
    );
  }
}
