import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro/tempelates_screen/classic_all_templates/classis_tempelates_one.dart';
import 'package:pro/tempelates_screen/modren_all_templates/modren_templeates_six.dart';
import '../../conts/colors.dart';
import '../../conts/dummy_data.dart';
import '../../tempelates_screen/modren_all_templates/modren_tempelate_one.dart';
import '../../tempelates_screen/modren_all_templates/modren_tempelates_three.dart';
import '../../tempelates_screen/modren_all_templates/modren_tempelates_two.dart';
import '../../tempelates_screen/modren_all_templates/modren_templeates_five.dart';
import '../../tempelates_screen/modren_all_templates/modren_templeates_four.dart';
import '../../widgets/custom_sizedBox.dart';
import '../../widgets/text_widgets.dart';
import '../user_info/personal_infomration.dart';

class TemplateDetailView extends StatelessWidget {
  final bool isClassic;
  final int index;

  const TemplateDetailView({required this.isClassic, super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        title: mediumText(title: 'Resume Template', color: whiteColor),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Sized(height: 0.02),
            GestureDetector(
              onTap: () {
                Get.to(() =>  PersonalInformation(index: index,isClassic: isClassic,), transition: Transition.leftToRightWithFade);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.auto_fix_high),
                    const Sized(width: 0.05),
                    smallText(title: 'Let’s Build Resume with AI'),
                  ],
                ),
              ),
            ),
            const Sized(height: 0.02),
            if (!isClassic) ..._getModernTemplateWidgets(index),
            if (isClassic) ..._getClassicTemplateWidgets(index),
          ],
        ),
      ),
    );
  }

  // Function to return widgets for modern templates
  List<Widget> _getModernTemplateWidgets(int index,) {
    switch (index) {
      case 0:
        return [
          ModrenTempelateOne(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
          )
        ]; // Wrap it inside a list
      case 1:
        return [
          ModrenTempelatesTwo(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
            isViewScreen: true,
          )
        ];
      case 2:
        return [
          ModrenTempelatesThree(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
            isViewScreen: true,
          )
        ];
      case 3:
        return [
          ModrenTempelatesFour(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
            isViewScreen: true,
          )
        ];
      case 4:
        return [
          ModrenTempelatesFive(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
            isViewScreen: true,
          )
        ];
      case 5:
        return [
          ModrenTempelatesSix(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
            isViewScreen: true,
          )
        ];
      default:
        return [Text("No matching template")];
    }
  }


  // Function to return widgets for classic templates
  List<Widget> _getClassicTemplateWidgets(int index) {
    switch (index) {
      case 0:
        return [
          ClassisTempelatesOne(
            userModel: userModel,
            education: education,
            experienceList: experienceList,
            language: language,
            skills: skills,
            certificated: certificated,
          )
        ]; // Replace with your widget
      case 1:
        return [Text("Classic Template 1")]; // Replace with your widget
      default:
        return [Text("No matching classic template")]; // Handle invalid indexes
    }
  }
}


