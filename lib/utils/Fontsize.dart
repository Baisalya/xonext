import 'package:flutter/material.dart';

class FontSizeNotifier with ChangeNotifier {
  double _fontSize = 16.0; // Initial font size

  double get fontSize => _fontSize;

  void setFontSize(double value) {
    _fontSize = value;
    notifyListeners();
  }
}
