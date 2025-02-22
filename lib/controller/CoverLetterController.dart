import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart'; // For Clipboard


class CoverLetterController extends GetxController {
  var fullName = TextEditingController();
  var jobTitle = TextEditingController();
  var jobDescription = TextEditingController();
  var coverLetter = ''.obs;
  var isLoading = false.obs;

  Future<void> generateCoverLetter() async {
    if (fullName.text.isEmpty || jobTitle.text.isEmpty || jobDescription.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields.');
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
          "model": "llama-3.3-70b-versatile",
          "messages": [
            {"role": "system", "content": "You are a professional cover letter writer."},
            {
              "role": "user",
              "content":
              "Craft a well-balanced, formal, and compelling cover letter for ${fullName.text}, applying for the ${jobTitle.text} position. The letter should maintain a professional and engaging tone while aligning with the following job description: ${jobDescription.text}. It must effectively highlight the candidate’s key skills, strengths, and enthusiasm for the role in a natural and persuasive manner. The cover letter should begin with 'Dear Hiring Manager' and avoid mentioning specific company names, making it suitable for multiple job applications within the same field. Ensure the length is concise yet short of 1000 characters —neither too short to lose impact nor too long to affect readability. Conclude the letter with an appropriate sign-off, such as 'Sincerely' or 'Best regards,' followed by the candidate’s name."
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        coverLetter.value = data['choices'][0]['message']['content'].trim();
      } else {
        Get.snackbar('Error', 'Failed to generate cover letter.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> shareAsPDF() async {
    if (coverLetter.value.isEmpty) {
      Get.snackbar('Error', 'No cover letter to share.');
      return;
    }

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text(coverLetter.value, style: pw.TextStyle(fontSize: 16)),
        ),
      ),
    );

    try {
      var status = await Permission.storage.request();
      if (!status.isGranted) {
        Get.snackbar('Permission Denied', 'Storage permission is required to save the file.');
        return;
      }

      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/CoverLetter.pdf');
      await file.writeAsBytes(await pdf.save());

      Share.shareXFiles([XFile(file.path)], text: "My Cover Letter");
    } catch (e) {
      Get.snackbar('Error', 'Failed to generate or share the PDF.');
    }
  }

  void copyText() {
    if (coverLetter.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: coverLetter.value));
      Get.snackbar('Success', 'Cover letter copied to clipboard.');
    } else {
      Get.snackbar('Error', 'No text to copy.');
    }
  }
}
