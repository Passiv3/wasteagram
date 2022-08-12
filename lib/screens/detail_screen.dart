// ignore_for_file: unnecessary_brace_in_string_interps

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
    Widget createRow(coordinate){
      return Expanded(child: Center(child: Text('${coordinate}: ${receivedValue['${coordinate}']}', style: Theme.of(context).textTheme.subtitle1)));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Wasteagram'),
      centerTitle: true,),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(DateFormat.yMMMEd().format(receivedValue['date'].toDate()), style: Theme.of(context).textTheme.headline4),
            SizedBox(height:400, width: 350, child: Image.network(receivedValue['imageURL'])),
            Row(children: [createRow('latitude'), createRow('longitude')],),
            Text(receivedValue['quantity'].toString(), style: Theme.of(context).textTheme.headline5,)
          ]
        )
      )
    );
  }
}