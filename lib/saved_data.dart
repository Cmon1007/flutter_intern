import 'package:flutter/material.dart';
import 'package:flutter_internn/day_6/education/education_field.dart';
import 'package:flutter_internn/day_6/project/project_field.dart';
import 'package:flutter_internn/day_6/workExperience/work_experience.dart';
import 'day_6/cv_page.dart';

class SavedData extends StatefulWidget {
  final CvData cvData;
   const SavedData({
    required this.cvData,
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
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body:Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("First Name: ${widget.cvData.firstName}"),
            Text("Middle Name: ${widget.cvData.middleName}"),
            Text("Last Name :${widget.cvData.lastName}"),
            Text("Age: ${widget.cvData.age}"),
            Text("Gender: ${widget.cvData.gender??'Not chosen'}"),
            Text("Skills: ${widget.cvData.skills.join(',')}"),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                ),
                width: double.infinity,
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.cvData.workExperiences.length,
                  itemBuilder: (context, index) {
                    // Map<String,dynamic> cvData=widget.cvDataList[index];
                  WorkExperienceData workExperience=widget.cvData.workExperiences[index];
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Job ${index+1}",textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text("Job Title: ${workExperience.jobTitle}"),
                                Text("Summary: ${workExperience.summary}"),
                                Text("Company Name: ${workExperience.companyName}"),
                                Text("Start Date: ${workExperience.startDate}"),
                                Text("End Date: ${workExperience.endDate}"),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  );
                },),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                ),
                width: double.infinity,
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.cvData.educationDatas.length,
                  itemBuilder: (context, index) {
                    EducationData educationData=widget.cvData.educationDatas[index];
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
                    );
                  },),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                ),
                width: double.infinity,
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.cvData.projectDatas.length,
                  itemBuilder: (context, index) {
                    ProjectData projectData=widget.cvData.projectDatas[index];
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
                    );
                  },),
              ),
            ),
            Text("Languages: ${widget.cvData.languages.join(',')}"),
            Text("Interested Areas: ${widget.cvData.interestAreas.join(',')}")
          ],
        ),
      )
    );
  }

}
