import 'dart:math';

import 'package:flutter/material.dart';
class DayOneScreen extends StatefulWidget {
  const DayOneScreen({Key? key}) : super(key: key);

  @override
  State<DayOneScreen> createState() => _DayOneScreenState();
}

class _DayOneScreenState extends State<DayOneScreen> {
  int count=0;
  // List of colors
  List<Color> colorsList=[
    Colors.red,
    Colors.blue,
    Colors.orangeAccent,
    Colors.greenAccent,
    Colors.black,
  ];
  //List of icons of floating butoon
  List<Icon> iconList=[
    Icon(Icons.arrow_drop_down),
    Icon(Icons.arrow_drop_up),
    Icon(Icons.arrow_forward),
    Icon(Icons.arrow_back),
  ];
  //List of font sizes
  List<double> fontsizes=[
    20,
    12,
    28,
  ];
  //List of button sizes
  List<Size> buttonSize=[
    Size(250, 50),
    Size(320, 40),
    Size(300, 45),
    Size(150, 55),
  ];
  //List of icons for icon button
  List<Icon> differentIcons=[
    Icon(Icons.message),
    Icon(Icons.calendar_month),
    Icon(Icons.access_alarm),
    Icon(Icons.account_balance),
    Icon(Icons.apple),
    Icon(Icons.emoji_flags_rounded),
  ];
  //List of texts for elevated button
  List<String> eTexts=[
    "EButton Pressed",
    "Pressed again",
    "Text Changed",
    "New Text",
  ];
  //List of image url
  List<String> imageUrl=[
    "https://picsum.photos/250?image=9",
    "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
  ];
  //declaring random variable
  var random=Random();    //provides methods and properties for generating random numbers

  Color currentColor1=Colors.black;
  Color currentColor2=Colors.black;

  void changeFloatingButtonColor()    //function to change floating button color
  {
    currentColor1= colorsList[random.nextInt(colorsList.length)];
  }
  void changeFloatingButtonColor2()   //function to change floating button color
  {
    currentColor2= colorsList[random.nextInt(colorsList.length)];
  }

  Color elevatedButtonColor=Colors.black;
  void changeElevatedButttonColor()  ////function to change elevated button color
  {
    elevatedButtonColor= colorsList[random.nextInt(colorsList.length)];
  }

  Color elevatedTextColor=Colors.white;
  void changeElevatedTextColor()  //function to change elevated text color
  {
    elevatedTextColor= colorsList[random.nextInt(colorsList.length)];
  }

  Color textColor=Colors.black;
  void changeTextColor()     // function to change text color
  {
    textColor= colorsList[random.nextInt(colorsList.length)];
  }

  Color iconColor=Colors.black;
  void changeIconColor()    // function to change icon color
  {
    iconColor= colorsList[random.nextInt(colorsList.length)];
  }

  Icon currentIcon1=Icon(Icons.minimize);
  Icon currentIcon2=Icon(Icons.add);
  void changeIcon()   // function to change icon
  {
    currentIcon1=iconList[random.nextInt(iconList.length)];
  }
  void changeIcon2()
  {

    currentIcon2=iconList[random.nextInt(iconList.length)];
  }

  double firstFontSize=25.0;
  double elevatedFontSize=20.0;

  void changeFontSize()   // function to chang efont size
  {
    firstFontSize=fontsizes[random.nextInt(fontsizes.length)];
  }
  void changeElevatedFontSize()
  {
    elevatedFontSize=fontsizes[random.nextInt(fontsizes.length)];
  }


  Size firstSize=Size(230, 50);
  void changeButtonSize()   // function to change button size
  {
    firstSize=buttonSize[random.nextInt(buttonSize.length)];
  }


  Icon firstIcon=Icon(Icons.home);
  void changeIconWithButton()    // function to change icon of icon button
  {
    firstIcon=differentIcons[random.nextInt(differentIcons.length)];
  }

  String firstImage="https://docs.flutter.dev/assets/images/dash/dash-fainting.gif";
  void changeImageWithNetwork()    //function to change image with image network
  {
    firstImage=imageUrl[random.nextInt(imageUrl.length)];
  }

  String defaultText="Elevated Button";
  void changeElevatedButtonChild()   //function to change child of elevated button
  {
    defaultText=eTexts[random.nextInt(eTexts.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day One Screen"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:
              Column(
                children: [
                  const SizedBox(height: 15,),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        changeTextColor();
                        changeFontSize();
                      });
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: textColor),
                      ),
                      fixedSize: Size(250, 60),

                    ),
                    child: Column(
                      children: [
                        Flexible(
                          child: Center(
                            child: Text("Text Button",style: TextStyle(fontSize: firstFontSize,color: textColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: elevatedButtonColor,fixedSize: firstSize),
                      onPressed: (){
                        setState(() {
                          changeElevatedButttonColor();
                          changeButtonSize();
                          changeElevatedFontSize();
                          changeElevatedTextColor();
                          changeElevatedButtonChild();
                        });
                      },
                      child: Text(defaultText,
                        style: TextStyle(
                            fontSize: elevatedFontSize,
                            color: elevatedTextColor),
                      ),
                    ),
                  ),
                  Text("Count Value: "),
                  Text("$count",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        backgroundColor: currentColor1,
                        onPressed: (){
                          setState(() {
                            count--;
                          });
                          changeFloatingButtonColor();
                          changeIcon();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: currentIcon1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15,),
                      FloatingActionButton.large(
                        backgroundColor: Colors.black,
                        onPressed: (){
                          setState(() {
                            count=0;
                          });
                        },
                        child: Text("Reset"),
                      ),
                      const SizedBox(width: 15,),
                      FloatingActionButton(
                        backgroundColor: currentColor2,
                        onPressed: (){
                          setState(() {
                            count++;
                          },
                          );
                          changeFloatingButtonColor2();
                          changeIcon2();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: currentIcon2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  IconButton(onPressed: (){
                    setState(() {
                      changeIconWithButton();
                      changeIconColor();
                      changeImageWithNetwork();
                    });
                  },
                    icon: firstIcon,color: iconColor,iconSize: 50,

                  ),
                  Container(
                    width: 150,
                    height: 150,
                    child: Image.network(firstImage,fit: BoxFit.fill,),
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      child: Image.asset("assets/images/flutter.png",)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
