import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_internn/day_6/language/language_field.dart';
import 'package:flutter_internn/day_6/project/add_other_project.dart';
import 'package:flutter_internn/day_6/project/project_field.dart';
import 'package:flutter_internn/day_6/shared_preferences/shared_preferences_model.dart';
import 'package:flutter_internn/day_6/workExperience/add_experience.dart';
import 'package:flutter_internn/day_6/age/age_field.dart';
import 'package:flutter_internn/day_6/name/all_name_field.dart';
import 'package:flutter_internn/day_6/education/add_education.dart';
import 'package:flutter_internn/day_6/gender/gender_field.dart';
import 'package:flutter_internn/day_6/skills/skills_choose.dart';
import 'package:flutter_internn/day_6/workExperience/work_experience.dart';
import 'package:flutter_internn/saved_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'education/education_field.dart';
import 'interest_area/interest_areas.dart';
class CvPage extends StatefulWidget {
  const CvPage({Key? key}) : super(key: key);
  @override
  State<CvPage> createState() => _CvPageState();
}
class _CvPageState extends State<CvPage> {
  final GlobalKey<FormState> _key=GlobalKey<FormState>();
  ValueNotifier<bool> _valueNotifier=ValueNotifier(false);
  TextEditingController firstNameController=TextEditingController();
  TextEditingController middleNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  List<WorkExperienceData> workExperiences=[];
  List<EducationData> educationDatas=[];
  List<ProjectData> projectDatas=[];
  String? selectedGender="";
  List<String> selectedSkill=[];
  List<String> selectedLanguage=[];
  List<String> selectedAreas=[];
  List<CvData> cvDataList=[];
  void _onTapIcon(WorkExperienceData workExperience)
  {
    setState(() {
      workExperiences.remove(workExperience);
    });
  }
  void _onTapEducation(EducationData educationData)
  {
    setState(() {
      educationDatas.remove(educationData);
    });
  }
  void _onTapProject(ProjectData projectData)
  {
    setState(() {
      projectDatas.remove(projectData);
    });
  }
  void _resetForm()
  {
    firstNameController.clear();
    middleNameController.clear();
    lastNameController.clear();
    ageController.clear();
    selectedSkill.clear();
    selectedLanguage.clear();
    selectedAreas.clear();
    setState(() {
      selectedGender='Male';
      workExperiences.clear();
      educationDatas.clear();
      projectDatas.clear();
    });
  }
    CvData _prepareCvData()
    {
      final cvData= CvData(
          id: DateTime.now().toString(),
          firstName: firstNameController.text,
          middleName: middleNameController.text,
          lastName: lastNameController.text,
          age: int.tryParse(ageController.text)??0,
          gender:selectedGender,
          skills: selectedSkill,
          workExperiences: workExperiences,
          projectDatas: projectDatas,
          educationDatas: educationDatas,
      );
      return cvData;
   }
   Future<void> _saveData()
   async {
     SharedPreferences prefs=await SharedPreferences.getInstance();
     final cvData=_prepareCvData();
     cvData.languages=selectedLanguage;
     cvData.interestAreas=selectedAreas;
     final jsonString=prefs.getString('cvData');
     List<CvData> cvDataList=[];
     if(jsonString!=null) {
       try {
         final jsonData = jsonDecode(jsonString);
         if (jsonData is List<dynamic>) {
           cvDataList = jsonData.map((json) => CvData.fromJson(json)).toList();
         }
         else if (jsonData is Map<String, dynamic>) {
           cvDataList.add(CvData.fromJson(jsonData));
         }
       }
       catch(e)
     {
       print("Error data: $e");
     }
     }
     cvDataList.add(cvData);
     final jsonStringToSave=jsonEncode(cvDataList.map((cvData) =>cvData.toJson()).toList());
      await prefs.setString('cvData', jsonStringToSave);
     setState(() {
      this.cvDataList=cvDataList;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Curriculum Vitae"),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _key,
              child: Column(
                children: [
                  Text("Curriculum Vitae",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  const SizedBox(height: 10,),
                  AllNameField(
                    name: 'First Name',
                    controller: firstNameController,
                      hintText: "First Name",
                  ),
                  AllNameField(
                    name: 'Middle Name',
                    controller: middleNameController,
                    hintText: "Middle Name",
                  ),
                  AllNameField(
                    name: 'Last Name',
                    controller: lastNameController,
                    hintText: "Last Name",
                  ),
                  AgeField(
                      hintText: "Age",
                      ageController: ageController,
                  ),
                  //Gender field
                  GenderField(onGenderChanged:(gender)
                  {
                    setState(() {
                      selectedGender=gender;
                    });
                  },
                    selectedGender: selectedGender,
                  ),

                  //Skills field
                  ChooseSkills(onSkillChanged:(skill)
                  {
                    setState(() {
                      selectedSkill=skill;
                    });
                  }),
                  //Work Experience field
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Row(
                      children: [
                        Text("Work Experience"),
                        Spacer(),
                        ElevatedButton(onPressed: () async {
                          final newWorkExperiencee=await Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddWorkExperience(),
                            ),
                          );
                          if(newWorkExperiencee!=null)
                          {
                            setState(() {
                              workExperiences.add(newWorkExperiencee);
                            });
                          }
                        }, child: Text("Add"),
                        ),
                      ],
                    ),
                  ),
                  for(var workExperience in workExperiences)
                     WorkExperienceField(
                       workExperienceData: workExperience, deleteOnTap: ()=>_onTapIcon(workExperience),
                     ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Row(
                      children: [
                        Text("Education"),
                        Spacer(),
                        ElevatedButton(onPressed: () async {
                              final newEducationData=await Navigator.push(context,
                                MaterialPageRoute(builder: (context) => AddEducation(),
                              ),
                              );
                              if(newEducationData!=null)
                                {
                                  setState(() {
                                    educationDatas.add(newEducationData);
                                  });
                                }
                        },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  for(var educationData in educationDatas)
                    EducationField(educationData: educationData, deleteOnTap: ()=>_onTapEducation(educationData),),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Other Projects"),
                      ),
                      Spacer(),
                      ValueListenableBuilder(
                        valueListenable: _valueNotifier,
                        builder: (BuildContext context, bool value, Widget? child) {
                          return Switch(
                              value: value,
                              onChanged: (bool newValue)
                              async {
                                _valueNotifier.value=newValue;
                                  if(newValue)
                                  {
                                    final newProjects=await Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => AddOtherProject(),
                                      ),
                                    );
                                    if(newProjects!=null)
                                    {
                                      setState(() {
                                        projectDatas.add(newProjects);
                                        _valueNotifier.value=false;
                                      });
                                    }
                                  }
                                });
                              },
                      ),
                    ],
                  ),
                  for(var projectData in projectDatas)
                    ProjectField(projectData: projectData, projectOnTap: ()=>_onTapProject(projectData),
                    ),
                  LanguageField(onLanguagesChanged: (languages) {
                    setState(() {
                      selectedLanguage=languages;
                    });
                  },),
                  InterestArea(onInterestArea: (areas){
                    selectedAreas=areas;
                  },),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(200, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),
                      )
                    ),
                    onPressed: () async {
                      if(_key.currentState!.validate())
                        {
                         await _saveData();
                          showDialog(context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Your Data has been saved Successfully"),
                              backgroundColor: Colors.blueGrey,
                              icon: Icon(Icons.check_circle_outline,size: 45,),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0),
                              ),
                              iconColor: Colors.white,
                              titleTextStyle: TextStyle(color: Colors.white,fontSize:25),
                            ),
                          );
                         _resetForm();
                        }
                  },
                      child: Text("Save",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  const SizedBox(height: 15,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(200, 45),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),
                        )
                    ),
                    onPressed: ()  {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SavedData(),
                         ),
                      );
                      },
                  child: Text("View Data",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}