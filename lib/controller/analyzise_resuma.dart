import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ATSController extends GetxController {
  var isLoading = false.obs;
  var error = "".obs;
  var resultText = "".obs;
  var currentStep = 0.obs;

  final String apiKey = "AIzaSyCMR2i47-GUdT3NF6nJBsEbfdNKBQKt9SM";

  void analyzeResume(File cvFile, String role) async {
    isLoading.value = true;
    error.value = "";
    resultText.value = "";

    try {
      currentStep.value = 1;
      String base64File = base64Encode(await cvFile.readAsBytes());

      currentStep.value = 2;
      var response = await http.post(
        Uri.parse("https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-8b:generateContent?key=$apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": "Analyze this resume for ATS (Applicant Tracking System) compatibility for the role of $role. Provide an ATS score (e.g., 80/100) and suggest improvements, including missing keywords, headings, and bullet points. Keep the feedback concise, to the point, and visually structured. Use relevant emojis often to enhance readability."},
                {
                  "inline_data": {
                    "mime_type": "image/png",
                    "data": base64File,
                  }
                }
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        currentStep.value = 3;
        var data = jsonDecode(response.body);
        if (data.containsKey("candidates") && data["candidates"].isNotEmpty) {
          resultText.value = data["candidates"][0]["content"]["parts"][0]["text"];
        } else {
          error.value = "Invalid response structure.";
        }
      } else {
        print(response.body);
        error.value = "Failed to analyze resume. Try again!";
      }
    } catch (e) {
      error.value = "Error: $e";
    } finally {
      isLoading.value = false;
    }
  }
}


