import 'package:flutter/material.dart';
import 'package:flutter_internn/day_3/day_three_task.dart';
import 'package:flutter_internn/day_4/day_4_tab.dart';
import 'package:flutter_internn/day_4/navigated_page.dart';
import 'package:flutter_internn/day_1/day_one_screen.dart';
class DayFourTask extends StatelessWidget {
  const DayFourTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tabTitle=[
      'Day 2',
      'Day 3',
      'Day 4',
    ];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Assessment 4"),
          centerTitle: true,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  child: Icon(Icons.skip_next,size: 40,),
              onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NavigatedPage(),
                  ),
                  );
                },
              ),
            ),
          ],
          bottom: TabBar(
              tabs: [
            Tab(icon: Icon(Icons.two_wheeler_sharp),
            text: tabTitle[0],
            ),
                Tab(icon: Icon(Icons.three_g_mobiledata_outlined),
                text: tabTitle[1],
                ),
                Tab(icon: Icon(Icons.four_g_mobiledata_sharp),
                text: tabTitle[2],
                )

          ],
          ),
        ),
        body: TabBarView(
            children: [
              DayOneScreen(),
              DayThreeTask(),
             DayFourTab(),
        ]),
      ),
    );
  }
}
