import 'package:flutter/material.dart';

import '../models/ahadethContent.dart';

class HadethScreen extends StatelessWidget {
  static const String routeName = 'Hadeth Screen';

  List<String> hadethContent = [];

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)?.settings.arguments as HadethDetailArgs;

    var hadeethaArgs =
        ModalRoute.of(context)?.settings.arguments as AhadethContent;

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image(
            image: AssetImage(Theme.of(context).brightness == Brightness.light
                ? 'assets/images/backgroung.png'
                : 'assets/images/darkBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'إسلامي',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
                bottom: 100, top: 30, left: 25, right: 25),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      hadeethaArgs.title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.onPrimary,
                      thickness: 3,
                      indent: 40,
                      endIndent: 40,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        hadeethaArgs.content,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
