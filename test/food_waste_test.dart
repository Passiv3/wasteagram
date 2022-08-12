import 'dart:math';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:wasteagram/models/post_model.dart';

void main(){
  // Relevant Setup
  final date = DateTime.now();
  const url = 'FAKE';
  const quantity = 1;
  const latitude = '5.5';
  const longitude = '2.0';
  final Map testMap =       
      {
        'date': date,
        'imageURL': url,
        'longitude': longitude,
        'latitude': latitude,
        'quantity': quantity,
      };

  final foodWastePost = FoodWastePost();

  test('Testing fromMap method', (){
    foodWastePost.fromMap(
      testMap
    );
    expect(foodWastePost.time, date);
    expect(foodWastePost.imageURL, url);
    expect(foodWastePost.latitude, latitude);
    expect(foodWastePost.longitude, longitude);
    expect(foodWastePost.quantity, quantity);
    }
  );
  test('Testing returnAll method', (){
    final result = foodWastePost.returnAll();
    expect(result, testMap);
    }
  );
}