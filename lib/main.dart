import 'package:flutter/material.dart';
import 'exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final routes = {
    '/': (context) => const ListScreen(title: 'Wasteagram'),
    'newPost': (context) => const NewPostScreen(),
    'details': (context) => const DetailScreen()
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}
