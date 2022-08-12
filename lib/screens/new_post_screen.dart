import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/exports.dart';
import 'package:wasteagram/models/post_model.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);
    static const routeName = 'newPost';

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  File? image;
  FoodWastePost? currentPost;
  final picker = ImagePicker();

  void getImage() async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null){
      return;
    }else{
      image = File(pickedFile.path);
      // Instantiate a model of currentPost
      currentPost = FoodWastePost();
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
    final picture = image;
    final postModel = currentPost;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: (() => Navigator.pop(context)),),
        title: const Text('New Post'),
        centerTitle: true,),
      body: Center(child: NewPostWidget(currentPost: postModel as FoodWastePost, image: picture as File),)
    );
  }
}