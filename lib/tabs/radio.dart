import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Image(
          image: AssetImage('assets/images/radio_logo.png'),
        ),
        const SizedBox(height: 55),
        Text('إذاعة القرآن الكريم',
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 65),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_previous_rounded),
                color: Theme.of(context).colorScheme.onBackground,
                iconSize: 40),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow_rounded),
              color: Theme.of(context).colorScheme.onBackground,
              iconSize: 50,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_next_rounded),
              color: Theme.of(context).colorScheme.onBackground,
              iconSize: 40,
            ),
          ],
        ),
        const Spacer()
      ],
    );
  }
}
