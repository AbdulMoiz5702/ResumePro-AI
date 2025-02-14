import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/language_model.dart';




class LanguageController extends GetxController {


  RxList<Language> languageList = <Language>[].obs;
  final language = TextEditingController();

  // Function to add experience
  void addLanguage() {
    if (language.text.isNotEmpty) {
      final newLanguage = Language(language.text);
      languageList.add(newLanguage);
      // Clear the input fields after adding experience
      language.clear();
    }
  }


}
