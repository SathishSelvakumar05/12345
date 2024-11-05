import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_try/trip_booking/custom/help_desk.dart';

import '../../custom/bold_text.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1>
    with TickerProviderStateMixin {
  Map ImageList = {
    "assets/images/air.jpg": "Air",
    'assets/images/default.jpg': 'Air',
    'assets/images/water.jpg': 'Air',
    'assets/images/streetlight.jpg': 'light',
    "assets/images/dowload.gif": "downloading",
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                HelpDesk(
                  onpressed: () {
                    Navigator.of(context).pop();
                    print('clicked helpdesk');
                  },
                  text:
                      'This is a help section explaining how to use the app. You can provide instructions here.',
                ),
                //  const Icon(Icons.menu),
                Spacer(),
                CircleAvatar(
                  child: Icon(Icons.ac_unit),
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.orange,
                  radius: 22,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: BoldText(txt: 'Discover'),
          ),
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TabBar(
              labelColor: Colors.black,
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              controller: tabController,
              dividerColor: Colors.blueGrey,
              dividerHeight: 0,
              tabs: [
                Tab(text: 'Places'),
                Tab(text: 'Inspiration'),
                Tab(text: 'Emotion'),
                Tab(text: 'Settings'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      height: 200,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/streetlight.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'SATHISH',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/air.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'SATHISH',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      height: 200,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/default.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'SATHISH',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      height: 200,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/water.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'SATHISH',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 30,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                BoldText(txt: 'Welcome'),
                Spacer(),
                Icon(Icons.accessible_forward_sharp),
              ],
            ),
          ),
          SizedBox(height: 12),
          Container(
            height: 100,
            margin: EdgeInsets.only(left: 23),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ImageList.length,
              itemBuilder: (context, indexuh) {
                return Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              '${ImageList.keys.elementAt(indexuh)}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${ImageList.values.elementAt(indexuh)}'),
                    // Text('${datas[indexuh]}'),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final datas = List.generate(
    10,
    (index) => 'NO:${index + 1}',
  );
}
//
//
// import 'package:flutter/material.dart';
// import 'package:showcaseview/showcaseview.dart';
//
// import 'package:flutter/material.dart';
// import 'package:showcaseview/showcaseview.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final GlobalKey _iconButtonKey = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Future.delayed(Duration(milliseconds: 200), () {
//         ShowCaseWidget.of(context).startShowCase([_iconButtonKey]);
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ShowCaseWidget(
//       autoPlayDelay: const Duration(seconds: 3),
//       autoPlay: true,
//       builder: (context) => Scaffold(
//         appBar: AppBar(
//           title: Text("Showcase Example"),
//           actions: [
//             Showcase(
//               key: _iconButtonKey,
//               description: 'Need help?',
//               descTextStyle: TextStyle(color: Colors.redAccent),
//               child: IconButton(
//                 icon: Icon(Icons.help_outline),
//                 onPressed: () {
//                   showDialog(
//                     barrierColor: Color(0x01000000),
//                     context: context,
//                     builder: (BuildContext context) {
//                       return Transform.translate(
//                         offset: Offset(40, -263), // Custom position
//                         child: AlertDialog(
//                           clipBehavior: Clip.hardEdge,
//                           backgroundColor: Colors.white60,
//                           shape: Border(),
//                           content: Text(
//                             "This is a help section explaining how to use the app. You can provide instructions here.",
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//         body: Center(child: Text("ShowcaseView Example")),
//       ),
//     );
//   }
// }
