import 'package:flutter/material.dart';
class UserNameField extends StatelessWidget {
  final TextEditingController controller;
   const UserNameField({
    required this.controller,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0,),
        Text("User Name",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0),),
        const SizedBox(height: 10.0,),
        TextFormField(
      controller: controller,
          validator: (value)
          {
            if(value==null||value.isEmpty)
            {
              return "Please enter user name";
            }
          },
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.email,color: Colors.white,),
      hintText: "User Name",
        hintStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(18.0),
    ),
        filled: true,
        fillColor: Colors.grey
    ),
        ),
      ],
    );
  }
}
