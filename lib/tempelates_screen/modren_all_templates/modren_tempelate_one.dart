import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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

class ModrenTempelateOne extends StatelessWidget {
  final List<ExperienceData>? experienceList;
  final List<Education>? education;
  final List<Language>? language;
  final List<SkillsModel>? skills;
  final List<Certificated>? certificated;
  final UserModel userModel;

  ModrenTempelateOne({
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
          color: fontController.backgroundColor.value,
          child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.17,
                      width: MediaQuery.sizeOf(context).width * 0.28,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    buildPersonalInfo(context: context,userModel: userModel,fullNameStyle: _getTextStyle(20, FontWeight.bold,),currentPositionStyle: _getTextStyle(16,FontWeight.w700),color: fontController.textColor.value,userDataStyle: _getTextStyle(12)),
                  ],
                ),
              ),
              const Sized(height: 0.01,),
              CustomDivider(isHorizontal: true,color: fontController.textColor.value),
              const Sized(height: 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.04,right:MediaQuery.sizeOf(context).width * 0.01, ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSectionTitle('Education'),
                        buildEducationSection(context: context,education: education,styleSchoolLevel: _getTextStyle(13, FontWeight.bold),styleSchoolName:  _getTextStyle(11,FontWeight.bold),stylePtudyPeriod:  _getTextStyle(11,)),
                        const Sized(height: 0.025,),
                        buildSectionTitle('Skills'),
                        buildSkillsSection(context: context,color: fontController.textColor.value,style: _getTextStyle(11), skills: skills),
                        const Sized(height: 0.025,),
                        buildSectionTitle('Certificates'),
                        buildCertificatedSection(context: context,color: fontController.textColor.value,style: _getTextStyle(11), certificated: certificated),
                      ],
                    ),
                  ),
                  CustomDivider(isHorizontal: false,color: fontController.textColor.value,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (userModel.bio != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildSectionTitle('Profile'),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.55,
                                child: Text(
                                  userModel.bio!,
                                  style: _getTextStyle(10),
                                  softWrap: true,
                                  overflow: TextOverflow.visible, // Allow all content to be visible
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        const Sized(height: 0.025,),
                        buildSectionTitle('Experience'),
                        buildExperienceSection(context: context,experienceTitle: _getTextStyle(12, FontWeight.bold),experiencePeriod: _getTextStyle(8, FontWeight.w500),experiencePlace: _getTextStyle(12,FontWeight.bold),description: _getTextStyle(10),experienceList: experienceList,),
                        const Sized(height: 0.025,),
                        buildSectionTitle('Languages'),
                        buildLanguageSection(context: context,color: fontController.textColor.value,style: _getTextStyle(11), language: language),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
                ),
        ),
    );
  }
  TextStyle _getTextStyle(double size, [FontWeight weight = FontWeight.normal]) {
    return GoogleFonts.getFont(
      fontController.selectedFont.value,
      fontSize: size,
      fontWeight: weight,
      color: fontController.textColor.value,
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(title, style: _getTextStyle(18, FontWeight.bold));
  }
}
