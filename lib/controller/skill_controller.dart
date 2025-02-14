import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/skills_model.dart';





class SkillController extends GetxController {


  RxList<SkillsModel> skillList = <SkillsModel>[].obs;
  final skill = TextEditingController();


  // Function to add experience
  void addSkill() {
    if (skill.text.isNotEmpty) {
      final newSkill= SkillsModel(skill.text);
      skillList.add(newSkill);
      // Clear the input fields after adding experience
      skill.clear();
    }
  }


}
