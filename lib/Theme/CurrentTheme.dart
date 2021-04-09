import 'package:flutter/material.dart';

import 'config.dart';

class CurrentTheme with ChangeNotifier {
  static bool _isDark = true;

  CurrentTheme() {
    if (box.containsKey('currentTheme'))
      _isDark = box.get('currentTheme');
    else
      box.put('currentTheme', _isDark);
  }

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    box.put('currentTheme', _isDark);
    notifyListeners();
  }
}
