import 'package:flutter/material.dart';
class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email"),
        TextFormField(
          validator: (value)
          {
            if(value==null||value.isEmpty)
            {
              return "Please enter email";
            }
            else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
            {
              return 'Invalid email format';
            }
            return null;
          },
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
      ],
    );
  }
}
