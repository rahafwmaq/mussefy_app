import 'package:flutter/material.dart';
import 'package:mussefy_app/view_layout/color.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isUser;
  final String? imageUrl; // Added to support image URLs

  const ChatMessage({
    Key? key,
    required this.message,
    required this.isUser,
    this.imageUrl, // Can be null for text messages
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isImage = imageUrl != null;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (isImage)
            Image.network(
              imageUrl!,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            )
          else
            Flexible(
              // Wrapping the Container with Flexible
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isUser ? blueTransit : redTransit,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                    maxLines: null,
                    softWrap: true,
                    overflow: TextOverflow
                        .visible, // Changed to visible to avoid clipping
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
