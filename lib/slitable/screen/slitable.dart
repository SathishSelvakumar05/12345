import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List datas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Slidable(
            closeOnScroll: true,
            // enabled: true,
            //  useTextDirection: false,
            //  dragStartBehavior: DragStartBehavior.start,
            startActionPane: ActionPane(
              extentRatio: 0.5,
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (val) {},
                  backgroundColor: Colors.blue.withOpacity(0.54),
                  icon: Icons.edit,
                  label: 'Edit',
                  autoClose: true,
                ),
                SlidableAction(
                  onPressed: (val) {},
                  backgroundColor: Colors.green.withOpacity(0.6),
                  icon: Icons.remove_red_eye,
                  label: 'View',
                ),
              ],
            ),
            endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: BehindMotion(),
              children: [
                SlidableAction(
                  foregroundColor: Colors.white,
                  spacing: 1,
                  onPressed: (val) {
                    datas.add(val);
                    print('value${val.toString()}');
                  },
                  backgroundColor: Colors.red.withOpacity(0.77),
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Card(
              child: ListTile(
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                leading: CircleAvatar(),
                title: Text(
                  'SATHISH',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('KUMAR '),
              ),
            ),
          );
        },
      ),
    );
  }
}
