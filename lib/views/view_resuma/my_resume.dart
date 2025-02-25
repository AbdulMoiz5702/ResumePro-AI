import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pro/widgets/ResumeOptionsBottomSheet.dart';
import 'package:screenshot/screenshot.dart';
import '../../controller/cv_controller.dart';
import '../../conts/colors.dart';
import '../../conts/fonts.dart';
import '../../models/certificated.dart';
import '../../models/exprience_model.dart';
import '../../models/eduaction_model.dart';
import '../../models/language_model.dart';
import '../../models/skills_model.dart';
import '../../models/user_model.dart';
import '../../tempelates_screen/classic_all_templates/classis_tempelates_Five.dart';
import '../../tempelates_screen/classic_all_templates/classis_tempelates_Four.dart';
import '../../tempelates_screen/classic_all_templates/classis_tempelates_Six.dart';
import '../../tempelates_screen/classic_all_templates/classis_tempelates_Three.dart';
import '../../tempelates_screen/classic_all_templates/classis_tempelates_one.dart';
import '../../tempelates_screen/classic_all_templates/classis_tempelates_two.dart';
import '../../tempelates_screen/modren_all_templates/modren_tempelate_one.dart';
import '../../tempelates_screen/modren_all_templates/modren_tempelates_three.dart';
import '../../tempelates_screen/modren_all_templates/modren_tempelates_two.dart';
import '../../tempelates_screen/modren_all_templates/modren_templeates_five.dart';
import '../../tempelates_screen/modren_all_templates/modren_templeates_four.dart';
import '../../tempelates_screen/modren_all_templates/modren_templeates_six.dart';
import '../../widgets/text_widgets.dart';


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
                elevation: 50,
                backgroundColor: blackColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft:  Radius.circular(10)),
                ),
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
            ? _getClassicTemplateWidgets(index)
            : _getModernTemplateWidgets(index),
      ),
    );
  }

  _getModernTemplateWidgets(int index,) {
    switch (index) {
      case 0:
        return  ModrenTempelateOne(
          userModel: userModel,
          education: education,
          experienceList: experienceList,
          language: language,
          skills: skills,
          certificated: certificated,
        ); // Wrap it inside a list
      case 1:
        return ModrenTempelatesTwo(
          userModel: userModel,
          education: education,
          experienceList: experienceList,
          language: language,
          skills: skills,
          certificated: certificated,
        );
      case 2:
        return ModrenTempelatesThree(
          userModel: userModel,
          education: education,
          experienceList: experienceList,
          language: language,
          skills: skills,
          certificated: certificated,
        );
      case 3:
        return ModrenTempelatesFour(
          userModel: userModel,
          education: education,
          experienceList: experienceList,
          language: language,
          skills: skills,
          certificated: certificated,
        );
      case 4:
        return ModrenTempelatesFive(
          userModel: userModel,
          education: education,
          experienceList: experienceList,
          language: language,
          skills: skills,
          certificated: certificated,
        );
      case 5:
        return ModrenTempelatesSix(
          userModel: userModel,
          education: education,
          experienceList: experienceList,
          language: language,
          skills: skills,
          certificated: certificated,
        );
      default:
        return [Text("No matching template")];
    }
  }


  // Function to return widgets for classic templates
   _getClassicTemplateWidgets(int index) {
    switch (index) {
      case 0:
        return ClassisTempelatesOne(
          userModel: userModel,
          education: education,
          experienceList: experienceList,
          language: language,
          skills: skills,
          certificated: certificated,
        ); // Replace with your widget
      case 1:
        return ClassisTempelatesTwo(
          userModel: userModel,
          education: education,
          experienceList: experienceList,
          language: language,
          skills: skills,
          certificated: certificated,
        );
      case 2:
        return ClassisTempelatesThree(
          userModel: userModel,
          education: education,
          experienceList: experienceList,
          language: language,
          skills: skills,
          certificated: certificated,
        );
      case 3:
        return ClassisTempelatesFour(
          userModel: userModel,
          education: education,
          experienceList: experienceList,
          language: language,
          skills: skills,
          certificated: certificated,
        );
      case 4:
        return ClassisTempelatesFive(
          userModel: userModel,
          education: education,
          experienceList: experienceList,
          language: language,
          skills: skills,
          certificated: certificated,
        );
      case 5:
        return ClassisTempelatesSix(
          userModel: userModel,
          education: education,
          experienceList: experienceList,
          language: language,
          skills: skills,
          certificated: certificated,
        );
      default:
        return [Text("No matching classic template")]; // Handle invalid indexes
    }
  }


}




