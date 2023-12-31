import 'package:flutter/material.dart';
import 'package:recipe_realm/utils/app_constants.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key, required String itemImage});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite Screen'),
      ),
    );
  }
}
