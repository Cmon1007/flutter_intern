import 'package:flutter/material.dart';
class PasswordField extends StatefulWidget {
  final TextEditingController controller;
   const PasswordField({
    required this.controller,
    Key? key}) : super(key: key);
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscured=true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.black),),
        const SizedBox(height: 10.0,),
        TextFormField(
          controller: widget.controller,
          validator: (value)
          {
            if(value==null||value.isEmpty)
              {
                return "Please enter password";
              }
          },
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
                child: _isObscured?Icon(Icons.visibility_off,color: Colors.white,):Icon(Icons.visibility,color: Colors.white,),
            onTap: (){
                  setState(() {
                    _isObscured=!_isObscured;
                  });
            },
            ),
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(18.0),
            ),
              filled: true,
              fillColor: Colors.grey
          ),
          obscureText: _isObscured,
          obscuringCharacter: "*",
        )
      ],
    );
  }
}
