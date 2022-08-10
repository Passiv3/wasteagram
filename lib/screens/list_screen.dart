import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/camera_button.dart';
import 'package:wasteagram/exports.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static const routeName = '/';

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
          children: [DatabaseContent(), CameraButton()],) );
      //To-Do create a widget to display list Tiles
      // List-Tiles - date, number representing total number of wasted items recorded
      // Tapping the list tile should cause the detail screen to appear

  }
}
