import 'package:flutter/material.dart';
class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController=TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password"),
        TextFormField(
          validator: (value)
          {
            if(value==null||value.isEmpty)
            {
              return "Please enter password";
            }
            else if(value.length<8)
            {
              return 'Password must be at least 8 characters long';
            }
            return null;
          },
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          obscureText: true,
          obscuringCharacter: "*",
        ),
      ],
    );
  }
}
