import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/exprience_model.dart';
import 'package:http/http.dart' as http;



class ExperienceController extends GetxController {


  RxList<ExperienceData> experienceList = <ExperienceData>[].obs;
  RxString period = ''.obs;
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  final titleController = TextEditingController();
  final placeController = TextEditingController();
  final descriptionController = TextEditingController();

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
        period.value =
        '${DateFormat('yyyy').format(startDate.value!)} - ${DateFormat('yyyy').format(endDate.value!)}';
      }
    }
  }

  // Function to add experience
  void addExperience() {
    if (titleController.text.isNotEmpty &&
        placeController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        period.value.isNotEmpty) {
      final newExperience = ExperienceData(
        experienceTitle: titleController.text,
        experiencePeriod: period.value,
        experiencePlace: placeController.text,
        experienceDescription: descriptionController.text,
      );
      experienceList.add(newExperience);
      // Clear the input fields after adding experience
      titleController.clear();
      placeController.clear();
      descriptionController.clear();
    }
  }

  var isLoading = false.obs;

  Future<void> generateBioWithAI() async {
    if (titleController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your current position first.');
      return;
    }

    isLoading.value = true;
    const apiKey = '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';
    const apiUrl = 'https://api.groq.com/openai/v1/chat/completions';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "llama-3.3-70b-versatile", // You can change the model if needed
          "messages": [
            {"role": "system", "content": "You are a professional key point writer."},
            {
              "role": "user",
              "content":
              "Write a small and brief, impactful 2-point of maximum up to 200 characters for the role of ${titleController.text} in a company. and just write points that in the start do not use any things like symbols just start with characters and each point end with full stop"
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        descriptionController.text = data['choices'][0]['message']['content'].trim();
      } else {
        print(response.statusCode);
        Get.snackbar('Error', 'Failed to generate bio.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }


}
