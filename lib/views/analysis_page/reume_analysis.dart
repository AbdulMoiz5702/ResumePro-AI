import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/analyzise_resuma.dart';
import '../../conts/colors.dart';
import '../../widgets/text_widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ATSAnalysisPage extends StatefulWidget {
  final File cvFile;
  final String role;
  final String jobDescription ;
  const ATSAnalysisPage({Key? key, required this.cvFile, required this.role,required this.jobDescription}) : super(key: key);

  @override
  _ATSAnalysisPageState createState() => _ATSAnalysisPageState();
}

class _ATSAnalysisPageState extends State<ATSAnalysisPage> {
  final atsController = Get.put(ATSController());

  @override
  void initState() {
    super.initState();
    atsController.analyzeResume(widget.cvFile, widget.role);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: mediumText(title: 'ATS Analysis',color: whiteColor),
      ),
      body: Obx(() {
        if (atsController.isLoading.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StepProgressIndicator(
                  totalSteps: 3,
                  currentStep: atsController.currentStep.value,
                  selectedColor: Colors.blue,
                  unselectedColor: Colors.grey,
                ),
                SizedBox(height: 20),
                Text(
                  'Processing Step ${atsController.currentStep.value} of 3',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }
        if (atsController.error.isNotEmpty) {
          return Center(
            child: Text(
              atsController.error.value,
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _parseATSResponse(atsController.resultText.value),
            ),
          ),
        );
      }),
    );
  }

  List<Widget> _parseATSResponse(String text) {
    List<Widget> widgets = [];
    RegExp headingRegex = RegExp(r'\*\*(.*?)\*\*');
    Iterable<RegExpMatch> matches = headingRegex.allMatches(text);
    int lastIndex = 0;

    for (var match in matches) {
      String heading = match.group(1) ?? "";
      int startIndex = match.end;
      String content = text.substring(lastIndex, match.start).trim();
      if (content.isNotEmpty) {
        widgets.add(Container(
            margin: const EdgeInsets.only(top: 15),
            child: smallText(title: content,fontSize:14,fontWeight: FontWeight.w500,color: whiteColor)));
      }
      widgets.add( Container(
          margin: const EdgeInsets.only(top: 15),
          child: mediumText(title: heading,fontSize:18,fontWeight: FontWeight.bold,color: whiteColor,decoration: TextDecoration.underline)));
      lastIndex = startIndex;
    }
    if (lastIndex < text.length) {
      widgets.add(Container(
          margin: const EdgeInsets.only(top: 15),
          child: smallText(title: text.substring(lastIndex).trim(),fontSize:14,fontWeight: FontWeight.w500,color: whiteColor)));
    }
    return widgets;
  }
}






