class FoodItemsDataModel {
  String? itemName;
  String? itemDescription;
  String? imageUrl;

  FoodItemsDataModel({this.itemName, this.itemDescription, this.imageUrl});

  FoodItemsDataModel.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    itemDescription = json['itemDescription'];
    imageUrl = json['imageUrl'];
  }
}
