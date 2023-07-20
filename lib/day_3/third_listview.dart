
import 'package:flutter/material.dart';
import 'package:flutter_internn/day_3/custom_list_wtih_wrap.dart';
class ThirdListContainer extends StatefulWidget {
  const ThirdListContainer({Key? key}) : super(key: key);

  @override
  State<ThirdListContainer> createState() => _ThirdListContainerState();
}

class _ThirdListContainerState extends State<ThirdListContainer> {
  int iconList=4;
  List<Widget> listWithIcon=[
    const CustomListWithWrap(icon: Icons.home, text: "Home"),
    const CustomListWithWrap(icon: Icons.account_circle_outlined, text: "User"),
    const CustomListWithWrap(icon: Icons.accessibility_outlined, text: "Person"),
    const CustomListWithWrap(icon: Icons.sailing, text: "Boat"),
    const CustomListWithWrap(icon: Icons.headphones, text: "Headphone"),
    const CustomListWithWrap(icon: Icons.mic, text: "Microphone"),
    const CustomListWithWrap(icon: Icons.language, text: "World"),
    const CustomListWithWrap(icon: Icons.flag, text: "Flag"),
    const CustomListWithWrap(icon: Icons.sports_football_outlined, text: "Baseball"),
    const CustomListWithWrap(icon: Icons.sports_soccer_outlined, text: "Football"),
  ];
  List<Widget> lists=[];
  @override
  void initState() {
    updateListIcon();
    super.initState();
  }
  void updateListIcon()
  {
    lists=listWithIcon.take(iconList).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(top: 6.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      height: 130,
      width: 330,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: lists
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(150, 30)),
              onPressed: (){
              setState(() {
                if(iconList==4)
                  {
                    iconList=10;
                  }
                else
                  {
                    iconList=4;
                  }
              });
              updateListIcon();
            },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(iconList==4?"Show More":"Show Less"),
                  Icon(iconList==4?Icons.play_circle_rounded:Icons.expand_circle_down)
                ],
              ),
            ),
          ],
        ),
      ),
        );
  }
}
