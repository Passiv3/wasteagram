class FoodWastePost {
  DateTime time = DateTime.now();
  String longitude = '0';
  String latitude = '0';
  int quantity = 0;
  String imageURL = 'no Image';

  fromMap(Map someMap){
    time = someMap['date'];
    longitude = someMap['longitude'];
    latitude = someMap['latitude'];
    quantity = someMap['quantity'];
    imageURL = someMap['imageURL'];
  }

  Map<String, dynamic> returnAll(){
    return {
      'date': time,
      'latitude': latitude,
      'longitude': longitude,
      'quantity': quantity,
      'imageURL': imageURL,
    };
  }
}