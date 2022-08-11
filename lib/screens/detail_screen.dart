import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);
  static const routeName = 'details';

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final receivedValue = ModalRoute.of(context)!.settings.arguments as QueryDocumentSnapshot;

    return Scaffold(
      appBar: AppBar(title: const Text('Wasteagram'),
      centerTitle: true,),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(DateFormat.yMMMEd().format(receivedValue['date'].toDate())),
            Image.network(receivedValue['imageURL']),
            Row(children: [Text('Latitude: ${receivedValue['latitude']}'), Text('Longitude: ${receivedValue['longitude']}')],),
            Text(receivedValue['quantity'].toString())
          ]
        )
      )
    );
  }
}