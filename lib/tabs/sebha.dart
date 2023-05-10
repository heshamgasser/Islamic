import 'package:flutter/material.dart';
import 'package:islamic_app/providers/app_provider.dart';
import 'package:islamic_app/providers/sebha_provider.dart';
import 'package:islamic_app/widgets/tasbehTextFormFeild.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<AppProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => SebhaProvider(),
      builder: (context, child) {
        var sebhaProvider = Provider.of<SebhaProvider>(context);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(flex: 3),
              InkWell(
                onTap: () {
                  sebhaProvider.onTapped();
                },
                // Transform.rotate

                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: -75,
                      child: Image(
                        image: const AssetImage('assets/images/sebha_head.png'),
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    AnimatedRotation(
                      turns: sebhaProvider.rotate,
                      duration: const Duration(milliseconds: 500),
                      child: Image(
                        image: const AssetImage('assets/images/sebha_body.png'),
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),

                // AnimatedRotation(
                //   turns: rotate,
                //   duration: Duration(milliseconds: 500),
                //   child: Image(
                //     color: Theme.of(context).primaryColor,
                //     image: const AssetImage('assets/images/sebha_logo.png'),
                //   ),
                // ),
              ),
              const Spacer(),
              Text('عدد التسبيحات',
                  style: Theme.of(context).textTheme.bodyMedium),
              const Spacer(),
              InkWell(
                onTap: () {
                  sebhaProvider.onTapped();
                },
                child: Container(
                  width: 69,
                  height: 81,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      '${sebhaProvider.counter}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height * .07,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    sebhaProvider.tasbeehItem[sebhaProvider.index],
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height * .07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10)),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Text(
                                  settingProvider.language == 'en'
                                      ? 'Add New Item'
                                      : 'إضافة ذكر جديد',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Divider(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  thickness: 3,
                                  indent: 40,
                                  endIndent: 40,
                                ),
                                const SizedBox(height: 20),
                                TasbehTextFormFiled(controller: controller),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15)),
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            sebhaProvider.tasbeehItem
                                                .add(controller.text);
                                            controller.text = '';
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  settingProvider.language ==
                                                          'en'
                                                      ? 'Add Successfully'
                                                      : 'تمت الإضافة بنجاح',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                ),
                                              ),
                                            );
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: Text(
                                          settingProvider.language == 'en'
                                              ? 'Add'
                                              : 'إضافة',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .error,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          settingProvider.language == 'en'
                                              ? 'Cancel'
                                              : 'إلغاء',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    settingProvider.language == 'en'
                        ? 'Add New item'
                        : 'إضافة أذكار',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              const Spacer(flex: 4),
            ],
          ),
        );
      },
    );
  }

  // void checkState() {
  //   if (totalCounter == 33) {
  //     tashbeeh = tasbeehItem[1];
  //     // 'الحمد لله';
  //     counter = 0;
  //   } else if (totalCounter == 66) {
  //     tashbeeh = tasbeehItem[2];
  //     // 'الله أكبر';
  //     counter = 0;
  //   } else if (totalCounter == 99) {
  //     counter = 0;
  //     totalCounter = 0;
  //     tashbeeh = tasbeehItem[0];
  //     // 'سبحان الله';
  //   }
  // }
}
