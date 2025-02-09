import 'package:flutter/material.dart';
import 'package:hopeon_app/models/message_model.dart';
import 'package:hopeon_app/screens/common_screens/MessageBubble.dart';
import 'package:hopeon_app/services/chat_service.dart';

class ChatDetailScreen extends StatefulWidget {
  final ChatService chatService;
  final String otherUserId;
  final String otherUserName;

  ChatDetailScreen({
    required this.chatService,
    required this.otherUserId,
    required this.otherUserName,
  });

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Mark all messages from this sender as read when opening the chat
    widget.chatService.markAllMessagesAsRead(widget.otherUserId);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<List<Message>>(
            stream: widget.chatService.getMessages(widget.otherUserId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              final messages = snapshot.data!;
              return ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isMe = message.senderId == widget.chatService.currentUserId;

                  return MessageBubble(
                    message: message.content,
                    isMe: isMe,
                    senderImage: message.senderImageUrl,
                  );
                },
              );
            },
          ),
        ),
        MessageInput(
          controller: _messageController,
          onSend: () {
            if (_messageController.text.trim().isNotEmpty) {
              widget.chatService.sendMessage(
                content: _messageController.text,
                receiverId: widget.otherUserId,
                isGlobal: false,
                senderName: "Current User Name", // Get from user profile
                senderImageUrl: "Current User Image", // Get from user profile
              );
              _messageController.clear();
            }
          },
        ),
      ],
    );
  }
}