import 'package:flutter/material.dart';
import 'package:flutter_internn/day_6/project/project_field.dart';
import 'package:intl/intl.dart';
class AddOtherProject extends StatefulWidget {
  const AddOtherProject({Key? key}) : super(key: key);

  @override
  State<AddOtherProject> createState() => _AddOtherProjectState();
}
enum org{Yes,No}
extension OrgExtension on org{
  String get orgStringValue{
    switch(this){
      case org.Yes:
        return 'Yes';
      case org.No:
        return 'No';
      default:
        return '';
    }
  }
}
class _AddOtherProjectState extends State<AddOtherProject> {
  String _pStartDate="";
  String _pEndDate="";
  org? organizationValue=org.Yes;
  TextEditingController orgNameController=TextEditingController();
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  final GlobalKey<FormState> _projectKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Projects"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _projectKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Project Title"),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: titleController,
                      validator: (value)
                      {
                        if(value==null||value.isEmpty)
                        {
                          return "Please Enter Project title";
                        }
                        else if(RegExp(r'[^a-zA-Z ]').hasMatch(value))
                        {
                          return "It only accepts text";
                        }
                        else if(orgNameController.text.length>10)
                        {
                          return "Words cannot be more than 10";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Project Title",
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
                    Text("Description"),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: descriptionController,
                      validator: (value)
                      {
                        if(value==null||value.isEmpty)
                        {
                          return "Please Enter Description";
                        }
                        else if(RegExp(r'[^a-zA-Z ]').hasMatch(value))
                        {
                          return "It only accepts text";
                        }
                        else if(orgNameController.text.length>100)
                        {
                          return "Words cannot be more than 100";
                        }
                        return null;
                      },
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Description",
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
                    const SizedBox(height: 10.0,),
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
                              _pStartDate=formattedDate.toString();
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
                              _pEndDate=formattedEndDate.toString();
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(_pStartDate),
                        Spacer(),
                        Text(_pEndDate),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Associated With Any Organization"),
                        Radio(
                          value: org.Yes ,
                          groupValue: organizationValue,
                          onChanged:(value) {
                            setState(() {
                              organizationValue=value;
                              print(organizationValue?.orgStringValue);
                            });
                          },
                        ),
                        Text("Yes"),
                        Radio(
                          value: org.No ,
                          groupValue: organizationValue,
                          onChanged:(value) {
                            setState(() {
                              organizationValue=value;
                              print(organizationValue?.orgStringValue);
                            });
                          },
                        ),
                        Text("No"),
                      ],
                    ),
                      Visibility(
                      visible: organizationValue == org.Yes,
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Organization Name"),
                          const SizedBox(height: 10.0,),
                          TextFormField(
                            validator: (value)
                            {
                              if(value==null||value.isEmpty)
                              {
                                return "Please enter organization name";
                              }
                              else if(RegExp(r'[^a-zA-Z ]').hasMatch(value))
                              {
                                return "It only accepts text";
                              }
                              else if(orgNameController.text.length>10)
                              {
                                return "Words cannot be more than 10";
                              }
                              return null;
                            },
                            controller: orgNameController,
                            decoration: InputDecoration(
                              hintText: "Organization Name",
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
                       ),
                      ),
                    const SizedBox(height: 10.0,),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: Size(200, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0),
                          ),
                        ),
                        onPressed: (){
                          if(_projectKey.currentState!.validate())
                            {
                              final newProject=ProjectData(
                                projectTitle: titleController.text,
                                pDescription: descriptionController.text,
                                startDate:_pStartDate,
                                endDate: _pEndDate,
                                orgName: orgNameController.text,
                              );
                              Navigator.pop(context,newProject);
                              showDialog(context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Project added"),
                                  backgroundColor: Colors.blueGrey,
                                  icon: Icon(Icons.check_circle_outline,size: 45,),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  iconColor: Colors.white,
                                  titleTextStyle: TextStyle(color: Colors.white,fontSize:25),
                                ),);
                            }
                      },
                          child: Text("Add"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
