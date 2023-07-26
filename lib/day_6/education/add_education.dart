import 'package:flutter/material.dart';
import 'package:flutter_internn/day_6/education/education_field.dart';
import 'package:intl/intl.dart';
class AddEducation extends StatefulWidget {
  const AddEducation({Key? key}) : super(key: key);

  @override
  State<AddEducation> createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  String _dropDownValue='SEE';
  var items=[
    'SEE',
    '+2',
    'Bachelor',
    'Master',
    'Phd',
  ];
  String _eStartDate="";
  String _eEndDate="";
  TextEditingController orgNameController=TextEditingController();
  TextEditingController achievementController=TextEditingController();
  final GlobalKey<FormState> _eduKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Education"),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _eduKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Education"),
                  const SizedBox(height: 10,),
                  TextFormField(
                    validator: (value)
                    {
                      if(value==null||value.isEmpty)
                        {
                          return "Please Enter Org Name";
                        }
                      else if(RegExp(r'[^a-zA-Z ]').hasMatch(value))
                        {
                          return "There cannot be number";
                        }
                      else if(orgNameController.text.length>10)
                      {
                        return "Not more than 10 words";
                      }
                      return null;
                    },
                    controller: orgNameController,
                    decoration: InputDecoration(
                      hintText: "Organiztion Name",
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
                  Row(
                    children: [
                      Text("Level"),
                      const SizedBox(width: 80,),
                      DropdownButton(
                        value: _dropDownValue,
                          dropdownColor: Colors.grey,
                          items: items.map((String items){
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue)
                      {
                        setState(() {
                          _dropDownValue=newValue!;
                        });
                      }),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Start Date"),
                      Spacer(),
                      Text("End Date"),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(Icons.calendar_month,size: 50,),
                        onTap: () async {
                          DateTime? pickedDate=await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          String formattedDate=DateFormat(DateFormat.YEAR_MONTH_DAY).format(pickedDate!);
                          setState(() {
                            _eStartDate=formattedDate.toString();
                          });
                        },
                      ),
                      Spacer(),
                      GestureDetector(
                        child: Icon(Icons.calendar_month,size: 50,),
                        onTap: () async{
                          DateTime? endDatePicked= await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2023,12,31),
                          );
                          String formattedEndDate=DateFormat(DateFormat.YEAR_MONTH_DAY).format(endDatePicked!);
                          setState(() {
                            _eEndDate=formattedEndDate.toString();
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(_eStartDate),
                      Spacer(),
                      Text(_eEndDate),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text("Achievements"),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: achievementController,
                    decoration: InputDecoration(
                      hintText: "Your Achievements(If Any)",
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: Size(200, 40),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0),
                          ),
                      ),
                      onPressed: (){
                        if(_eduKey.currentState!.validate())
                          {
                            final newEdicationData=EducationData(
                              orgName: orgNameController.text,
                              level: _dropDownValue,
                              startDate: _eStartDate,
                              endDate: _eEndDate,
                              achievments: achievementController.text,
                            );
                            Navigator.pop(context,newEdicationData);
                            showDialog(context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Education background added"),
                                backgroundColor: Colors.blueGrey,
                                icon: Icon(Icons.check_circle_outline,size: 45,),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0),
                                ),
                                iconColor: Colors.white,
                                titleTextStyle: TextStyle(color: Colors.white,fontSize:25),
                              ),);
                          }

                    }, child: Text("Add"),
                       ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
