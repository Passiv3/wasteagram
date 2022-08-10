import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/exports.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);
    static const routeName = 'newPost';

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  File? image;
  final picker = ImagePicker();

  void getImage() async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null){
      return;
    }else{
      image = File(pickedFile.path);
    }
    setState(() {});
  }

  @override
  void initState(){
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {

    final receivedValue = image;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: (() => Navigator.pop(context)),),
        title: const Text('New Post'),
        centerTitle: true,),
      body: Center(child: NewPostWidget(image: receivedValue as File),)
      // To-Do:       
   
        // Tapping this should cause List Screen to appear with latest post at top of list

    );
  }
}