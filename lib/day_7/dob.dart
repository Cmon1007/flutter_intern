import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DOB extends StatefulWidget {
  const DOB({Key? key}) : super(key: key);

  @override
  State<DOB> createState() => _DOBState();
}

class _DOBState extends State<DOB> {
  String selectedDob="";
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("DOB"),
        Row(
          children: [
            GestureDetector(
                child: Icon(Icons.calendar_month,size:40),
            onTap: () async{
                  DateTime ? selectDate= await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                  );
                  String formatedDob=DateFormat(DateFormat.YEAR_MONTH_DAY).format(selectDate!);
                  setState(() {
                    selectedDob=formatedDob.toString();
                  });
            },
            ),
            const SizedBox(width: 10,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0)
              ),

              
              child: Center(child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("DOB: $selectedDob"),
              )),
            )
          ],
        ),
      ],
    );
  }
}
