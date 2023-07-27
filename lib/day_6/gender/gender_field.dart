import 'package:flutter/material.dart';

class GenderField extends StatefulWidget {
  final Function(String?) onGenderChanged;
  final String? selectedGender;

  const GenderField({
    required this.onGenderChanged,
  required this.selectedGender,
  });

  @override
  _GenderFieldState createState() => _GenderFieldState();
}

class _GenderFieldState extends State<GenderField> {

  String? _selectedGender="Male";
  // @override
  // void didUpdateWidget(covariant GenderField oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  //   if(widget.selectedGender!=oldWidget.selectedGender)
  //     {
  //       setState(() {
  //         _selectedGender="";
  //       });
  //     }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gender"),
          Row(
            children: [
              Radio(
                value: "Male",
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                  widget.onGenderChanged(value);
                },
              ),
              Text("Male"),
              SizedBox(width: 16),
              Radio(
                value: "Female",
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                  widget.onGenderChanged(value);
                },
              ),
              Text("Female"),
              SizedBox(width: 16),
              Radio(
                value: "Other",
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                  widget.onGenderChanged(value);
                },
              ),
              Text("Other"),
            ],
          ),
        ],
      ),
    );
  }
}

