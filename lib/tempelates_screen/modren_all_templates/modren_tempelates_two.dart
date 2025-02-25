import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro/conts/tempelates.dart';
import '../../Uitlites/certificates_widgte.dart';
import '../../Uitlites/exerience_widgets.dart';
import '../../Uitlites/language_widget.dart';
import '../../Uitlites/skills_widget.dart';
import '../../Uitlites/study_widget.dart';
import '../../Uitlites/user_info_widget.dart';
import '../../controller/cv_controller.dart';
import '../../conts/colors.dart';
import '../../models/certificated.dart';
import '../../models/eduaction_model.dart';
import '../../models/exprience_model.dart';
import '../../models/language_model.dart';
import '../../models/skills_model.dart';
import '../../models/user_model.dart';
import '../../widgets/customDivider.dart';
import '../../widgets/custom_sizedBox.dart';

class ModrenTempelatesTwo extends StatelessWidget {
  final List<ExperienceData>? experienceList;
  final List<Education>? education;
  final List<Language>? language;
  final List<SkillsModel>? skills;
  final List<Certificated>? certificated;
  final UserModel userModel;

  ModrenTempelatesTwo({
    super.key,
    this.experienceList,
    required this.userModel,
    this.education,
    this.language,
    this.skills,
    this.certificated,
  });

  final FontController fontController = Get.put(FontController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: fontController.isDefault.value == true ? whiteColor :fontController.backgroundColor.value,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      clipBehavior: Clip.hardEdge,
                      height: MediaQuery.sizeOf(context).height * 0.17,
                      width: MediaQuery.sizeOf(context).width * 0.28,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: fontController.isDefault.value == true ? Color(0xff6c9ac3) :fontController.textColor.value ,
                            width: 3,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignOutside),
                        shape: BoxShape.circle,
                      ),
                      child: Image(
                        image: AssetImage(dummyPicture),
                        fit: BoxFit.contain,
                        isAntiAlias: true,
                      ),
                    ),
                    Sized(
                      width: 0.01,
                    ),
                    buildPersonalInfoModernTwo(
                        context: context,
                        userModel: userModel,
                        fullNameStyle: _getTextStyle(
                         size:  20,
                         weight:  FontWeight.bold,
                         color: fontController.isDefault.value == true ? blackColor:fontController.textColor.value
                        ),
                        currentPositionStyle:
                            _getTextStyle(size: 16, weight:  FontWeight.w700,color :fontController.isDefault.value == true ? blackColor:fontController.textColor.value ),
                        color:fontController.isDefault.value == true ? blackColor: fontController.textColor.value,
                        userDataStyle: _getTextStyle(size: 8,color: fontController.isDefault.value == true ? blackColor:fontController.textColor.value )),
                  ],
                ),
              ),
              const Sized(
                height: 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width * 0.04,
                      right: MediaQuery.sizeOf(context).width * 0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSectionTitle(title:'Education'.toUpperCase(),color: fontController.isDefault.value == true ? blackColor:fontController.textColor.value ),
                        buildEducationSection(
                            context: context,
                            education: education,
                            styleSchoolLevel:
                                _getTextStyle(size:  13,weight:  FontWeight.bold,color: fontController.isDefault.value == true ? blackColor:fontController.textColor.value ),
                            styleSchoolName:
                                _getTextStyle(size:  11,weight:  FontWeight.bold,color:fontController.isDefault.value == true ? blackColor:fontController.textColor.value ),
                            stylePtudyPeriod: _getTextStyle(size:  11,color: fontController.isDefault.value == true ? blackColor:fontController.textColor.value )),
                        const Sized(
                          height: 0.033,
                        ),
                        buildSectionTitle(title: 'Skills'.toUpperCase(),color: fontController.isDefault.value == true ? blackColor:fontController.textColor.value ),
                        buildSkillsSection(
                            context: context,
                            color: fontController.isDefault.value == true ? Color(0xff6c9ac3):fontController.textColor.value,
                            style: _getTextStyle(size:  11, color: fontController.isDefault.value == true ? blackColor:fontController.textColor.value),
                            skills: skills),
                        const Sized(
                          height: 0.033,
                        ),
                        buildSectionTitle(title: 'Certificates'.toUpperCase(),color: fontController.isDefault.value == true ? blackColor:fontController.textColor.value),
                        buildCertificatedSection(
                            context: context,
                            color:fontController.isDefault.value == true ?  Color(0xff6c9ac3):fontController.textColor.value,
                            style: _getTextStyle(size:  11,color: fontController.isDefault.value == true ?  blackColor:fontController.textColor.value),
                            certificated: certificated),
                      ],
                    ),
                  ),
                  CustomDivider(
                    isHorizontal: false,
                    color: fontController.isDefault.value == true ?  Color(0xff6c9ac3):fontController.textColor.value,
                  ),
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
                              buildSectionTitle(title: 'ABOUT ME',color: fontController.isDefault.value == true ?  blackColor:fontController.textColor.value),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.55,
                                child: Text(
                                  userModel.bio!,
                                  style: _getTextStyle(size:  10, color: fontController.isDefault.value == true ?  blackColor:fontController.textColor.value),
                                  softWrap: true,
                                  overflow: TextOverflow
                                      .visible, // Allow all content to be visible
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        const Sized(
                          height: 0.033,
                        ),
                        buildSectionTitle(title: 'Experience'.toUpperCase(),color: fontController.isDefault.value == true ?  blackColor:fontController.textColor.value),
                        buildExperienceSection(
                          context: context,
                          experienceTitle:
                              _getTextStyle(size: 12,weight:  FontWeight.bold,color: fontController.isDefault.value == true ?  blackColor:fontController.textColor.value),
                          experiencePeriod:
                              _getTextStyle(size:  8,weight:  FontWeight.w500,color: fontController.isDefault.value == true ?  blackColor:fontController.textColor.value),
                          experiencePlace:
                              _getTextStyle(size:  12,weight:  FontWeight.bold,color: fontController.isDefault.value == true ?  blackColor:fontController.textColor.value),
                          description: _getTextStyle(
                           size:  10,
                            color: fontController.isDefault.value == true ?  blackColor:fontController.textColor.value,
                          ),
                          experienceList: experienceList,
                        ),
                        const Sized(
                          height: 0.033,
                        ),
                        buildSectionTitle(title: 'Languages'.toUpperCase(),color:fontController.isDefault.value == true ?  blackColor:fontController.textColor.value),
                        buildLanguageSection(
                            context: context,
                            color:  fontController.isDefault.value == true ?  Color(0xff6c9ac3):fontController.textColor.value,
                            style: _getTextStyle(size: 11, color:fontController.isDefault.value == true ? blackColor :fontController.textColor.value),
                            language: language),
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

  /// Generates text styles dynamically
  TextStyle _getTextStyle(
      {required double size,
      FontWeight weight = FontWeight.normal,
      required Color color}) {
    return GoogleFonts.getFont(
      decorationThickness: 3.0,
      fontController.selectedFont.value,
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  /// Section Title Widget with optional color parameter
  Widget buildSectionTitle({required String title, required Color color}) {
    return Text(
      title,
      style: _getTextStyle(size: 18, weight: FontWeight.bold, color: color),
    );
  }
}
