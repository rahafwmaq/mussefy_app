import 'dart:convert';
import 'package:http/http.dart' as http;

class Chating {
  final String apiKey;
  final http.Client client;
  final String apiUrl = 'https://api.openai.com/v1/chat/completions';

  Chating(this.apiKey) : client = http.Client();

  Future<String> chatbot(String prompt) async {
    if (prompt.isEmpty) {
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
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content":
                    " You are a doctor  in an app called Musaffy. You will help people with their problems as a doctor."
              },
              {"role": "user", "content": prompt}
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
