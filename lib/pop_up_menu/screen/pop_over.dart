// import 'package:flutter/material.dart';
// import 'package:popover/popover.dart';
//
// class PopOver extends StatelessWidget {
//   const PopOver({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: GestureDetector(
//           onTap: () => showPopover(
//             backgroundColor: Colors.orangeAccent,
//             //height: 10,
//             //width: 20,
//             //   direction: PopoverDirection.top,
//             context: context,
//             bodyBuilder: (context) {
//               return Column(
//                 children: [
//                   Container(
//                     child: Row(
//                       children: [
//                         IconButton(onPressed: () {}, icon: Icon(Icons.edit))
//                       ],
//                     ),
//                     // height: 50,
//                     color: Colors.deepPurple.shade300,
//                   ),
//                   IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
//                   Container(
//                     child: Row(
//                       children: [
//                         IconButton(onPressed: () {}, icon: Icon(Icons.edit))
//                       ],
//                     ),
//                     height: 50,
//                     color: Colors.deepPurple.shade300,
//                   ),
//                 ],
//               );
//             },
//           ),
//           child: Icon(Icons.more_vert),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
      ),
      child: GestureDetector(
        child: const Center(child: Text('Click Me')),
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => const ListItems(),
            onPop: () => print('Popover was popped!'),
            direction: PopoverDirection.bottom,
            width: 200,
            height: 400,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.of(context)
              //   ..pop()
              //   ..push(
              //     MaterialPageRoute<SecondRoute>(
              //       builder: (context) => SecondRoute(),
              //     ),
              //   );
            },
            child: Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry A')),
            ),
          ),
          const Divider(),
          Container(
            height: 50,
            color: Colors.amber[200],
            child: const Center(child: Text('Entry B')),
          ),
          const Divider(),
          Container(
            height: 50,
            color: Colors.amber[300],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}
