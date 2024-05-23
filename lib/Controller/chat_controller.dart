import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import '../Config/Config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatController {
  Future<void> sendMessage(String query, Function(String) onResponse) async {
    final String uid = Uuid().v4();
    print('Generated UUID: $uid'); // Print the generated UUID
    final url = Uri.parse('${Config.baseUrl}/chat/init_response_stream');
    print('Query: $query'); // Print the query
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Config.token}',
        },
        body: jsonEncode({
          "uid": uid,
          "query": query,
          "summary": "",
          "location": "null",
          "config": {
            "model_type": "Gemini Pro",
            "input_lang": "english",
            "output_lang": "english"
          },
          "components": []
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["type"] == "success") {
          final streamUrl = Uri.parse('${Config.baseUrl}/chat/stream/$uid');
          _fetchResponse(streamUrl, onResponse);
        } else {
          throw Exception("Failed to initialize chat response stream");
        }
      } else {
        throw Exception("Failed to send message: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  Future<void> _fetchResponse(Uri url, Function(String) onResponse) async {
    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${Config.token}',
      });

      if (response.statusCode == 200) {
        final responseBody = response.body;
        String finalResponse = _extractFinalResponse(responseBody);
        if (finalResponse.isNotEmpty) {
          onResponse(finalResponse);
        } else {
          onResponse("Error: Failed to parse response");
        }
        print(finalResponse);
      } else {
        throw Exception("Failed to fetch chat response: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  String _extractFinalResponse(String response) {
    final regex = RegExp(r'data: \[final-res\](.*)');
    final matches = regex.allMatches(response);

    for (var match in matches) {
      if (match.groupCount > 0) {
        return match.group(1)!.trim();
      }
    }
    return "";
  }

  Future<void> saveMessages(List<Map<String, String>> messages) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> messagesList = messages.map((message) => jsonEncode(message)).toList();
    await prefs.setStringList('chat_messages', messagesList);
  }

  Future<List<Map<String, String>>> loadMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? messagesList = prefs.getStringList('chat_messages');
    if (messagesList == null) return [];
    return messagesList.map((message) => Map<String, String>.from(jsonDecode(message))).toList();
  }
}
