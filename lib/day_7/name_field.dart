import 'package:flutter/material.dart';
class NameField extends StatelessWidget {
  const NameField({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Full Name"),
        const SizedBox(height: 10,),
        TextFormField(
          validator: (value)
          {
            if(value==null||value.isEmpty)
              {
                return "Please enter your full name";
              }
            else if(RegExp(r'[^a-zA-Z ]').hasMatch(value))
            {
              return 'Name cannot have numbers';
            }
            return null;
          },
          controller: nameController,
          decoration: InputDecoration(
            hintText: "Full Name",
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
      ],
    );
  }
}
