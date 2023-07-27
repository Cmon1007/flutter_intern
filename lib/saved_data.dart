import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_internn/day_6/education/education_field.dart';
import 'package:flutter_internn/day_6/project/project_field.dart';
import 'package:flutter_internn/day_6/workExperience/work_experience.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'day_6/cv_page.dart';
import 'day_6/shared_preferences/shared_preferences_model.dart';

class SavedData extends StatefulWidget {
   const SavedData({
    Key? key}) : super(key: key);

  @override
  State<SavedData> createState() => _SavedDataState();
}

class _SavedDataState extends State<SavedData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Displaying Saved Data"),
        actions: [
         Padding(
           padding: const EdgeInsets.only(right: 8.0),
           child: GestureDetector(
               child: Icon(Icons.delete,color: Colors.red,size: 35,),
           onTap: _deleteSaveData,
           ),
         )
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body:SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: FutureBuilder(
                  future: _loadSaveData(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState==ConnectionState.waiting)
                      {
                        return Center(child: CircularProgressIndicator(),);
                      }
                    else if(snapshot.hasData)
                      {
                        List<CvData> cvDataList=snapshot.data!;
                        return Column(
                          children: [
                          Container(
                            height:670,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: cvDataList.length,
                              itemBuilder: (context, index) {
                              CvData cvData=cvDataList[index];
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                  child: Column(
                                    children: [
                                      Text("USER ${index+1}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),),
                                      Text("First Name: ${cvData.firstName}"),
                                      Text("Middle Name: ${cvData.middleName}"),
                                      Text("Last Name: ${cvData.lastName}"),
                                      Text("Age: ${cvData.age}"),
                                      Text("Gender: ${cvData.gender??'Not chosen'}"),
                                      Text("Skills: ${cvData.skills.join(',')}"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                                        height: 150,
                                        child: ListView.builder(
                                          itemCount: cvData.workExperiences.length,
                                          itemBuilder: (context, index) {
                                            WorkExperienceData works=cvData.workExperiences[index];
                                            return  ListTile(
                                              title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Job ${index+1}",textAlign: TextAlign.center, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple),),],), Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                Column(children: [Text("Job Title: ${works.jobTitle}"), Text("Summary: ${works.summary}"), Text("Company Name: ${works.companyName}"), Text("Start Date: ${works.startDate}"), Text("End Date: ${works.endDate}"),
                                                ],
                                                ),
                                              ],)
                                              ],
                                              ),
                                            );
                                            },),
                                      ),
                                    ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          decoration: BoxDecoration(border: Border.all(color: Colors.black26),),
                                          height: 150,
                                          child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: cvData.educationDatas.length,
                                        itemBuilder: (context, index) {
                                          EducationData educationData=cvData.educationDatas[index];
                                          return ListTile(
                                            title: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("Education ${index+1}",textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple),),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text("Organization Name: ${educationData.orgName}"),
                                                        Text("Level: ${educationData.level}"),
                                                        Text("Achievements: ${educationData.achievments}"),
                                                        Text("Start Date: ${educationData.startDate}"),
                                                        Text("End Date: ${educationData.endDate}"),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );},),),),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                        decoration: BoxDecoration(border: Border.all(color: Colors.black26),),
                                        height: 150,
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: cvData.projectDatas.length,
                                          itemBuilder: (context, index) {
                                            ProjectData projectData=cvData.projectDatas[index];
                                            return ListTile(
                                              title: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("Project ${index+1}",textAlign: TextAlign.center,
                                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple),),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text("Project Title: ${projectData.projectTitle}"),
                                                          Text("Description: ${projectData.pDescription}"),
                                                          Text("Organization Name: ${projectData.orgName}"),
                                                          Text("Start Date: ${projectData.startDate}"),
                                                          Text("End Date: ${projectData.endDate}"),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );},),
                                      ),),
                                      Text("Languages: ${cvData.languages.join(',')}"),
                                      Text("Interested Areas: ${cvData.interestAreas.join(',')}"),
                                  ]
                                 )
                                ),
                              );
                              }
                            ),
                          )
                          ],
                        );
                      }
                    else
                      return Center(child: Text("Error loading data"),);
                  },)
            ),
          ],
        ),
      )
    );
  }
  Future<List<CvData>> _loadSaveData() async
  {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    final jsonString= prefs.getString('cvData');
    if(jsonString!=null) {
      try {
        final jsonList = jsonDecode(jsonString) as List<dynamic>;
        return jsonList.map((json) => CvData.fromJson(json)).toList();
      }
      catch (e) {
        print("Error :$e");
      }
    }
    return [];
  }
  Future<void> _deleteSaveData()
  async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {

    });
  }
}
