import 'package:flutter/material.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              'اللغة',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'العربية',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              'المظهر',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'فاتح',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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
}
