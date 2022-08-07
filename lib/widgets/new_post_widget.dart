import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/new_post_form.dart';

class NewPostWidget extends StatefulWidget {
  final File image;
  const NewPostWidget({Key? key, required this.image}) : super(key: key);

  @override
  State<NewPostWidget> createState() => _NewPostWidgetState();
}

class _NewPostWidgetState extends State<NewPostWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.image == null){
      return const Center(child: CircularProgressIndicator());
    }
    else{
      return Center(
        child: ListView(
          children: [
            SizedBox(height: 400, width: 400, child: Image.file(widget.image),),
            const SizedBox(height: 40,),
            // Form here
            QuantityForm()

            // Button Here
            ]
        ),
      );
    }
  }
}