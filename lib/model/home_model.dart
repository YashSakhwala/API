import 'package:flutter/material.dart';

class HomeModel with ChangeNotifier {
  int a = 0;

  void increment() {
    a++;
    print(a);
    notifyListeners();
  }
}
