import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String? userImage;
  final String? username;

  const MessageBubble.first({
    super.key,
    required this.message,
    required this.isMe,
    this.userImage,
    this.username,
  });

  const MessageBubble.next({
    super.key,
    required this.message,
    required this.isMe,
  }) : userImage = null, username = null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe && userImage != null)
            CircleAvatar(
              backgroundImage: NetworkImage(userImage!),
              radius: 16,
            ),
          if (!isMe && userImage != null)
            SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMe && username != null)
                  Text(
                    username!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                Text(
                  message,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}