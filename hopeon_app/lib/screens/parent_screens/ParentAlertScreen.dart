import 'package:flutter/material.dart';

class ParentAlertScreen extends StatefulWidget {
  const ParentAlertScreen({super.key});

  @override
  State<ParentAlertScreen> createState() => _ParentAlertScreenState();
}

class _ParentAlertScreenState extends State<ParentAlertScreen> {
  final List<Map<String, String>> alerts = [
    {
      "date": "2025/02/14 - 07:15AM",
      "message": "This is an important message regarding your child's school bus. Due to an unforeseen situation, the bus is experiencing a delay. We are experiencing an emergency situation with the school bus. Please know that all students are safe, and we are working to resolve the issue as quickly as possible. There may be a delay in the bus's arrival. We will send another update soon."
    },
    {
      "date": "2025/02/12 - 06:45AM",
      "message": "This is an urgent update regarding your child's bus. We are currently facing an unexpected issue, and the bus will be delayed. The safety of all students is our top priority, and we are addressing the situation. We will provide you with more information as it becomes available."
    },
    {
      "date": "2025/02/08 - 02:05PM",
      "message": "This is a quick update about your child's bus. Due to an emergency, there is a delay in the bus's route."
    },
    {
      "date": "2025/02/05 - 01:45PM",
      "message": "We are experiencing an emergency situation with the school bus. Please know that all students are safe and we are working to resolve the issue as......"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 1),
            child: ExpansionTile(
              leading: const Icon(Icons.warning, color: Colors.red),
              title: Text(
                alerts[index]['date']!,
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(alerts[index]['message']!),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
