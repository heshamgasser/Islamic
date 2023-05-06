import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/widgets/themeBottomSheet.dart';

import '../widgets/languageBottomSheet.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              languageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              child: Text(
                'العربية',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              themeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              child: Text(
                'فاتح',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),

          // DropdownButton(items: [
          //   DropdownMenuItem(child: Text('العربية', style: Theme
          //       .of(context)
          //       .textTheme
          //       .bodyMedium,),
          //   value: 'العربية',
          //   ),
          //   DropdownMenuItem(child: Text('الإنجليزية', style: Theme
          //       .of(context)
          //       .textTheme
          //       .bodyMedium,),
          //     value: 'الإنجليزية',
          //   ),
          // ], onChanged: (value) {
          //
          // },),
        ],
      ),
    );
  }

  void languageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }

  void themeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeBottomSheet();
      },
    );
  }
}
