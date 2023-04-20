import 'package:flutter/material.dart';
import 'package:islamic_app/models/contentDetail.dart';
import 'package:islamic_app/models/hadethDetailArgs.dart';
import 'package:islamic_app/screens/hadethScreen.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/ahadeth_logo.png'),
          ),
          Table(
            border: TableBorder(
              top: BorderSide(color: Theme.of(context).primaryColor, width: 3),
              bottom:
                  BorderSide(color: Theme.of(context).primaryColor, width: 3),
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
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    HadethScreen.routeName,
                    arguments: HadethDetailArgs(ahadethTitle[index], index),
                  );
                },
                child: Text(
                  ahadethTitle[index],
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              );
            },
            itemCount: ahadethTitle.length,
          ),
        ],
      ),
    );
  }
}
