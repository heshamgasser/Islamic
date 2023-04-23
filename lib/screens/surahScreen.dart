import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/models/surahDetailArgs.dart';

class SurahScreen extends StatefulWidget {
  static const String routeName = 'Surah Screen';

  const SurahScreen({super.key});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  List<String> surahContent = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SurahDetailArgs;

    if (surahContent.isEmpty) {
      loadFile(args.SurahNum);
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('سورة ${args.surahName}',
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_circle_fill_rounded,
                            color: Colors.black,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Theme.of(context).dividerColor,
                      thickness: 2,
                      indent: 40,
                      endIndent: 40,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            surahContent[index],
                            style: GoogleFonts.notoKufiArabic(
                                fontSize: 20, color: Colors.black),
                          ),
                        );
                      },
                      itemCount: surahContent.length,
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

  Future<void> loadFile(int indexValue) async {
    String surah =
        await rootBundle.loadString('assets/Surah/${indexValue + 1}.txt');

    List<String> lines = surah.split('\n');
    setState(() {
      surahContent = lines;
    });
  }
}
