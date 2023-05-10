import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/providers/ahadeth_provider.dart';
import 'package:islamic_app/screens/hadethScreen.dart';
import 'package:provider/provider.dart';

class AhadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AhadethProvider()..loadHadethFile(),
      builder: (context, child) {
        var hadethProvider = Provider.of<AhadethProvider>(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/images/ahadeth_logo.png'),
              ),
              Table(
                border: TableBorder(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.onSecondary,
                      width: 3),
                  bottom: BorderSide(
                      color: Theme.of(context).colorScheme.onSecondary,
                      width: 3),
                ),
                children: [
                  TableRow(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.ahadeth,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HadethScreen.routeName,
                          arguments: hadethProvider.hadeethContnet[index]);
                    },
                    child: Text(
                      hadethProvider.hadeethContnet[index].title,
                      // ahadethTitle[index],
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Theme.of(context).colorScheme.onSecondary,
                    thickness: 3,
                    indent: 30,
                    endIndent: 30,
                  );
                },
                itemCount: hadethProvider.hadeethContnet.length,
                // ahadethTitle.length,
              ),
            ],
          ),
        );
      },
    );
  }
}
