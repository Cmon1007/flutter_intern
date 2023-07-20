import 'package:flutter/material.dart';

import 'custom_container.dart';
class SecondListView extends StatefulWidget {
  const SecondListView({Key? key}) : super(key: key);

  @override
  State<SecondListView> createState() => _SecondListViewState();
}

class _SecondListViewState extends State<SecondListView> {
  int viewList=5;
  List<Widget> widgetList=<Widget>[
    const CustomListContainer(
      title: "Image 1",
      description: "This is image 1",
      icon: Icons.home,
      buttonName: "First Button",
      imageurl: "https://picsum.photos/250?image=9",
    ),
    const CustomListContainer(
      title: "Image 2",
      description: "This is image 2",
      icon: Icons.alarm,
      buttonName: "Second Button",
      imageurl: "https://picsum.photos/250?image=9",
    ),
    const CustomListContainer(
      title: "Image 3",
      description: "This is image 3",
      icon: Icons.calendar_month,
      buttonName: "Third Button",
      imageurl: "https://picsum.photos/250?image=9",
    ),
    const CustomListContainer(
      title: "Image 4",
      description: "This is image 4",
      icon: Icons.apple,
      buttonName: "Fourth Button",
      imageurl: "https://picsum.photos/250?image=9",
    ),
    const CustomListContainer(
      title: "Image 5",
      description: "This is image 5",
      icon: Icons.computer,
      buttonName: "Fifth Button",
      imageurl: "https://picsum.photos/250?image=9",
    ),
    const CustomListContainer(
      title: "Image 6",
      description: "This is image 6",
      icon: Icons.account_balance,
      buttonName: "Sixth Button",
      imageurl: "https://picsum.photos/250?image=9",
    ),

    const CustomListContainer(
      title: "Image 7",
      description: "This is image 7",
      icon: Icons.add_call,
      buttonName: "Seventh Button",
      imageurl: "https://picsum.photos/250?image=9",
    ),
    const CustomListContainer(
      title: "Image 8",
      description: "This is image 8",
      icon: Icons.add_box_outlined,
      buttonName: "Eighth Button",
      imageurl: "https://picsum.photos/250?image=9",
    ),
    const CustomListContainer(
      title: "Image 9",
      description: "This is image 9",
      icon: Icons.add_a_photo_sharp,
      buttonName: "Ninth Button",
      imageurl: "https://picsum.photos/250?image=9",
    ),
    const CustomListContainer(
      title: "Image 10",
      description: "This is image 10",
      icon: Icons.account_box_outlined,
      buttonName: "Tenth Button",
      imageurl: "https://picsum.photos/250?image=9",
    ),
  ];
  List<Widget> visibleWidget=[];
  @override
  void initState() {
    updateWidgetList();
    super.initState();
  }
  void updateWidgetList()
  {
    visibleWidget=widgetList.take(viewList).toList();
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: Colors.black),
        ),
        child: Column(
          children: [
            const Text("Title: Second ListView Container"),
            const SizedBox(height: 10,),
            const Text("Description: Below is the second list"),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: ListView(
                  children:
                   visibleWidget
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(180, 40),backgroundColor: Colors.black),
              onPressed: (){
                    setState(() {
                      if(viewList==5)
                        {
                          viewList=10;
                        }
                      else
                        {
                          viewList=5;
                        }
                    },

                    );
                    updateWidgetList();
            },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(viewList==5?"Show More":"Show Less"),
                    Icon(viewList==5?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down)
                  ],
                ),
            ),
          ],
        )
      ),
    );
  }
}


