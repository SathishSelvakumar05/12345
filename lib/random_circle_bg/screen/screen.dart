import 'package:flutter/material.dart';
import 'package:new_try/random_circle_bg/custom/custom.dart';

class DynamicAvatarTextScreen extends StatelessWidget {
  const DynamicAvatarTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DynamicAvatarText(
          text: 'Flutter',
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text('Dynamic Avatar Text')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: DynamicAvatarTextScreen(text: 'Flutter'),
//         ),
//       ),
//     ),
//   ));
// }
