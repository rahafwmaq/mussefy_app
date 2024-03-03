import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mussefy_app/services/ai_api.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_view/chat_wedget.dart';
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

  void _tosend() async {}

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
      _addMessage(
          const ChatMessage(isUser: true, message: "Waht in the image?"));
      print(response);

      try {
        String responseMessage = await _dallEClient.chatbot(response);
        _addMessage(ChatMessage(isUser: false, message: responseMessage));
      } catch (e) {
        _addMessage(const ChatMessage(
            isUser: false, message: 'Failed to get response.'));
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
          title: 'patient_home_screen.pharmacist_ai'.tr(),
          centerTitle: true),
      body: Column(
        children: [
          height30,
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                return _chatMessages[index];
              },
            ),
          ),
          const Divider(
            height: 1,
            indent: 2,
            color: red,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.getWidth(divide: 3),
                  height: context.getHeight(divide: 10),
                  child: FloatingActionButton(
                    backgroundColor: redTransit,
                    onPressed: _pickImage,
                    child: const Icon(
                      Icons.add_a_photo,
                      color: white,
                      size: 50,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    color: blueTransit,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: context.getWidth(divide: 3),
                    height: context.getHeight(divide: 10),
                    child: IconButton(
                      icon: const Icon(
                        Icons.question_mark,
                        color: white,
                        size: 50,
                      ),
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
