import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasteagram/models/post_model.dart';
import 'package:wasteagram/widgets/new_post_form.dart';
import 'package:location/location.dart';

// Gets an image
class NewPostWidget extends StatefulWidget {
  final FoodWastePost currentPost;
  final File image;

  const NewPostWidget({Key? key, required this.currentPost, required this.image}) : super(key: key);

  @override
  State<NewPostWidget> createState() => _NewPostWidgetState();
}

class _NewPostWidgetState extends State<NewPostWidget> {
  LocationData? locationData;
  var locationService = Location();

  @override
  void initState(){
    super.initState();
    retrieveLocation();
    setState(() {});
  }

  // citation: retrieveLocation function directly retrieved from Oregon State University
  // share_location_screen.dart
  void retrieveLocation() async {
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          print('Failed to enable service. Returning.');
          return;
        }
      }

      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          print('Location service permission not granted. Returning.');
        }
      }

      locationData = await locationService.getLocation();
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
      locationData = null;
    }
    locationData = await locationService.getLocation();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    if (widget.currentPost == null || locationData == null){
      return const Center(child: CircularProgressIndicator());
    }
    else{
      // Assign latitude and longitude to the model
      widget.currentPost.latitude = locationData!.latitude.toString();
      widget.currentPost.longitude = locationData!.longitude.toString();
      return Center(
        child: SingleChildScrollView(child: 
        Column(
          children: [
            // Display image
            SizedBox(height: 400, width: 400, child: Image.file(widget.image),),
            // Spacer
            const SizedBox(height: 40,),
            // Display Form and Button
            SubmitForm(currentPost: widget.currentPost, image: widget.image)
            ]
          ),
        ) 
      );
    }
  }
}