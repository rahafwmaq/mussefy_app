import 'dart:convert';
import 'package:http/http.dart' as http;

final openaiApiKey = "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";

class DallEClient {
  final String apiKey;
  final http.Client client;
  final String apiUrl = 'https://api.openai.com/v1/chat/completions';

  DallEClient(this.apiKey) : client = http.Client();

  Future<String> chatbot(String imagepath) async {
    if (imagepath.isEmpty) {
      throw Exception('Prompt is empty. You must provide a prompt.');
    }

    try {
      var response = await client.post(Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':
                'Bearer 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',
          },
          body: jsonEncode(<String, dynamic>{
            "model": "gpt-4-vision-preview",
            "messages": [
              {
                "role": "user",
                "content": [
                  {"type": "text", "text": "What’s in this image?"},
                  {
                    "type": "image_url",
                    "image_url": {"url": "$imagepath"}
                  }
                ]
              }
            ],
          }));

      if (response.statusCode == 200) {
        var data = json.decode(utf8.decode(response.bodyBytes));
        if (data['choices'] != null && data['choices'].isNotEmpty) {
          return data['choices'][0]['message']['content'];
        } else {
          throw Exception('Response parsing failed');
        }
      } else {
        throw Exception('Failed to generate text: ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  void close() {
    client.close();
  }
}
