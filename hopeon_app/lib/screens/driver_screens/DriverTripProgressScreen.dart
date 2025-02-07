import 'package:flutter/material.dart';

class DriverTripProgressScreen extends StatefulWidget {
  const DriverTripProgressScreen({super.key});

  @override
  State<DriverTripProgressScreen> createState() =>
      _DriverTripProgressScreenState();
}

class _DriverTripProgressScreenState extends State<DriverTripProgressScreen> {
  bool isStart = true;
  final List<Map<String, dynamic>> chats = [
    {
      "name": "John Doe",
      "contactNo": "Hey, how are you?",
      "time": "10:30 AM",
      "unread": 2,
      "image": "https://i.pravatar.cc/150?img=1",
    },
    {
      "name": "Alice Smith",
      "contactNo": "See you soon!",
      "time": "9:15 AM",
      "unread": 0,
      "image": "https://i.pravatar.cc/150?img=2",
    },
    {
      "name": "Michael Brown",
      "contactNo": "Can we reschedule?",
      "time": "8:45 AM",
      "unread": 1,
      "image": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "David Johnson",
      "contactNo": "Check this out!",
      "time": "Yesterday",
      "unread": 3,
      "image": "https://i.pravatar.cc/150?img=4",
    },
    {
      "name": "Alice Smith",
      "contactNo": "See you soon!",
      "time": "9:15 AM",
      "unread": 0,
      "image": "https://i.pravatar.cc/150?img=2",
    },
    {
      "name": "Michael Brown",
      "contactNo": "Can we reschedule?",
      "time": "8:45 AM",
      "unread": 1,
      "image": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "David Johnson",
      "contactNo": "Check this out!",
      "time": "Yesterday",
      "unread": 3,
      "image": "https://i.pravatar.cc/150?img=4",
    },
    {
      "name": "Alice Smith",
      "contactNo": "See you soon!",
      "time": "9:15 AM",
      "unread": 0,
      "image": "https://i.pravatar.cc/150?img=2",
    },
    {
      "name": "Michael Brown",
      "contactNo": "Can we reschedule?",
      "time": "8:45 AM",
      "unread": 1,
      "image": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "David Johnson",
      "contactNo": "Check this out!",
      "time": "Yesterday",
      "unread": 3,
      "image": "https://i.pravatar.cc/150?img=4",
    },
    {
      "name": "Alice Smith",
      "contactNo": "See you soon!",
      "time": "9:15 AM",
      "unread": 0,
      "image": "https://i.pravatar.cc/150?img=2",
    },
    {
      "name": "Michael Brown",
      "contactNo": "Can we reschedule?",
      "time": "8:45 AM",
      "unread": 1,
      "image": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "David Johnson",
      "contactNo": "Check this out!",
      "time": "Yesterday",
      "unread": 3,
      "image": "https://i.pravatar.cc/150?img=4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To School - 2025-02-07"),
      ),
      body: isStart
          ? Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Pick All students to complete",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
          ),
          Expanded( // Add this to constrain ListView's height
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chat['image']),
                    radius: 28,
                  ),
                  title: Text(
                    chat['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    chat['contactNo'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: SizedBox(
                    child: Checkbox(value: true, onChanged: (value){

                    }, )
                    ),
                  );
              },
            ),
          ),
        ],
      )
          : Center(
        child: MaterialButton(
          padding: EdgeInsets.all(10),
          color: const Color.fromRGBO(37, 100, 255, 1.0),
          onPressed: () {},
          minWidth: 300,
          child: Text("Start Trip",
              style: const TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),

    );
  }
}
