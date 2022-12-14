import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final routes = {
    ListScreen.routeName: (context) => const ListScreen(title: 'Wasteagram'),
    NewPostScreen.routeName: (context) => const NewPostScreen(),
    DetailScreen.routeName: (context) => const DetailScreen()
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
