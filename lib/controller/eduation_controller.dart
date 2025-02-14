
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/eduaction_model.dart';




class EducationController extends GetxController {


  RxList<Education> educationList = <Education>[].obs;
  RxString studyPeriod = ''.obs;
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  final schoolLevel = TextEditingController();
  final schoolName = TextEditingController();


  // Function to select start or end date
  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      if (isStartDate) {
        startDate.value = picked;
      } else {
        endDate.value = picked;
      }
      if (startDate.value != null && endDate.value != null) {
        studyPeriod.value = '${DateFormat('yyyy').format(startDate.value!)} - ${DateFormat('yyyy').format(endDate.value!)}';
      }
    }
  }

  // Function to add experience
  void addEducation() {
    if (schoolName.text.isNotEmpty &&
        schoolLevel.text.isNotEmpty &&
        studyPeriod.value.isNotEmpty) {
      final newEducation = Education(schoolLevel.text, schoolName.text, studyPeriod.value);
      educationList.add(newEducation);
      // Clear the input fields after adding experience
      schoolName.clear();
      schoolLevel.clear();
      startDate.value = null;
      endDate.value = null;
      studyPeriod('');
    }
  }


}
