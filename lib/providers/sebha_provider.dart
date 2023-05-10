import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {
  int counter = 0;
  int index = 0;
  int totalCounter = 0;
  double rotate = 0;

  List<String> tasbeehItem = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا اله الا الله'
  ];

  void checkState() {
    if (totalCounter % 33 == 0) {
      counter = 0;
      index++;
    }
    if (index == tasbeehItem.length) {
      index = 0;
    }
    if (totalCounter == (tasbeehItem.length) * 33) {
      totalCounter = 0;
    }
    notifyListeners();
  }

  void onTapped() {
    counter++;
    totalCounter++;
    checkState();
    rotate += 1 / 33;
    notifyListeners();
  }

  void addModalBottom() {}
}
