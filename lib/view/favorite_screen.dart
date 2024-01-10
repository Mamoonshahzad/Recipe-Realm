import 'package:flutter/material.dart';
import '../model/food_items_model.dart';
import '../widgets/food_item_card.dart'; // Import your FoodItemCard file

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  FavoriteScreenState createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  late Set<FoodItemsDataModel> favoriteItems;

  @override
  void initState() {
    super.initState();
    // Initialize the favoriteItems set (you can pass it from the constructor or other methods)
    favoriteItems = {/* Initialize with your favorite items */};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favorite Screen"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Favorite",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            // Display the favorite items in a GridView with 2 columns
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final favoriteItem = favoriteItems.elementAt(index);
                return FoodItemCard(
                  itemImage: favoriteItem.imageUrl.toString(),
                  itemName: favoriteItem.itemName.toString(),
                  isFavorite: true,
                  onFavoritePressed: () {
                    _toggleFavorite(favoriteItem);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFavorite(FoodItemsDataModel item) {
    setState(() {
      if (favoriteItems.contains(item)) {
        favoriteItems.remove(item);
      } else {
        favoriteItems.add(item);
      }
    });
  }
}
