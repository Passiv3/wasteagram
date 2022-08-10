import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/new_post_form.dart';
import 'package:location/location.dart';

class NewPostWidget extends StatefulWidget {
  final File image;
  const NewPostWidget({Key? key, required this.image}) : super(key: key);

  @override
  State<NewPostWidget> createState() => _NewPostWidgetState();
}

class _NewPostWidgetState extends State<NewPostWidget> {
  LocationData? locationData;
  var locationService = Location();

  @override
  void initState(){
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    if (widget.image == null){
      return const Center(child: CircularProgressIndicator());
    }
    else{
      return Center(
        child: SingleChildScrollView(child: 
        Column(
          children: [
            // Display image
            SizedBox(height: 400, width: 400, child: Image.file(widget.image),),
            // Spacer
            const SizedBox(height: 40,),
            // Display Form and Button
            QuantityForm()
            ]
          ),
        ) 
      );
    }
  }
}