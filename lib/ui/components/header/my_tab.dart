
import 'package:flutter/material.dart';

class MyTab with ChangeNotifier {
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  switchTab(int value) {
    _tabIndex = value;
    notifyListeners();
  }
}