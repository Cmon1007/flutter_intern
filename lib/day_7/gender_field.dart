import 'package:flutter/material.dart';
class GenderField extends StatefulWidget {
  const GenderField({Key? key}) : super(key: key);

  @override
  State<GenderField> createState() => _GenderFieldState();
}

class _GenderFieldState extends State<GenderField> {
  String? _selectedGender="Male";
  @override
  Widget build(BuildContext context) {
        return Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text("Gender:"),
                  Row(
                    children: [
                      Radio(
                        value: "Male",
                        groupValue: _selectedGender,
                        onChanged: (value)
                        {
                          setState(() {
                            _selectedGender=value;
                          });
                        },
                      ),
                      Text("Male"),
                      Radio(
                        value: "Female",
                        groupValue: _selectedGender,
                        onChanged: (value)
                        {
                          setState(() {
                            _selectedGender=value;
                          });
                        },
                      ),
                      Text("Female"),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
  }
}
