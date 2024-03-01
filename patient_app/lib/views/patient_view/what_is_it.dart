import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mussefy_app/services/ai_api.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WhatIsThis extends StatefulWidget {
  const WhatIsThis({super.key});

  @override
  State<WhatIsThis> createState() => _WhatIsThisState();
}

class _WhatIsThisState extends State<WhatIsThis> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _chatMessages = [];
  final DallEClient _dallEClient = DallEClient(
    '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',
  );
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String mypath = "bb";
  bool _isLoading = false;

  void _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      final result = _uploadImageToSupabase(_image!);
      final response = await Supabase.instance.client.storage
          .from('images')
          .getPublicUrl('folder/${_image}');
      await Future.delayed(const Duration(seconds: 5));
      _addMessage(ChatMessage(isUser: true, message: '', imageUrl: response));
    }
  }

  Future<void> _uploadImageToSupabase(File image) async {
    final response = await Supabase.instance.client.storage
        .from('images')
        .upload('folder/${image!}', File(image!.path));
    print(response);
  }

  Future<void> printpath(File image) async {
    final response = await Supabase.instance.client.storage
        .from('images')
        .getPublicUrl('folder/${image}');
    try {
      final test = await DallEClient("dd").chatbot(mypath);
      print(test);
    } catch (e) {
      print(e);
    }

    print(response);
  }

  void _sendMessage() async {
    String userMessage = _messageController.text.trim();
    final response = await Supabase.instance.client.storage
        .from('images')
        .getPublicUrl('folder/${_image}');
    if (mypath != "") {
      _addMessage(ChatMessage(isUser: true, message: "Waht in the image?"));
      print(response);

      try {
        String responseMessage = await _dallEClient.chatbot(response);
        _addMessage(ChatMessage(isUser: false, message: responseMessage));
      } catch (e) {
        _addMessage(
            ChatMessage(isUser: false, message: 'Failed to get response.'));
        print('Error: $e');
      }

      _messageController.clear();
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
          title: 'AI.title'.tr(),
          centerTitle: true),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: 400,
            height: 200,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                return _chatMessages[index];
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: FloatingActionButton(
                    backgroundColor: Colors.amber,
                    onPressed: _pickImage,
                    child: Icon(
                      Icons.add_a_photo,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 25, 0, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: IconButton(
                      icon: const Icon(Icons.question_mark,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      onPressed: _sendMessage,
                    ),
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
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isUser
                      ? Colors.blue
                      : const Color.fromARGB(255, 6, 32, 54),
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
        ],
      ),
    );
  }
}
