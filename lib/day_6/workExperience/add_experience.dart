
import 'package:flutter/material.dart';
import 'package:flutter_internn/day_6/workExperience/work_experience.dart';
import 'package:intl/intl.dart';

class AddWorkExperience extends StatefulWidget {
  const AddWorkExperience({Key? key}) : super(key: key);

  @override
  State<AddWorkExperience> createState() => _AddWorkExperienceState();
}

class _AddWorkExperienceState extends State<AddWorkExperience> {
  final GlobalKey<FormState> _experienceKey=GlobalKey<FormState>();
  String _startDate='';
  String _endDate='';
  TextEditingController jobController=TextEditingController();
  TextEditingController summaryController=TextEditingController();
  TextEditingController companyNameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Work Experience"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Job Title"),
                const SizedBox(height: 10.0,),
                Form(
                  key: _experienceKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  TextFormField(
                    validator:
                        (value){
                      if(value==null||value.isEmpty)
                      {
                        return 'Name field cannot be null';
                      }
                      else if(jobController.text.length>10)
                      {
                        return 'Name cannot be more than 10 words';
                      }
                      return null;
                    },
                    controller: jobController,
                    decoration: InputDecoration(
                      hintText: 'Job Title',
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
                  Text("Summary"),
                  const SizedBox(height: 10.0,),
                  TextFormField(
                    validator:
                        (value){
                      if(value==null||value.isEmpty)
                      {
                        return 'Please write the summary';
                      }
                      else if(summaryController.text.length>100)
                      {
                        return 'Summary cannot be more than 100 words';
                      }
                      return null;
                    },
                    controller: summaryController,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: 'Summary',
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
                  Text("Company Name"),
                  const SizedBox(height: 10.0,),
                  TextFormField(
                    validator:
                        (value){
                      if(value==null||value.isEmpty)
                      {
                        return 'Enter company name';
                      }
                      else if(companyNameController.text.length>10)
                      {
                        return 'Cpmpany Name cannot be more than 10 words';
                      }
                      return null;
                    },
                    controller: companyNameController,
                    decoration: InputDecoration(
                      hintText: 'Company Name',
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
                            _startDate=formattedDate.toString();
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
                            _endDate=formattedEndDate.toString();
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(_startDate),
                      Spacer(),
                      Text(_endDate),
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),
                          )
                      ),
                      onPressed: () {
                        if(_experienceKey.currentState!.validate())
                        {
                          WorkExperienceData newWorkExperience = WorkExperienceData(
                            companyName: companyNameController.text,
                            jobTitle: jobController.text,
                            summary: summaryController.text,
                            startDate: _startDate,
                            endDate: _endDate,
                          );
                          Navigator.pop(context, newWorkExperience);
                          //showing alert dialog when data submitted
                          showDialog(context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Work Expeirence Added"),
                              backgroundColor: Colors.blueGrey,
                              icon: Icon(Icons.check_circle_outline,size: 45,),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0),
                              ),
                              iconColor: Colors.white,
                              titleTextStyle: TextStyle(color: Colors.white,fontSize:25),
                          ),);
                        }
                      },
                      child: Text("Add",style: TextStyle(fontSize: 20.0),),
                    ),
                  ),
                ],
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
