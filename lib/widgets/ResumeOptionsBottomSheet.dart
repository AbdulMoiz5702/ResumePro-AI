import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pdf/pdf.dart';
import 'package:pro/conts/colors.dart';
import 'package:pro/widgets/text_widgets.dart';
import 'package:screenshot/screenshot.dart';
import 'package:printing/printing.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../controller/cv_controller.dart';
import '../models/user_model.dart';
import '../views/analysis_page/ATS_Analysis_screen.dart';
import '../views/analysis_page/reume_analysis.dart';


class ResumeOptionsBottomSheet extends StatelessWidget {
  final FontController fontController;
  final ScreenshotController screenshotController;
  final UserModel userModel;
  const ResumeOptionsBottomSheet({
    super.key,
    required this.fontController,
    required this.screenshotController,
    required this.userModel,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: blackColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          _buildOption(context, Icons.color_lens, "Font Color", () => _showFontColorPicker(context)),
          _buildOption(context, Icons.format_color_fill, "BG Color", () => _showBackgroundColorPicker(context)),
          _buildOption(context, Icons.picture_as_pdf, "Export PDF", () => _exportToPDF(context)),
          _buildOption(context, Icons.share, "Share PDF", () => _sharePDF(context)),
          _buildOption(context, Icons.analytics, "ATS Check", () => _analyzeCV(context)),
          _buildOption(context, Icons.upload_file, "Upload PDF", () => Get.to(()=> ATSAnalysisScreen(),transition: Transition.circularReveal)),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: whiteColor,
            child: Icon(icon, color: blackColor,size: 30,),
          ),
          const SizedBox(height: 8),
          mediumText(title: label,color: whiteColor,fontWeight: FontWeight.w500),
        ],
      ),
    );
  }

  void _showFontColorPicker(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        child: ColorPicker(
          pickerAreaHeightPercent:0.7,
          paletteType: PaletteType.hslWithSaturation,
          pickerColor: fontController.textColor.value,
          onColorChanged: (color) => fontController.changeTextColor(color),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  void _showBackgroundColorPicker(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        child: ColorPicker(
          pickerAreaHeightPercent:0.7,
          paletteType: PaletteType.hslWithSaturation,
          pickerColor: fontController.backgroundColor.value,
          onColorChanged: (color) => fontController.changeBackgroundColor(color),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  void _exportToPDF(context) async {
    final image = await screenshotController.capture();
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

      final xFile = XFile(file.path);
      await Share.shareXFiles([xFile], text: 'Check out my CV!');
    }
  }

  void _analyzeCV(BuildContext context) async {
    final image = await screenshotController.capture();
    if (image != null) {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/resume.png';
      final file = File(filePath);
      await file.writeAsBytes(image);
      Get.to(() => ATSAnalysisPage(cvFile: file, role: userModel.currentPosition!,jobDescription :''));
    }
  }

}
