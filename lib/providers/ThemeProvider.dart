import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  bool _isDarkMode = false;

  bool get isDarkMode{
    return _isDarkMode;
  }

  void toggle(){
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get currentTheme{
    return _isDarkMode ? ThemeData.dark(): ThemeData.light();
  }
}