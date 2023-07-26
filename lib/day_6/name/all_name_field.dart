import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class AllNameField extends StatelessWidget {
  final String name;
  final String hintText;
  final TextEditingController controller;
  // final String? Function(String?)? validator;
  const AllNameField({
    // required this.validator,
    required this.name,
    required this.controller,
    required this.hintText,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          const SizedBox(height: 5.0,),
          TextFormField(
            keyboardType: TextInputType.name,
            validator:
                (value){
              if(value==null||value.isEmpty)
                {
                  return 'Please enter your name';
                }
              else if(controller.text.length>10)
                {
                  return 'Name cannot be more than 10 words';
                }
              else if(RegExp(r'[^a-zA-Z]').hasMatch(value))
                {
                  return 'Name cannot have numbers';
                }
              return null;
            },
             controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(15.0),
              ),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(15.0),
              ),
              ),
            ),
        ]
      ),
    );
  }
}
