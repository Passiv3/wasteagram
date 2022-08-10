class FoodWastePost {
  final String imageURL;
  final DateTime time;
  final String longitude;
  final String latitude;
  final int quantity;


  FoodWastePost(this.imageURL, this.time, this.latitude, this.longitude, this.quantity);

  List returnAll(){
    return [imageURL, time, latitude, longitude, quantity];
  }
}