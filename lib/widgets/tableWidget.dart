import 'package:flutter/material.dart';
import 'package:islamic_app/models/surahDetailArgs.dart';
import 'package:islamic_app/screens/surahScreen.dart';

class TableWidget extends StatelessWidget {
  String surahName;
  String ayahNumber;
  int surahNum;

  TableWidget(this.surahName, this.ayahNumber, this.surahNum);

  @override
  Widget build(BuildContext context) {
    return Table(
      textDirection: TextDirection.rtl,
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder(
        verticalInside:
            BorderSide(color: Theme.of(context).dividerColor, width: 3),
      ),
      children: [
        TableRow(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  SurahScreen.routeName,
                  arguments:
                      SurahDetailArgs(surahName: surahName, SurahNum: surahNum),
                );
              },
              child: Text(
                surahName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  SurahScreen.routeName,
                  arguments:
                      SurahDetailArgs(surahName: surahName, SurahNum: surahNum),
                );
              },
              child: Text(
                ayahNumber,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
