import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/screens/hadethScreen.dart';

import '../models/ahadethContent.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<AhadethContent> hadeethContnet = [];

  @override
  Widget build(BuildContext context) {
    if (hadeethContnet.isEmpty) {
      loadHadethFile();
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/ahadeth_logo.png'),
          ),
          Table(
            border: TableBorder(
              top: BorderSide(
                  color: Theme.of(context).colorScheme.onSecondary, width: 3),
              bottom: BorderSide(
                  color: Theme.of(context).colorScheme.onSecondary, width: 3),
            ),
            children: [
              TableRow(
                children: [
                  Text(
                    'الأحاديث',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethScreen.routeName,
                      arguments: hadeethContnet[index]);
                },
                child: Text(
                  hadeethContnet[index].title,
                  // ahadethTitle[index],
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Theme.of(context).colorScheme.onSecondary,
                thickness: 3,
                indent: 30,
                endIndent: 30,
              );
            },
            itemCount: hadeethContnet.length,
            // ahadethTitle.length,
          ),
        ],
      ),
    );
  }

  void loadHadethFile() async {
    // String hadethContent =
    // await rootBundle.loadString('assets/files/ahadeth .txt');

    rootBundle.loadString('assets/files/ahadeth .txt').then(
      (value) {
        setState(() {});
        List<String> ahadethContent = value.split('#');
        for (int i = 0; i < ahadethContent.length; i++) {
          int lastIndex = ahadethContent[i].trim().indexOf('\n');
          String title = ahadethContent[i].trim().substring(0, lastIndex);
          String content = ahadethContent[i].trim().substring(lastIndex + 1);
          AhadethContent hadeethContent = AhadethContent(title, content);
          hadeethContnet.add(hadeethContent);
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
