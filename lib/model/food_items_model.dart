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
