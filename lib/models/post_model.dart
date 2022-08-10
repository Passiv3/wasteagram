import 'dart:io';
class FoodWastePost {
  File image;
  final DateTime time = DateTime.now();
  String longitude = '0';
  String latitude = '0';
  int quantity = 0;
  String imageURL = 'no Image';

  FoodWastePost(this.image);

  Map returnAll(){
    return {
      'date': time,
      'latitude': latitude,
      'longitude': longitude,
      'quantity': quantity,
      'imageURL': imageURL,
    };
  }
}