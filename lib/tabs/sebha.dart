import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int totalCounter = 0;
  String tashbeeh = 'سبحان الله';
  double rotate = 0;

  List<String> tasbeehItem = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(flex: 3),
          InkWell(
            onTap: () {
              setState(() {
                counter++;
                totalCounter++;
                checkState();
                rotate += 1 / 33;
              });
            },
            // Transform.rotate

            child: AnimatedRotation(
              turns: rotate,
              duration: const Duration(milliseconds: 500),
              child: Image(
                color: Theme.of(context).colorScheme.onBackground,
                image: const AssetImage('assets/images/sebha_logo.png'),
              ),
            ),
          ),
          const Spacer(),
          Text('عدد التسبيحات', style: Theme.of(context).textTheme.bodyMedium),
          const Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                counter++;
                totalCounter++;
                checkState();
                rotate += 1 / 33;
              });
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
                  '$counter',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: 137,
            height: 51,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                tashbeeh,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          const Spacer(flex: 4),
        ],
      ),
    );
  }

  void checkState() {
    if (totalCounter == 33) {
      tashbeeh = 'الحمد لله';
      counter = 0;
    } else if (totalCounter == 66) {
      tashbeeh = 'الله أكبر';
      counter = 0;
    } else if (totalCounter == 99) {
      counter = 0;
      totalCounter = 0;
      tashbeeh = 'سبحان الله';
    }
  }
}
