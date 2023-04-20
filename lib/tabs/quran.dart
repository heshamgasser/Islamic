import 'package:flutter/material.dart';
import 'package:islamic_app/widgets/tableWidget.dart';

import '../models/contentDetail.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage('assets/images/quran.png'),
          ),
          const SizedBox(height: 10),
          Table(
            textDirection: TextDirection.rtl,
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder(
              verticalInside:
                  BorderSide(color: Theme.of(context).primaryColor, width: 3),
              top: BorderSide(color: Theme.of(context).primaryColor, width: 3),
              bottom:
                  BorderSide(color: Theme.of(context).primaryColor, width: 3),
            ),
            children: [
              TableRow(
                children: [
                  Text(
                    'اسم السورة',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'عدد الآيات',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return TableWidget(surahName[index], ayahNamber[index], index);
            },
            shrinkWrap: true,
            itemCount: surahName.length,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
