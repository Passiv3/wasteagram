import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  static const routeName = 'details';  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wasteagram'),
      centerTitle: true,),
      //To-do - show post's date, photo, number of wasted items, latitude and longitude recorded
      
    );
  }
}