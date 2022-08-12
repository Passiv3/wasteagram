import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wasteagram/models/post_model.dart';

class SubmitForm extends StatefulWidget {
  final FoodWastePost currentPost;
  final File image;
  const SubmitForm({Key? key, required this.currentPost, required this.image}) : super(key: key);

  @override
  State<SubmitForm> createState() => _SubmitFormState();
}

class _SubmitFormState extends State<SubmitForm> {
  final _formKey = GlobalKey<FormState>();

  Future uploadToServer() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("image-${DateTime.now().toString()}.jpg");
    UploadTask uploadTask = ref.putFile(widget.image);
    await uploadTask;
    final url = await ref.getDownloadURL();
    widget.currentPost.imageURL = url.toString();
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
          return const CircularProgressIndicator();
        }
      },
    );
  }

  SizedBox createTextForm(){
    return SizedBox(
      width: 250,
      child: Semantics(
        button: false,
        textField: true,
        hint: 'Enter Quantity of Waste here',
        child: TextFormField(
          onSaved: (value){
          widget.currentPost.quantity = int.parse(value!);
          },
          style: const TextStyle(fontSize: 32),
          keyboardType: TextInputType.number,
          validator: (value) {
            if(value == null || value.isEmpty){
              return 'Please enter a value';
            }
            return null;
          },
          )
      )
    );
  }

  Semantics createButton(){
    return Semantics(
      label:'Button that says submit',
      button: true,
      enabled: true,
      onTapHint: 'Upload data to Firebase Database',
      child: ElevatedButton(
      onPressed: (){if (_formKey.currentState!.validate()){
        _formKey.currentState?.save();
          FirebaseFirestore.instance.collection('posts').add(
            widget.currentPost.returnAll()
          );
        Navigator.pop(context);
        return;
        // Upload picture to server here
        }
      }, 
      child: const Text('Submit'),
      )
    );
  }
}