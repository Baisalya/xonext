import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import '../Config/Config.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class ChatController {
  Future<void> sendMessage(String query, Function(String) onResponse) async {
    final String uid = Uuid().v4();
    final url = Uri.parse('${Config.baseUrl}/chat/init_response_stream');

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
      ).timeout(const Duration(seconds: 30));

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
      }).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final responseBody = response.body;
        onResponse(responseBody);
      } else {
        throw Exception("Failed to fetch chat response: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}

