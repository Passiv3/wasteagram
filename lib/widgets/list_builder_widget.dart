import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/exports.dart';

class DatabaseContent extends StatefulWidget {
  const DatabaseContent({Key? key}) : super(key: key);

  @override
  State<DatabaseContent> createState() => _DatabaseContentState();
}

class _DatabaseContentState extends State<DatabaseContent> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot){
        if (snapshot.hasData && snapshot.data!.docs != null && snapshot.data!.docs.length>0){
          return Expanded(
            child: SizedBox(
            child: Semantics(
              button: true,
              enabled: true,
              label: 'Button displaying Date of post',
              onTapHint: 'Tap to expand details',
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                  var post = snapshot.data!.docs[index];
                  return ListTile(
                    onTap:() => Navigator.of(context).pushNamed(DetailScreen.routeName, arguments: post),
                    title: Text(DateFormat.yMMMEd().format(post['date'].toDate(),)),
                    trailing: Text(post['quantity'].toString())
                  );
                },
                )
              )
            )
        );
        } else{
          return const Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}