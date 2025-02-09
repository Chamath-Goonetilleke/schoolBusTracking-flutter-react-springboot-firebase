import 'package:flutter/material.dart';
import 'package:hopeon_app/services/trip_service.dart';

class DriverTripProgressScreen extends StatefulWidget {
  final Map<String, dynamic> trip;

  const DriverTripProgressScreen({super.key, required this.trip});

  @override
  State<DriverTripProgressScreen> createState() =>
      _DriverTripProgressScreenState();
}

class _DriverTripProgressScreenState extends State<DriverTripProgressScreen> {
  late bool isStart;
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
  final TripService _tripService = TripService();

  late Map<String, dynamic> tripData;
  bool _isLoading = false;

  void _handleStartTrip() async {
    setState(() {
      _isLoading = true;
    });

    Map<String, dynamic> res = await _tripService.saveTrip({
      "tripDate": DateTime.now().toIso8601String().split("T")[0],
      "type": tripData['type'],
      "driverId": tripData["driverId"]
    });
    if (res['success']) {
      setState(() {
        tripData = res['body'];
        _isLoading = false;
        isStart = true;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    print(widget.trip);
    setState(() {
      tripData = widget.trip;
      isStart = widget.trip["status"] == "PENDING" ? false : true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "To School - ${DateTime.now().toIso8601String().split("T")[0]}"),
      ),
      body: isStart
          ? Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Pick All students to complete",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Expanded(
                  // Add this to constrain ListView's height
                  child: ListView.builder(
                    itemCount: tripData["attendanceList"].length,
                    itemBuilder: (context, index) {
                      final std = tripData["attendanceList"][index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=4"),
                          radius: 28,
                        ),
                        title: Text(
                          std['fullName'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text(
                        //   std['contactNo'],
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        //   style: TextStyle(color: Colors.grey[600]),
                        // ),
                        trailing: SizedBox(
                            child: Checkbox(
                          value: std['picked'],
                          onChanged: (value) {},
                        )),
                      );
                    },
                  ),
                ),
              ],
            )
          : Center(
              child: MaterialButton(
                padding: const EdgeInsets.all(10),
                color: const Color.fromRGBO(37, 100, 255, 1.0),
                onPressed: _handleStartTrip,
                minWidth: 300,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Start Trip",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
    );
  }
}
