import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro/conts/colors.dart';
import 'package:pro/widgets/text_widgets.dart';
import '../../Uitlites/certificates_widgte.dart';
import '../../Uitlites/exerience_widgets.dart';
import '../../Uitlites/language_widget.dart';
import '../../Uitlites/skills_widget.dart';
import '../../Uitlites/study_widget.dart';
import '../../Uitlites/user_info_widget.dart';
import '../../controller/cv_controller.dart';
import '../../models/certificated.dart';
import '../../models/eduaction_model.dart';
import '../../models/exprience_model.dart';
import '../../models/language_model.dart';
import '../../models/skills_model.dart';
import '../../models/user_model.dart';
import '../../widgets/customDivider.dart';
import '../../widgets/custom_sizedBox.dart';


class ClassisTempelatesSix extends StatelessWidget {
  final List<ExperienceData>? experienceList;
  final List<Education>? education;
  final List<Language>? language;
  final List<SkillsModel>? skills;
  final List<Certificated>? certificated;
  final UserModel userModel;

  ClassisTempelatesSix({
    super.key,
    this.experienceList,
    required this.userModel,
    this.education,
    this.language,
    this.skills,
    this.certificated
  });

  final FontController fontController = Get.put(FontController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: fontController.isDefault.value == true ? Colors.blue.shade50 :fontController.backgroundColor.value,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Personal Info
              Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: classicPersonalSix(
                  context: context,
                  userModel: userModel,
                  fullNameStyle: _getTextStyle(size: 20,weight:  FontWeight.bold,color: fontController.isDefault.value == true ? blueColor : fontController.textColor.value),
                  currentPositionStyle: _getTextStyle(size: 16,weight:  FontWeight.w700,color: fontController.isDefault.value == true ? blueColor : fontController.textColor.value),
                  color: fontController.textColor.value,
                  userDataStyle: _getTextStyle(size: 12,color:  fontController.textColor.value),
                ),
              ),
              const Sized(height: 0.005),
              Align(
                alignment: Alignment.center,
                  child: CustomDivider(isHorizontal: true,color: fontController.isDefault.value == true ? blueColor : fontController.textColor.value,width: 0.95,)),
              const Sized(height: 0.02),
              if (userModel.bio != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: Text(
                    userModel.bio!,
                    style: _getTextStyle(size: 10,color: fontController.textColor.value),
                    softWrap: true,
                    overflow: TextOverflow.visible, // Allow all content to be visible
                    maxLines: 10,
                  ),
                ),
              // Experience Section
              const Sized(height: 0.02),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  alignment: Alignment.center,
                  color: classicSix,
                  width: MediaQuery.sizeOf(context).width,
                  child: buildSectionTitle(title: 'Professional Experience',color: fontController.isDefault.value == true ? whiteColor : fontController.textColor.value)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: classicExperienceTwo(
                  context: context,
                  experienceTitle: _getTextStyle(size: 12,weight:  FontWeight.bold,color:fontController.textColor.value),
                  experiencePeriod: _getTextStyle(size: 8,weight:  FontWeight.w500,color: fontController.textColor.value),
                  experiencePlace: _getTextStyle(size: 12,weight:  FontWeight.bold,color:fontController.textColor.value),
                  description: _getTextStyle(size: 10,color:fontController.textColor.value),
                  experienceList: experienceList,
                ),
              ),
              const Sized(height: 0.02),
              // Education Section
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  alignment: Alignment.center,
                  color: blueColor,
                  width: MediaQuery.sizeOf(context).width,
                  child: buildSectionTitle(title: 'Education'.toUpperCase(),color: fontController.isDefault.value == true ? whiteColor : fontController.textColor.value)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: classicEducationTwo(
                  context: context,
                  education: education,
                  styleSchoolLevel: _getTextStyle(size: 13,weight:  FontWeight.bold,color:fontController.textColor.value),
                  styleSchoolName: _getTextStyle(size: 11,weight:  FontWeight.w600,color:fontController.textColor.value),
                  stylePtudyPeriod: _getTextStyle(size: 8,color:fontController.textColor.value,weight:  FontWeight.w500),
                ),
              ),
              const Sized(height: 0.02),
              // Technical Skills (Fixed black color title & Blue divider)
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  alignment: Alignment.center,
                  color: blueColor,
                  width: MediaQuery.sizeOf(context).width,
                  child: buildSectionTitle(title: 'Skills'.toUpperCase(), color: fontController.isDefault.value == true ? whiteColor : fontController.textColor.value)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: classicSkillsThree(
                  context: context,
                  color: fontController.textColor.value,
                  style: _getTextStyle(size: 11,color:fontController.textColor.value),
                  skills: skills,
                ),
              ),
              const Sized(height: 0.02),
              // Additional Information
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  alignment: Alignment.centerLeft,
                  color: blueColor,
                  width: MediaQuery.sizeOf(context).width,
                  child: buildSectionTitle(title: 'Others'.toUpperCase(),color: fontController.isDefault.value == true ? whiteColor : fontController.textColor.value)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: Row(
                  children: [
                    smallText(title: 'Languages', fontWeight: FontWeight.w600,color:fontController.textColor.value),
                    const Sized(width: 0.02),
                    classicLanguageSection(
                      context: context,
                      color: fontController.textColor.value,
                      style: _getTextStyle(size: 11,color: fontController.textColor.value),
                      language: language,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: Row(
                  children: [
                    smallText(title: 'Certificates.', fontWeight: FontWeight.w600),
                    const Sized(width: 0.02),
                    classicCertificatedSection(
                      context: context,
                      color: fontController.textColor.value,
                      style: _getTextStyle(size: 11,color:fontController.textColor.value),
                      certificated: certificated,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Generates text styles dynamically
  TextStyle _getTextStyle({required double size,FontWeight weight = FontWeight.normal,required Color color}) {
    return GoogleFonts.getFont(
      decorationThickness: 3.0,
      fontController.selectedFont.value,
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  /// Section Title Widget with optional color parameter
  Widget buildSectionTitle({required String title,required Color color}) {
    return Text(
      title,
      style: _getTextStyle(size: 18,weight: FontWeight.bold,color: color),
    );
  }
}



