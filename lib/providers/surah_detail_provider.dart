import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SurahDetailProvider extends ChangeNotifier {
  List<String> surahContent = [];

  Future<void> loadFile(int indexValue) async {
    String surah =
        await rootBundle.loadString('assets/Surah/${indexValue + 1}.txt');

    List<String> lines = surah.split('\n');
    surahContent = lines;
    notifyListeners();
  }
}
