import 'package:flutter/material.dart';
import 'package:hopeon_app/screens/driver_screens/DriverBottomNavBar.dart';
import 'package:hopeon_app/screens/driver_screens/DriverSelectedChatScreen.dart';

class DriverChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {
      "name": "John Doe",
      "message": "Hey, how are you?",
      "time": "10:30 AM",
      "unread": 2,
      "image": "https://i.pravatar.cc/150?img=1",
    },
    {
      "name": "Alice Smith",
      "message": "See you soon!",
      "time": "9:15 AM",
      "unread": 0,
      "image": "https://i.pravatar.cc/150?img=2",
    },
    {
      "name": "Michael Brown",
      "message": "Can we reschedule?",
      "time": "8:45 AM",
      "unread": 1,
      "image": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "David Johnson",
      "message": "Check this out!",
      "time": "Yesterday",
      "unread": 3,
      "image": "https://i.pravatar.cc/150?img=4",
    },
    {
      "name": "Alice Smith",
      "message": "See you soon!",
      "time": "9:15 AM",
      "unread": 0,
      "image": "https://i.pravatar.cc/150?img=2",
    },
    {
      "name": "Michael Brown",
      "message": "Can we reschedule?",
      "time": "8:45 AM",
      "unread": 1,
      "image": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "David Johnson",
      "message": "Check this out!",
      "time": "Yesterday",
      "unread": 3,
      "image": "https://i.pravatar.cc/150?img=4",
    },
    {
      "name": "Alice Smith",
      "message": "See you soon!",
      "time": "9:15 AM",
      "unread": 0,
      "image": "https://i.pravatar.cc/150?img=2",
    },
    {
      "name": "Michael Brown",
      "message": "Can we reschedule?",
      "time": "8:45 AM",
      "unread": 1,
      "image": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "David Johnson",
      "message": "Check this out!",
      "time": "Yesterday",
      "unread": 3,
      "image": "https://i.pravatar.cc/150?img=4",
    },
    {
      "name": "Alice Smith",
      "message": "See you soon!",
      "time": "9:15 AM",
      "unread": 0,
      "image": "https://i.pravatar.cc/150?img=2",
    },
    {
      "name": "Michael Brown",
      "message": "Can we reschedule?",
      "time": "8:45 AM",
      "unread": 1,
      "image": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "David Johnson",
      "message": "Check this out!",
      "time": "Yesterday",
      "unread": 3,
      "image": "https://i.pravatar.cc/150?img=4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text("Chats", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
        ),
        backgroundColor: Color.fromRGBO(37, 100, 255, 1.0),
        automaticallyImplyLeading: false, // Removes the back button
        toolbarHeight: 100.0, // Increases the height of the AppBar
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            style: ListTileStyle.drawer,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chat['image']),
              radius: 28,
            ),
            title: Text(
              chat['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              chat['message'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[600]),
            ),
            trailing: SizedBox(
              width: 60, // Fixed width to prevent shifting
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end, // Aligns text to the right
                children: [
                  Text(
                    chat['time'],
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  if (chat['unread'] > 0)
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        chat['unread'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DriverSelectedChatScreen()),
              );
            },
          );
        },
      ),
      bottomNavigationBar: DriverBottomNavBar(selectedScreen: 2),
    );
  }
}
