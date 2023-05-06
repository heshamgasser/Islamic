import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeChange = Provider.of<AppProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              themeChange.changeTheme(ThemeMode.light);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.lightTheme,
                  style: themeChange.themeMode == ThemeMode.light
                      ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary)
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                ),
                Spacer(),
                Visibility(
                    visible:
                        themeChange.themeMode == ThemeMode.light ? true : false,
                    child: Icon(
                      Icons.done,
                      color: themeChange.themeMode == ThemeMode.light
                          ? Theme.of(context).colorScheme.onPrimary
                          : Colors.black,
                      size: 30,
                    )),
              ],
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              themeChange.changeTheme(ThemeMode.dark);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.darkTheme,
                  style: themeChange.themeMode == ThemeMode.dark
                      ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary)
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                ),
                Spacer(),
                Visibility(
                  visible:
                      themeChange.themeMode == ThemeMode.dark ? true : false,
                  child: Icon(
                    Icons.done,
                    color: themeChange.themeMode == ThemeMode.dark
                        ? Theme.of(context).colorScheme.onPrimary
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
