import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/ahadethContent.dart';

class AhadethProvider extends ChangeNotifier {
  List<AhadethContent> hadeethContnet = [];

  void loadHadethFile() async {
    // String hadethContent =
    // await rootBundle.loadString('assets/files/ahadeth .txt');

    rootBundle.loadString('assets/files/ahadeth .txt').then(
      (value) {
        List<String> ahadethContent = value.split('#');
        for (int i = 0; i < ahadethContent.length; i++) {
          int lastIndex = ahadethContent[i].trim().indexOf('\n');
          String title = ahadethContent[i].trim().substring(0, lastIndex);
          String content = ahadethContent[i].trim().substring(lastIndex + 1);
          AhadethContent hadeethContent = AhadethContent(title, content);
          hadeethContnet.add(hadeethContent);
          notifyListeners();
        }

        // for (int i = 0 ; i < ahadethContent.length; i++){
        //   List <String> ahadethLines = ahadethContent[i].trim().split('\n');
        //   String title = ahadethLines[0];
        //   ahadethLines.removeAt(0);
        //   List<String> content = ahadethLines;
        //   AhadethContent hadeethContent = AhadethContent(title, content);
        //   hadeethContnet.add(hadeethContent);
        // }
      },
    ).catchError((error) {
      print(error);
    });
  }
}
