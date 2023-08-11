import 'package:flutter/material.dart';
class MaritalStatus extends StatefulWidget {
  const MaritalStatus({Key? key}) : super(key: key);

  @override
  State<MaritalStatus> createState() => _MaritalStatusState();
}

class _MaritalStatusState extends State<MaritalStatus> {
  String? _selectedMarital="Single";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
                child: Row(
                  children: [
                    Text("Marital Status"),
              Radio(
                value: "Single",
                groupValue: _selectedMarital,
                onChanged: (value){
                  setState(() {
                    _selectedMarital=value;
                  });
                },
              ),
              Text("Single"),
              Radio(
                  value: "Married",
                  groupValue: _selectedMarital,
                  onChanged: (value){
                    setState(() {
                      _selectedMarital=value;
                    });
                  }),
              Text("Married")
            ],
                ),
        ),
      ],
    );
  }
}
