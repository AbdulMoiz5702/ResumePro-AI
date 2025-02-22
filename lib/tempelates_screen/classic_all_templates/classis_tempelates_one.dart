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
import '../../widgets/custom_sizedBox.dart';

class ClassisTempelatesOne extends StatelessWidget {
  final List<ExperienceData>? experienceList;
  final List<Education>? education;
  final List<Language>? language;
  final List<SkillsModel>? skills;
  final List<Certificated>? certificated;
  final UserModel userModel;

  ClassisTempelatesOne({
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
          ()=> Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        color: fontController.backgroundColor.value,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              classicPersonalInfo(context: context,userModel: userModel,fullNameStyle: _getTextStyle(20, FontWeight.bold,),currentPositionStyle: _getTextStyle(16,FontWeight.w700),color: fontController.textColor.value,userDataStyle: _getTextStyle(12,)),
              const Sized(height: 0.02,),
              if (userModel.bio != null)
              buildSectionTitle(title: 'ABOUT ME',isUnderLine: true),
              Text(
                userModel.bio!,
                style: _getTextStyle(10),
                softWrap: true,
                overflow: TextOverflow.visible, // Allow all content to be visible
                maxLines: 10,
              ),
              const Sized(height: 0.015,),
              buildSectionTitle(title: 'Technical Skills',isUnderLine: true),
              classicSkillsSection(context: context,color: fontController.textColor.value,style: _getTextStyle(11), skills: skills),
              const Sized(height: 0.015,),
              buildSectionTitle(title: 'Experience',isUnderLine: true),
              classicExperienceSection(context: context,experienceTitle: _getTextStyle(12, FontWeight.bold),experiencePeriod: _getTextStyle(8, FontWeight.w500),experiencePlace: _getTextStyle(12,FontWeight.bold),description: _getTextStyle(10),experienceList: experienceList,),
              const Sized(height: 0.015,),
              buildSectionTitle(title: 'Education',isUnderLine: true),
              classicEducationSection(context: context,education: education,styleSchoolLevel: _getTextStyle(13, FontWeight.bold),styleSchoolName:  _getTextStyle(11,FontWeight.w600),stylePtudyPeriod:  _getTextStyle(11,)),
              const Sized(height: 0.015,),
              buildSectionTitle(title: 'Additional Information',isUnderLine: true),
              Row(
                children: [
                  smallText(title: 'Languages',fontWeight: FontWeight.w600),
                  Sized(width: 0.02,),
                  classicLanguageSection(context: context,color: fontController.textColor.value,style: _getTextStyle(11), language: language),
                ],
              ),
              Row(
                children: [
                  smallText(title: 'Certificates.',fontWeight: FontWeight.w600),
                  Sized(width: 0.02,),
                  classicCertificatedSection(context: context,color: fontController.textColor.value,style: _getTextStyle(11), certificated: certificated),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  TextStyle _getTextStyle(double size, [FontWeight weight = FontWeight.normal,bool isUnderLine = false,]) {
    return GoogleFonts.getFont(
      fontStyle: isUnderLine == true ? FontStyle.italic : FontStyle.normal,
      decoration: isUnderLine == true ? TextDecoration.underline : TextDecoration.none,
      decorationColor:isUnderLine == true ? blackColor : null,
      decorationThickness: 3.0,
      fontController.selectedFont.value,
      fontSize: size,
      fontWeight: weight,
      color: fontController.textColor.value,
    );
  }

  Widget buildSectionTitle({required String title,bool isUnderLine = false}) {
    return Text(title, style: _getTextStyle(18, FontWeight.bold,isUnderLine));
  }
}
