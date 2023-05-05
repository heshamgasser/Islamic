import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  int totalCounter = 0;
  String tashbeeh = 'سبحان الله';
  double rotate = 0;

  List<String> tasbeehItem = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا اله الا الله'
  ];

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

            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: -75,
                  child: Image(
                    image: const AssetImage('assets/images/sebha_head.png'),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                AnimatedRotation(
                  turns: rotate,
                  duration: Duration(milliseconds: 500),
                  child: Image(
                    image: const AssetImage('assets/images/sebha_body.png'),
                    color: Theme.of(context).primaryColor,
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
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height * .07,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                tasbeehItem[index],
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          const Spacer(flex: 4),
        ],
      ),
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

  void checkState() {
    setState(() {
      if (totalCounter % 33 == 0) {
        counter = 0;
        index++;
      }
      if (index == tasbeehItem.length) {
        index = 0;
      }
      if (totalCounter == (tasbeehItem.length) * 33) {
        totalCounter = 0;
      }
    });
  }
}
