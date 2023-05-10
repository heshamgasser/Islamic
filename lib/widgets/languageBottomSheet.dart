import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var changeLanguage = Provider.of<AppProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              changeLanguage.changeLanguage('en');
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.enLanguage,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: changeLanguage.language == 'en'
                          ? Theme.of(context).colorScheme.onPrimary
                          : Colors.black),
                ),
                const Spacer(),
                Visibility(
                    visible: changeLanguage.language == 'en' ? true : false,
                    child: Icon(
                      Icons.done,
                      color: changeLanguage.language == 'en'
                          ? Theme.of(context).colorScheme.onPrimary
                          : Colors.black,
                      size: 30,
                    )),
              ],
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              changeLanguage.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.arlanguage,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: changeLanguage.language == 'ar'
                          ? Theme.of(context).colorScheme.onPrimary
                          : Colors.black),
                ),
                const Spacer(),
                Visibility(
                    visible: changeLanguage.language == 'ar' ? true : false,
                    child: Icon(
                      Icons.done,
                      color: changeLanguage.language == 'ar'
                          ? Theme.of(context).colorScheme.onPrimary
                          : Colors.black,
                      size: 30,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
