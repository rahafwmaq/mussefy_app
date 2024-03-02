import 'package:flutter/material.dart';

import 'package:mussefy_app/services/ai_api.dart';
import 'package:mussefy_app/services/chat_api.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_view/chat_wedget.dart';
import 'package:mussefy_app/views/patient_view/what_is_it.dart';

class AskAIView extends StatefulWidget {
  const AskAIView({Key? key}) : super(key: key);

  @override
  _AskAIViewState createState() => _AskAIViewState();
}

class _AskAIViewState extends State<AskAIView> with WidgetsBindingObserver {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _chatMessages = [];
  ScrollController _scrollController = ScrollController();
  final Chating _Chating = Chating(
    'YourAPITokenHere',
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Add observer here
    _messageController.addListener(_scrollToBottom);
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    WidgetsBinding.instance.removeObserver(this); // Remove observer here
    super.dispose();
  }

  // Implement didChangeMetrics to react to changes
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final value = MediaQuery.of(context).viewInsets.bottom;
    if (value > 0) {
      // Keyboard is visible
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() async {
    String userMessage = _messageController.text.trim();
    if (userMessage.isNotEmpty) {
      _addMessage(ChatMessage(isUser: true, message: userMessage));

      try {
        String responseMessage = await _Chating.chatbot(userMessage);
        _addMessage(ChatMessage(isUser: false, message: responseMessage));
      } catch (e) {
        _addMessage(
            ChatMessage(isUser: false, message: 'Failed to get response.'));
        print('Error: $e');
      }

      // Clear the message controller to reset the text field
      _messageController.clear();
      // Unfocus the text field to hide the keyboard
      FocusScope.of(context).unfocus();

      // Ensure the last message is visible after sending
      _scrollToBottom();
    }
  }

  void _addMessage(ChatMessage message) {
    setState(() {
      _chatMessages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: context.getWidth(divide: 1),
            height: context.getHeight(divide: 4.6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Row(
                children: [
                  width16,
                  Container(
                    height: context.getHeight(divide: 10),
                    width: context.getWidth(divide: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                      ),
                    ),
                  ),
                  width20,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height38,
                      height10,
                      Text(
                        "Ai doctor ",
                        style: TextStyle(fontSize: 34),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        size: 35,
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                return _chatMessages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'اكتب رسالتك هنا ...',
                      border: OutlineInputBorder(),
                    ),
                    onTap: _scrollToBottom,
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: context.getWidth(divide: 6),
                  height: context.getHeight(divide: 15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 64, 5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send,
                        size: 30, color: Color.fromARGB(255, 255, 255, 255)),
                    onPressed: _sendMessage,
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
