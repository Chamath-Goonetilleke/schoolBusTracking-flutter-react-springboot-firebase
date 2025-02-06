import 'package:flutter/material.dart';
import 'package:hopeon_app/screens/parent_screens/ParentBottomNavBar.dart';

class DriverChatScreen extends StatefulWidget {
  @override
  _DriverChatScreenState createState() => _DriverChatScreenState();
}

class _DriverChatScreenState extends State<DriverChatScreen> {
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hi, good morning. Is the bus running on time today?', 'isMe': true},
    {'text': 'Good morning! Yes, the bus is on schedule and will reach your stop at 7:45 AM.', 'isMe': false},
    {'text': 'Thank you for confirming. Is there any delay on the route today?', 'isMe': true},
    {'text': 'No delays so far, but I’ll notify you if anything changes.', 'isMe': false},
    {'text': 'Great! Also, could you please remind my child to take their lunchbox from the bag?', 'isMe': true},
    {'text': 'Sure, I’ll inform them as soon as they board.', 'isMe': false},
    {'text': 'Thanks a lot for your help and Kindness!', 'isMe': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Chat Header
          Container(
            width: double.infinity,
            color: const Color.fromRGBO(37, 100, 255, 1.0),
            padding: const EdgeInsets.fromLTRB(30, 80, 10, 20),
            child: const Text(
              "Chat with Driver",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),

          // Chat Messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                bool isMe = message['isMe'];

                return Padding(
                  padding: message['isMe'] ? const EdgeInsets.fromLTRB(70, 0, 0, 10):const EdgeInsets.fromLTRB(0, 0, 70, 10),
                  child: Row(
                    mainAxisAlignment:
                    isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (!isMe) // Driver's Avatar (Left)
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/2922/2922510.png"), // Replace with your driver image
                        ),

                      // Message Bubble
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.blue[200] : Colors.grey[300],
                            borderRadius: BorderRadius.only(topLeft: const Radius.circular(10), topRight: const Radius.circular(10), bottomLeft: isMe ?const Radius.circular(10): Radius.zero, bottomRight: isMe ? Radius.zero:Radius.circular(10)),
                          ),
                          child: Text(
                            message['text'],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),


                      if (isMe) // Parent's Avatar (Right)
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/2922/2922561.png"), // Replace with your parent image
                        ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Message Input
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const ParentBottomNavBar(selectedScreen: 2),
    );
  }
}
