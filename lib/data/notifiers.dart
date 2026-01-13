// ValueNotifier hold the data
// ValueNotifierBuilder  listen to the data
import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);

ValueNotifier<bool> brightnessNotifier = ValueNotifier(false);

class CounterNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}
