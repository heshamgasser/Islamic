import 'package:flutter/material.dart';
import 'package:islamic_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class TasbehTextFormFeild extends StatelessWidget {
  TextEditingController controller;

  TasbehTextFormFeild({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var surahProvider = Provider.of<AppProvider>(context);
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return surahProvider.language == 'en'
              ? 'Feild Required'
              : 'حقل اجباري';
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle:
            TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 14),
        hintText:
            surahProvider.language == 'ar' ? 'أضف ذكر جديد' : 'Add New Item',
        hintStyle: Theme.of(context).textTheme.titleMedium,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onPrimary),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onPrimary),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onPrimary),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
