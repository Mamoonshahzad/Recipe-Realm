class FoodItemsDataModel {
  String? itemName;
  String? itemDescription;
  String? imageUrl;
  String? ingredients;

  FoodItemsDataModel(
      {this.itemName, this.itemDescription, this.imageUrl, this.ingredients});

  FoodItemsDataModel.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    itemDescription = json['itemDescription'];
    imageUrl = json['imageUrl'];
    ingredients = json['ingredients'];
  }
}
// class FoodItemsDataModel {
//   final String itemName;
//   String? itemDescription;
//   final String imageUrl;
//   bool isFavorite;
//
//   FoodItemsDataModel({
//     required this.itemName,
//     required this.itemDescription,
//     required this.imageUrl,
//     this.isFavorite = false, // Default value is false
//   });
//
//   factory FoodItemsDataModel.fromJson(Map<String, dynamic> json) {
//     return FoodItemsDataModel(
//       itemName: json['itemName'] ?? '',
//       itemDescription: json['itemDescription'] ?? '',
//       imageUrl: json['imageUrl'] ?? '',
//       isFavorite: json['isFavorite'] ?? false,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'itemName': itemName,
//       'itemDescription': itemDescription,
//       'imageUrl': imageUrl,
//       'isFavorite': isFavorite,
//     };
//   }
// }
