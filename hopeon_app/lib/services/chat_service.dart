import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hopeon_app/models/message_model.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String currentUserId;

  ChatService({required this.currentUserId});

  // Send a message
  Future<void> sendMessage({
    required String content,
    required String receiverId,
    required bool isGlobal,
    required String senderName,
    required String senderImageUrl,
  }) async {
    final String messageId = _firestore.collection('messages').doc().id;
    final message = Message(
      id: messageId,
      senderId: currentUserId,
      receiverId: receiverId,
      content: content,
      timestamp: DateTime.now(),
      isGlobal: isGlobal,
      senderName: senderName,
      senderImageUrl: senderImageUrl,
    );

    await _firestore.collection('messages').doc(messageId).set(message.toMap());
  }

  // Get chat list for driver (all students' parents)
  Stream<List<Map<String, dynamic>>> getDriverChatList(String vehicleId) {
    return _firestore
        .collection('students')
        .where('vehicle_id', isEqualTo: vehicleId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final student = doc.data();
        return {
          'parentId': student['parent_id'],
          'parentName': student['parent_name'],
          'studentName': student['full_name'],
          'imageUrl': student['image_url'],
        };
      }).toList();
    });
  }

  // Get messages between two users
  Stream<List<Message>> getMessages(String otherUserId) {
    return _firestore
        .collection('messages')
        .where('isGlobal', isEqualTo: false)
        .where(Filter.or(
      Filter.and(
        Filter('senderId', isEqualTo: currentUserId),
        Filter('receiverId', isEqualTo: otherUserId),
      ),
      Filter.and(
        Filter('senderId', isEqualTo: otherUserId),
        Filter('receiverId', isEqualTo: currentUserId),
      ),
    ))
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Message.fromMap(doc.data()))
          .toList();
    });
  }

  Future<void> markMessageAsRead(String messageId) async {
    await _firestore
        .collection('messages')
        .doc(messageId)
        .update({'isRead': true});
  }

  // Method to mark all messages from a sender as read
  Future<void> markAllMessagesAsRead(String senderId) async {
    final messages = await _firestore
        .collection('messages')
        .where('senderId', isEqualTo: senderId)
        .where('receiverId', isEqualTo: currentUserId)
        .where('isRead', isEqualTo: false)
        .get();

    final batch = _firestore.batch();
    for (var doc in messages.docs) {
      batch.update(doc.reference, {'isRead': true});
    }
    await batch.commit();
  }


  // Get global messages
  Stream<List<Message>> getGlobalMessages() {
    return _firestore
        .collection('messages')
        .where('isGlobal', isEqualTo: true)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Message.fromMap(doc.data()))
          .toList();
    });
  }
}