
import 'dart:convert';

class ChatRequest {
  String uid;
  String query;
  String summary;
  String location;
  ConfigModel config;
  List<dynamic> components;

  ChatRequest({
    required this.uid,
    required this.query,
    this.summary = '',
    this.location = 'null',
    required this.config,
    this.components = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'query': query,
      'summary': summary,
      'location': location,
      'config': config.toMap(),
      'components': components,
    };
  }

  String toJson() => json.encode(toMap());
}

class ConfigModel {
  String modelType;
  String inputLang;
  String outputLang;

  ConfigModel({
    required this.modelType,
    required this.inputLang,
    required this.outputLang,
  });

  Map<String, dynamic> toMap() {
    return {
      'model_type': modelType,
      'input_lang': inputLang,
      'output_lang': outputLang,
    };
  }

  String toJson() => json.encode(toMap());
}
