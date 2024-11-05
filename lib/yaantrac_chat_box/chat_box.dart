// import 'package:flutter/material.dart';
// import 'package:chat_bubbles/chat_bubbles.dart';
//
// class ChatPage extends StatefulWidget {
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   final TextEditingController _controller = TextEditingController();
//   final List<Map<String, String>> messages = [];
//
//   final List<String> keywords = [
//     'hii',
//     'what is yaantrac',
//     'how does yaantrac monitor vehicle fuel percentage',
//     'how can i create a geofence',
//     'what are the features of yaantrac'
//   ];
//
//   final List<String> responses = [
//     'Welcome You Yaantrac Assistant How Can I help You ?',
//     'Yaantrac is a vehicle tracking application that allows you to monitor various aspects of your vehicles, including fuel percentage and location.',
//     'Yaantrac monitors vehicle fuel percentage by integrating with the vehicle\'s onboard diagnostics, providing real-time data on fuel levels.',
//     'To create a geofence in Yaantrac, open the features screen, navigate to the geofence option, and choose either "Circle" or "Polygon." The map will open, allowing you to draw your desired geofence area.',
//     'Some key features of Yaantrac include real-time vehicle tracking, fuel monitoring, geofencing, and detailed reporting on vehicle performance.'
//   ];
//
//   void _sendMessage(String text) {
//     setState(() {
//       messages.add({"sender": "user", "message": text});
//       String response = getResponse(text.toLowerCase());
//       messages.add({"sender": "bot", "message": response});
//     });
//     _controller.clear();
//   }
//
//   String getResponse(String input) {
//     for (int i = 0; i < keywords.length; i++) {
//       if (input.contains(keywords[i])) {
//         return responses[i];
//       }
//     }
//     return "I don't understand that. Can you ask something else?";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Yaantrac Assistant 🚗"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 var msg = messages[index];
//                 return BubbleSpecialOne(
//                   text: msg['message']!,
//                   isSender: msg['sender'] == 'user',
//                   color: msg['sender'] == 'user'
//                       ? Colors.blueAccent
//                       : Colors.grey.shade200,
//                   textStyle: TextStyle(
//                     color:
//                         msg['sender'] == 'user' ? Colors.white : Colors.black87,
//                     fontSize: 16,
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(
//                       hintText: "Type your message...",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     if (_controller.text.isNotEmpty) {
//                       _sendMessage(_controller.text);
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
