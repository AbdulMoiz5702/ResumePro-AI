import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PersonalInfoController extends GetxController {
  var fullName = TextEditingController();
  var currentPosition = TextEditingController();
  var street = TextEditingController();
  var address = TextEditingController();
  var country = TextEditingController();
  var email = TextEditingController();
  var phoneNumber = TextEditingController();
  var bio = TextEditingController();

  var isLoading = false.obs;

  Future<void> generateBioWithAI() async {
    if (currentPosition.text.isEmpty) {
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
            {"role": "system", "content": "You are a professional resume writer."},
            {
              "role": "user",
              "content":
              "Write a unique, human-like, up to 500 characters bio for someone working as a ${currentPosition.text}.and bio start with characters and end with full stop and make it like human made and natural and do not include experience"
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        bio.text = data['choices'][0]['message']['content'].trim();
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
