import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ATSAnalysisController extends GetxController {
  var isLoading = false.obs;
  var error = "".obs;
  var resultText = "".obs;
  var selectedFile = Rx<File?>(null);

  final String apiKey = "AIzaSyCMR2i47-GUdT3NF6nJBsEbfdNKBQKt9SM";

  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      selectedFile.value = File(result.files.single.path!);
    }
  }

  void analyzeResume(String role, String jobDescription) async {
    if (selectedFile.value == null) {
      error.value = "Please select a CV file first!";
      return;
    }
    isLoading.value = true;
    error.value = "";
    resultText.value = "";

    try {
      String base64File = base64Encode(await selectedFile.value!.readAsBytes());
      var response = await http.post(
        Uri.parse("https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-8b:generateContent?key=$apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": "Analyze this resume for ATS (Applicant Tracking System) compatibility for the role of $role based on the following job description: $jobDescription.📊 Provide an ATS score to assess compatibility.🔑 Optimize keyword usage by identifying missing industry-specific terms.🛠️ Evaluate formatting & structure to ensure proper ATS parsing.📏 Maintain readability—neither too short to lose impact nor too long to affect clarity.✅ must use emojis for these Headings,Highlight strengths Keywords, Keyword Optimization (Missing Keywords),Experience,Projects and suggest improvements using emojis often and with every point according to its nature for better clarity and engagement."},
                {
                  "inline_data": {
                    "mime_type": "application/pdf",
                    "data": base64File,
                  }
                }
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data.containsKey("candidates") && data["candidates"].isNotEmpty) {
          resultText.value = data["candidates"][0]["content"]["parts"][0]["text"];
          print(data["candidates"][0]["content"]["parts"][0]["text"]);
        } else {
          error.value = "Invalid response structure.";
        }
      } else {
        error.value = "Failed to analyze resume. Try again!";
      }
    } catch (e) {
      error.value = "Error: $e";
    } finally {
      isLoading.value = false;
    }
  }
}



