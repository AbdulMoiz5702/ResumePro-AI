import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../../controller/cv_controller.dart';
import '../../conts/colors.dart';
import '../../conts/fonts.dart';
import '../../models/certificated.dart';
import '../../models/exprience_model.dart';
import '../../models/eduaction_model.dart';
import '../../models/language_model.dart';
import '../../models/skills_model.dart';
import '../../models/user_model.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../tempelates_screen/modren_all_templates/modren_tempelate_one.dart';
import '../../tempelates_screen/modren_all_templates/modren_tempelates_three.dart';
import '../../tempelates_screen/modren_all_templates/modren_tempelates_two.dart';
import '../../tempelates_screen/modren_all_templates/modren_templeates_five.dart';
import '../../tempelates_screen/modren_all_templates/modren_templeates_four.dart';
import '../../tempelates_screen/modren_all_templates/modren_templeates_six.dart';
import '../../widgets/text_widgets.dart';
import '../analysis_page/reume_analysis.dart';

class MyResumePage extends StatelessWidget {
  final List<ExperienceData>? experienceList;
  final List<Education>? education;
  final List<Language>? language;
  final List<SkillsModel>? skills;
  final List<Certificated>? certificated;
  final UserModel userModel;
  final bool isClassic ;
  final int index;

  MyResumePage(
      {super.key,
      this.experienceList,
      required this.userModel,
      this.education,
      this.language,
      this.skills,
      this.certificated,
      required this.isClassic,
      required this.index,
      });

  final FontController fontController = Get.put(FontController());
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<String>(
              dropdownColor: blackColor,
              isDense: true,
              iconSize: 18,
              value: fontController.selectedFont.value,
              onChanged: (value) => fontController.changeFont(value!),
              items: fontOptions.map((font) {
                return DropdownMenuItem(
                  value: font,
                  child: smallText(title: font, color: whiteColor),
                );
              }).toList(),
            ),
            IconButton(
              icon: const Icon(Icons.color_lens, color: whiteColor),
              onPressed: () => _showColorPicker(context),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: whiteColor),
            onPressed: () => _exportToPDF(context),
          ),
          IconButton(
            icon: const Icon(Icons.share, color: whiteColor),
            onPressed: () => _sharePDF(context),
          ),
          IconButton(
            icon: const Icon(
              Icons.analytics,
              color: whiteColor,
            ),
            onPressed: () => _analyzeCV(context, userModel.currentPosition),
          ),
        ],
      ),
      body: Screenshot(
        controller: screenshotController,
        child: isClassic
            ? const Text('Non-Classic Mode')
            : switch (index) {
          0 =>  ModrenTempelateOne(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
          ),
          1 => ModrenTempelatesTwo(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
            isViewScreen: false,
          ),
          2 => ModrenTempelatesThree(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
            isViewScreen: false,
          ),
          3 => ModrenTempelatesFour(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
            isViewScreen: false,
          ),
          4 => ModrenTempelatesFive(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
            isViewScreen: false,
          ),
          5 => ModrenTempelatesSix(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
            isViewScreen: false,
          ),
          _   => const Text('Default Screen'),
        }
      ),
    );
  }


  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick Colors'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Text Color:'),
                ColorPicker(
                  pickerColor: fontController.textColor.value,
                  onColorChanged: (color) =>
                      fontController.changeTextColor(color),
                ),
                const SizedBox(height: 16),
                const Text('Background Color:'),
                ColorPicker(
                  pickerColor: fontController.backgroundColor.value,
                  onColorChanged: (color) =>
                      fontController.changeBackgroundColor(color),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _exportToPDF(context) async {
    final image = await screenshotController.capture();
    if (image != null) {
      final pdf = pw.Document();
      final pdfWidth = MediaQuery.of(context).size.width;
      final pdfHeight = MediaQuery.of(context).size.height;
      // Custom page size to match the screen dimensions
      pdf.addPage(
        pw.Page(
          pageFormat:
              PdfPageFormat(pdfWidth, pdfHeight), // Use device screen size
          build: (context) => pw.Center(
            child: pw.Image(pw.MemoryImage(image)),
          ),
        ),
      );

      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async {
          return pdf.save();
        },
      );
    }
  }

  void _sharePDF(context) async {
    final Uint8List? image = await screenshotController.capture();
    if (image != null) {
      final pdf = pw.Document();
      final pdfWidth = MediaQuery.of(context).size.width;
      final pdfHeight = MediaQuery.of(context).size.height;

      pdf.addPage(
        pw.Page(
          pageFormat:
              PdfPageFormat(pdfWidth, pdfHeight), // Use device screen size
          build: (context) => pw.Center(
            child: pw.Image(pw.MemoryImage(image)),
          ),
        ),
      );

      final pdfData = await pdf.save();
      final tempDir = await getTemporaryDirectory(); // Use temporary directory
      final filePath = '${tempDir.path}/resume.pdf';
      final file = File(filePath);
      await file.writeAsBytes(pdfData);

      // ✅ Convert File to XFile before sharing
      final xFile = XFile(file.path);
      await Share.shareXFiles([xFile], text: 'Check out my CV!');
    }
  }

  // 🚀 Capture Screenshot and Navigate to ATS Analysis
  void _analyzeCV(BuildContext context, role) async {
    final image = await screenshotController.capture();
    if (image != null) {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/resume.png';
      final file = File(filePath);
      await file.writeAsBytes(image);
      Get.to(() => ATSAnalysisPage(cvFile: file, role: role));
    }
  }
}




