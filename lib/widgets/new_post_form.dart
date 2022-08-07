import 'package:flutter/material.dart';

class QuantityForm extends StatefulWidget {
  const QuantityForm({Key? key}) : super(key: key);

  @override
  State<QuantityForm> createState() => _QuantityFormState();
}

class _QuantityFormState extends State<QuantityForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [createTextForm(), createButton()]
      )
    );
  }

  SizedBox createTextForm(){
    return SizedBox(
      width: 250,
      child: TextFormField(
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
        Navigator.pop(context);
        return;
        // Upload picture to server here
        }
      }, 
      child: const Text('Submit'),);
  }
}