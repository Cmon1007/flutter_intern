import 'package:flutter/material.dart';
class MobileNumber extends StatelessWidget {
  const MobileNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileNumberController=TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Mobile Number"),
        TextFormField(
          validator: (value)
          {
            if(value==null||value.isEmpty)
            {
              return "Please enter your number";
            }
            else if(!RegExp(r"^[0-9]+$").hasMatch(value))
          {
            return "Mobile number cannot be a letter or special characters";
          }
            else if(value.length<10||value.length>10)
              {
                return "Number should be 10 characters long";
              }
          return null;
          },
          controller: mobileNumberController,
          decoration: InputDecoration(
            hintText: "Mobile Number",
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        )
      ],
    );
  }
}
