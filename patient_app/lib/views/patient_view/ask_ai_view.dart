import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/services/chat_api.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_view/chat_wedget.dart';

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
      appBar: customAppBar(
          context: context,
          widget: Container(),
          title: 'patient_home_screen.doctor_ai'.tr()),
      body: Column(
        children: [
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
                  child: TextFormFieldWidget(
                    controller: _messageController,
                    obscureText: false,
                    onTap: _scrollToBottom,
                    hintText: 'patient_home_screen.hint_ai_chat'.tr(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, size: 30, color: red),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
