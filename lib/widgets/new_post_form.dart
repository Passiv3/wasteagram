import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wasteagram/models/post_model.dart';

class SubmitForm extends StatefulWidget {
  final FoodWastePost currentPost;
  const SubmitForm({Key? key, required this.currentPost}) : super(key: key);

  @override
  State<SubmitForm> createState() => _SubmitFormState();
}

class _SubmitFormState extends State<SubmitForm> {
  final _formKey = GlobalKey<FormState>();

  Future uploadToServer() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("image-" + DateTime.now().toString()+'.jpg');
    UploadTask uploadTask = ref.putFile(widget.currentPost.image);
    await uploadTask;
    final url = await ref.getDownloadURL();
    widget.currentPost.imageURL = ref.toString();
  }
  @override
  void initState() {
    super.initState();
    uploadToServer();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Form(
            key: _formKey,
            child: Column(
              children: [createTextForm(), createButton()]
            )
          );
        } else{
          return CircularProgressIndicator();
        }
      },
    );
  }

  SizedBox createTextForm(){
    return SizedBox(
      width: 250,
      child: TextFormField(
        onSaved: (value){
          widget.currentPost.quantity = int.parse(value!);
        },
        style: TextStyle(fontSize: 32),
        keyboardType: TextInputType.number,
        validator: (value) {
          if(value == null || value.isEmpty){
            return 'Please enter a value';
          }
          return null;
        },
    )
    );;
  }

  ElevatedButton createButton(){
    return ElevatedButton(
      onPressed: (){if (_formKey.currentState!.validate()){
        _formKey.currentState?.save();
          FirebaseFirestore.instance.collection('posts').add({
            'date': widget.currentPost.time,
            'latitude': widget.currentPost.latitude,
            'longitude': widget.currentPost.longitude,
            'quantity': widget.currentPost.quantity,
            'imageURL': widget.currentPost.imageURL
          });
        Navigator.pop(context);
        return;
        // Upload picture to server here
        }
      }, 
      child: const Text('Submit'),);
  }
}