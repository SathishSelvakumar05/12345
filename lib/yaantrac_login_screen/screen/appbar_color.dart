import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../custom/text.dart';

class VehicleData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 4, top: 5),
          child: ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.5,
              child: Image.asset('assets/images/favicon256'
                  '.png'),
            ),
          ),
        ),
        title: Text('Yaantrac'),
        backgroundColor: Colors.transparent,
        //  centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CupertinoColors.activeBlue.withOpacity(0.88),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                prefixIcon: Icon(Icons.search),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0),
                                ),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          DropdownButton<String>(
                            hint: Row(
                              children: [
                                Icon(Icons.filter_list),
                                SizedBox(width: 5),
                              ],
                            ),
                            underline: Container(),
                            items: <String>['Option 1', 'Option 2', 'Option 3']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.wifi,
                                  color: Colors.green,
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('TN 29323982'),
                                    Text(
                                      'Live',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/favicon256.png'),
                                  radius: 25,
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Speed :'),
                                Text(
                                  '0.0 Kmph',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Today Distance :'),
                                Text(
                                  '0.50 Km',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Total Distance :'),
                                Text(
                                  '1666.30 Km',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Last Update :'),
                                Text(
                                  '29/10/2024,10:24 AM',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.82),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.wifi,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('TN 29323982'),
                                    Text(
                                      'Offline',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/favicon256.png'),
                                  radius: 25,
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Speed :'),
                                Text(
                                  '0.0 Kmph',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Today Distance :'),
                                Text(
                                  '0.50 Km',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Total Distance :'),
                                Text(
                                  '1666.30 Km',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Last Update :'),
                                Text(
                                  '29/10/2024,10:24 AM',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Text('Current Location :'),
                            //     Flexible(
                            //       child: Text(
                            //         '10/500,Chennai,TamilNadu 627 853 , India',
                            //         style:
                            //             TextStyle(fontWeight: FontWeight.bold),
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.82),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.wifi),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('TN 29323982'),
                                    Text(
                                      'Parked',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/favicon256.png'),
                                  radius: 25,
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Speed :'),
                                Text(
                                  '0.0 Kmph',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Today Distance :'),
                                Text(
                                  '0.50 Km',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Total Distance :'),
                                Text(
                                  '1666.30 Km',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Last Update :'),
                                Text(
                                  '29/10/2024,10:24 AM',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Text('Current Location :'),
                            //     Flexible(
                            //       child: Text(
                            //         '10/500,Chennai,TamilNadu 627 853 , India',
                            //         style:
                            //             TextStyle(fontWeight: FontWeight.bold),
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.82),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.wifi,
                                  color: Colors.brown,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('TN 29323982'),
                                    Text(
                                      'Idle',
                                      style: TextStyle(color: Colors.brown),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/favicon256.png'),
                                  radius: 25,
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Speed :'),
                                Text(
                                  '0.0 Kmph',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Today Distance :'),
                                Text(
                                  '0.50 Km',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Total Distance :'),
                                Text(
                                  '1666.30 Km',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Last Update :'),
                                Text(
                                  '29/10/2024,10:24 AM',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Text('Current Location :'),
                            //     Flexible(
                            //       child: Text(
                            //         '10/500,Chennai,TamilNadu 627 853 , India',
                            //         style:
                            //             TextStyle(fontWeight: FontWeight.bold),
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
