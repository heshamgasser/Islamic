import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/models/surahDetailArgs.dart';
import 'package:provider/provider.dart';

import '../providers/surah_detail_provider.dart';

class SurahScreen extends StatelessWidget {
  static const String routeName = 'Surah Screen';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SurahDetailArgs;

    return ChangeNotifierProvider(
      create: (context) => SurahDetailProvider()..loadFile(args.SurahNum),
      builder: (context, child) {
        var surahProvider = Provider.of<SurahDetailProvider>(context);
        return Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image(
                image: AssetImage(
                    Theme.of(context).brightness == Brightness.light
                        ? 'assets/images/backgroung.png'
                        : 'assets/images/darkBackground.png'),
                fit: BoxFit.cover,
              ),
            ),
            Scaffold(
              appBar: AppBar(
                title: Text(
                  AppLocalizations.of(context)!.appTitle,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'سورة ${args.surahName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_circle_fill_rounded,
                                color: Theme.of(context).colorScheme.onSurface,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.onSecondary,
                          thickness: 2,
                          indent: 40,
                          endIndent: 40,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return RichText(
                              textDirection: TextDirection.rtl,
                              textAlign: surahProvider.surahContent.length <= 20
                                  ? TextAlign.center
                                  : TextAlign.right,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: surahProvider.surahContent[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 20,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface),
                                  ),
                                  TextSpan(
                                    text: '\u06dd${index + 1}',
                                    style: GoogleFonts.amiri(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontSize: 30),
                                  ),
                                ],
                              ),
                            );

                            //   Directionality(
                            //   textDirection: TextDirection.rtl,
                            //   child: Text(
                            //     surahContent[index],
                            //     style: Theme.of(context)
                            //         .textTheme
                            //         .bodyLarge
                            //         ?.copyWith(
                            //             fontSize: 20,
                            //             color: Theme.of(context)
                            //                 .colorScheme
                            //                 .onSurface),
                            //   ),
                            // );
                          },
                          itemCount: surahProvider.surahContent.length,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
