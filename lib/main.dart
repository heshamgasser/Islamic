import 'package:flutter/material.dart';
import 'package:islamic_app/screens/hadethScreen.dart';
import 'package:islamic_app/screens/homeScreen.dart';
import 'package:islamic_app/screens/surahScreen.dart';
import 'package:islamic_app/themeData/themes.dart';

void main() {
  runApp(const IslamicApp());
}

class IslamicApp extends StatelessWidget {
  const IslamicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: MyThemeData.darkTheme,
      theme: MyThemeData.lightTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SurahScreen.routeName: (context) => const SurahScreen(),
        HadethScreen.routeName: (context) => const HadethScreen(),
      },
    );
  }
}
