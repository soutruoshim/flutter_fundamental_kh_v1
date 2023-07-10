import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier{
  bool _isDark = false;
  bool get isDark => _isDark;
  void setDark(bool dark){
    _isDark = dark;
    notifyListeners();
  }
}