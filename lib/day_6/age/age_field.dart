import 'package:flutter/material.dart';
class AgeField extends StatelessWidget {
  final String hintText;
  final TextEditingController ageController;
  const AgeField({
    required this.hintText,
    required this.ageController,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Age"),
          const SizedBox(height: 10,),
          TextFormField(
            validator: (value){
              if(value==null||value.isEmpty)
                {
                  return 'Please enter your age';
                }
              else if(!RegExp(r"^[0-9]+$").hasMatch(value))
                {
                  return 'Age cannot be anything else than number';
                }
              else if(ageController.text.length>3)
                {
                  return 'A person cannot be this much old';
                }
              return null;
            },
            controller: ageController,
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
        ],
      ),
    );
  }
}
