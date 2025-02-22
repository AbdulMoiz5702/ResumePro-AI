import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pro/widgets/ResumeOptionsBottomSheet.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            IconButton(onPressed: (){
              showModalBottomSheet(
                isScrollControlled: true,
                  context: context, builder: (context){
                return ResumeOptionsBottomSheet(fontController: fontController, screenshotController: screenshotController, userModel: userModel);
              });
            }, icon: Icon(Icons.widgets_outlined))
          ],
        ),
        centerTitle: true,
        actions: [
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


}




