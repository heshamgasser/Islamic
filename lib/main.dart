import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic_app/providers/app_provider.dart';
import 'package:islamic_app/screens/hadethScreen.dart';
import 'package:islamic_app/screens/homeScreen.dart';
import 'package:islamic_app/screens/surahScreen.dart';
import 'package:islamic_app/themeData/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
    ),
  ], child: const IslamicApp()));
}

class IslamicApp extends StatelessWidget {
  const IslamicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    provider.savedSetting();
    return MaterialApp(
      darkTheme: MyThemeData.darkTheme,
      theme: MyThemeData.lightTheme,
      themeMode: provider.themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(provider.language),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SurahScreen.routeName: (context) => SurahScreen(),
        HadethScreen.routeName: (context) => HadethScreen(),
      },
    );
  }
}
