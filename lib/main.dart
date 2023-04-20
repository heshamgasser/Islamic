import 'package:flutter/material.dart';
import 'package:islamic_app/screens/hadethScreen.dart';
import 'package:islamic_app/screens/homeScreen.dart';
import 'package:islamic_app/screens/surahScreen.dart';
import 'package:islamic_app/themeData/themes.dart';

void main() {
  runApp(IslamicApp());
}

class IslamicApp extends StatelessWidget {
  const IslamicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: MyThemeData.darkTheme,
      theme: MyThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SurahScreen.routeName: (context) => SurahScreen(),
        HadethScreen.routeName: (context) => HadethScreen(),
      },
    );
  }
}
