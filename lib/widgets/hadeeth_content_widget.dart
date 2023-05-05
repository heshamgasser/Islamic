import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HadeethBody extends StatelessWidget {
  String title;
  String content;

  HadeethBody({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge),
        Divider(
          color: Theme.of(context).dividerColor,
          thickness: 3,
          indent: 40,
          endIndent: 40,
        ),
        Text(
          content,
          style: GoogleFonts.notoKufiArabic(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }
}
