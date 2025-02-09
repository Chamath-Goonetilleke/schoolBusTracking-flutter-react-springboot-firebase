import 'package:flutter/material.dart';
import 'package:hopeon_app/models/message_model.dart';
import 'package:hopeon_app/services/chat_service.dart';

class GlobalMessageScreen extends StatefulWidget {
  final ChatService chatService;

  const GlobalMessageScreen({
    Key? key,
    required this.chatService,
  }) : super(key: key);

  @override
  _GlobalMessageScreenState createState() => _GlobalMessageScreenState();
}

class _GlobalMessageScreenState extends State<GlobalMessageScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Announcements'),
        backgroundColor: Color.fromRGBO(37, 100, 255, 1.0),
      ),
      body: Column(
        children: [
          // Global announcement input (only visible for drivers)
          if (widget.chatService.currentUserId.startsWith('driver_')) // Adjust this condition based on your user type check
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[100],
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type announcement...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(37, 100, 255, 1.0),
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        if (_messageController.text.trim().isNotEmpty) {
                          widget.chatService.sendMessage(
                            content: _messageController.text,
                            receiverId: 'all', // Special receiver ID for global messages
                            isGlobal: true,
                            senderName: 'Driver Name', // Replace with actual driver name
                            senderImageUrl: 'Driver Image URL', // Replace with actual driver image
                          );
                          _messageController.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

          // Global messages list
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: widget.chatService.getGlobalMessages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      'No announcements yet',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.all(16),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final message = snapshot.data![index];
                    return GlobalMessageCard(message: message);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

class GlobalMessageCard extends StatelessWidget {
  final Message message;

  const GlobalMessageCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with driver info and timestamp
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(message.senderImageUrl),
                  radius: 20,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.senderName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        _formatDate(message.timestamp),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Message content
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                message.content,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays == 1) {
      return 'Yesterday ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } else {
      return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    }
  }
}

