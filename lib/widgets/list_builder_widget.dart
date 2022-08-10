import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        if (snapshot.hasData){
          return Expanded(
            child: SizedBox(
            child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index){
              var post = snapshot.data!.docs[index];
              return ListTile(
                title: Text(DateFormat.yMMMEd().format(post['date'].toDate()))
              );
            },
            )
          )
        );
        } else{
          return Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}