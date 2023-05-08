import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/tabs/ahadeth.dart';
import 'package:islamic_app/tabs/quran.dart';
import 'package:islamic_app/tabs/radio.dart';
import 'package:islamic_app/tabs/sebha.dart';
import 'package:islamic_app/tabs/setting.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> tabs = [
    const QuranTab(),
    const AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingTab(),
  ];

  @override
  Widget build(BuildContext context) {
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
              AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: tabs[index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/quran_gold.png'),
                  ),
                  label: AppLocalizations.of(context)!.quran,
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/ahadeth.png'),
                  ),
                  label: AppLocalizations.of(context)!.ahadeth,
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/sebha.png'),
                  ),
                  label: AppLocalizations.of(context)!.sebha,
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/radio.png'),
                  ),
                  label: AppLocalizations.of(context)!.radio,
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.setting,
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor),
            ],
          ),
        ),
      ],
    );
  }
}
