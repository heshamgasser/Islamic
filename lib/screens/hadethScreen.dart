import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/models/hadethDetailArgs.dart';

class HadethScreen extends StatefulWidget {
  static const String routeName = 'Hadeth Screen';

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<String> hadethContent = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethDetailArgs;

    if (hadethContent.isEmpty) {
      loadFile(args.hadethNum);
    }

    return Stack(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Image(
            image: AssetImage('assets/images/backgroung.png'),
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
                color: Colors.white.withOpacity(.6),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('الحديث رقم ' + (args.hadethNum + 1).toString(),
                        style: Theme.of(context).textTheme.bodyLarge),
                    Divider(
                      color: Theme.of(context).dividerColor,
                      thickness: 3,
                      indent: 40,
                      endIndent: 40,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: hadethContent.length,
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            hadethContent[index],
                            style: GoogleFonts.notoKufiArabic(
                                fontSize: 20, color: Colors.black),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void loadFile(int indexValue) async {
    String hadeth =
        await rootBundle.loadString('assets/hadeth/h${indexValue + 1}.txt');
    List<String> lines = hadeth.split('\n');
    hadethContent = lines;
    setState(() {});
  }
}
