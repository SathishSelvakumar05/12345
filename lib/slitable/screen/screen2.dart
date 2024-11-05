import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListScreen extends StatefulWidget {
  @override
  _SlidableListScreenState createState() => _SlidableListScreenState();
}

class _SlidableListScreenState extends State<SlidableListScreen> {
  List<String> items = List.generate(25, (index) => 'Item ${index + 1}');
  String? recentlyDeletedItem;
  int? recentlyDeletedItemIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slidable List with Undo'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final data = items[index];
          return Slidable(
            //  key: ValueKey(index),
            endActionPane: ActionPane(
              dragDismissible: true,
              extentRatio: 0.2,
              dismissible: Text('ushauhsauhsuahs'),
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  spacing: 0.9,
                  autoClose: true,
                  onPressed: (context) => deleteItem(context, index),
                  backgroundColor: Colors.red.withOpacity(0.88),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  // label: 'Delete',
                ),
              ],
            ),
            child: ListTile(
              title: Text('${data}'),
            ),
          );
        },
      ),
    );
  }

  void deleteItem(BuildContext context, int index) {
    recentlyDeletedItem = items[index];
    recentlyDeletedItemIndex = index;

    setState(() {
      items.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Deleted ${recentlyDeletedItem!}'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              items.insert(recentlyDeletedItemIndex!, recentlyDeletedItem!);
            });
          },
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
