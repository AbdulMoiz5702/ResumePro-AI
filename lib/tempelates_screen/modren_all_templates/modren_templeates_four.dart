import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro/conts/colors.dart';
import 'package:pro/conts/tempelates.dart';
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
import '../../widgets/profile_image_picker.dart';

class ModrenTempelatesFour extends StatelessWidget {
  final List<ExperienceData>? experienceList;
  final List<Education>? education;
  final List<Language>? language;
  final List<SkillsModel>? skills;
  final List<Certificated>? certificated;
  final UserModel userModel;

  ModrenTempelatesFour({
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
      () => SingleChildScrollView(
        child: Container(
          color: fontController.isDefault.value == true
              ? whiteColor
              : whiteColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width * 0.02,
                      right: MediaQuery.sizeOf(context).width * 0.01,
                    ),
                    color: fontController.isDefault.value == true ? whiteColor :fontController.backgroundColor.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileImagePicker(
                          height: MediaQuery.of(context).size.height * 0.17,
                          width: MediaQuery.of(context).size.width * 0.28,
                          defaultImage: dummyPicture,
                          borderColor: fontController.isDefault.value == true ? whiteColor :fontController.textColor.value, // Can be dynamic
                        ),
                        const Sized(
                          height: 0.02,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:  fontController.isDefault.value == true ? blackColor.withOpacity(0.5) :fontController.textColor.value.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: buildSectionTitle(title: 'Education'.toUpperCase(),color:  fontController.isDefault.value == true ? whiteColor :fontController.textColor.value)),
                        buildEducationSection(
                            context: context,
                            education: education,
                            styleSchoolLevel: _getTextStyle(
                               size:  13, color:fontController.isDefault.value == true ? blackColor :fontController.textColor.value,weight:  FontWeight.bold),
                            styleSchoolName: _getTextStyle(
                               size:  11, color:fontController.isDefault.value == true ? blackColor :fontController.textColor.value,weight:  FontWeight.bold),
                            stylePtudyPeriod:
                                _getTextStyle(size:  11, color:fontController.isDefault.value == true ? blackColor :fontController.textColor.value)),
                        const Sized(
                          height: 0.04,
                        ),
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: fontController.isDefault.value == true ? blackColor.withOpacity(0.5) :fontController.textColor.value.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: buildSectionTitle(
                                   title:  'Skills'.toUpperCase(), color:fontController.isDefault.value == true ? whiteColor :fontController.textColor.value)),
                            buildSkillsSection(
                                context: context,
                                color:fontController.isDefault.value == true ? blackColor :fontController.textColor.value,
                                style: _getTextStyle(size: 11,color:fontController.isDefault.value == true ? blackColor :fontController.textColor.value),
                                skills: skills),
                          ],
                        ),
                        const Sized(
                          height: 0.04,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 6),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: fontController.isDefault.value == true ? blackColor.withOpacity(0.5) :fontController.textColor.value.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: buildSectionTitle(
                                title: 'Certificates'.toUpperCase(), color:fontController.isDefault.value == true ? whiteColor :fontController.textColor.value)),
                        buildCertificatedSection(
                            context: context,
                            color: fontController.isDefault.value == true ? blackColor :fontController.textColor.value,
                            style: _getTextStyle(size: 11, color:fontController.isDefault.value == true ? blackColor :fontController.textColor.value),
                            certificated: certificated),
                        const Sized(
                          height: 0.03,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Sized(
                          height: 0.02,
                        ),
                        buildPersonalInfo(
                            context: context,
                            userModel: userModel,
                            fullNameStyle: _getTextStyle(
                            size:   20,
                            color: blackColor,
                            weight:   FontWeight.bold,
                            ),
                            currentPositionStyle: _getTextStyle(
                              size:   16,color: blackColor,weight:  FontWeight.w700),
                            color: fontController.textColor.value,
                            userDataStyle: _getTextStyle(size:  8,color: blackColor,)),
                        const Sized(
                          height: 0.02,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: CustomDivider(
                              width: 0.4,
                              isHorizontal: true,
                              color: blackColor,
                            )),
                        const Sized(
                          height: 0.02,
                        ),
                        if (userModel.bio != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildSectionTitle(title: 'ABOUT ME',color: blackColor,),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.55,
                                child: Text(
                                  userModel.bio!,
                                  style: _getTextStyle(size:  10,color: blackColor,),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        const Sized(
                          height: 0.02,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: CustomDivider(
                              width: 0.4,
                              isHorizontal: true,
                              color: blackColor,
                            )),
                        const Sized(
                          height: 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildSectionTitle(title: 'Experience'.toUpperCase(),color: blackColor,),
                            buildExperienceSection(
                              context: context,
                              experienceTitle: _getTextStyle(size: 12,color: blackColor,weight:  FontWeight.bold),
                              experiencePeriod: _getTextStyle(
                                 size:  8,color: blackColor,weight:  FontWeight.w500),
                              experiencePlace: _getTextStyle(
                                 size:  12,color: blackColor,weight:  FontWeight.bold),
                              description: _getTextStyle(size: 10, color: blackColor,),
                              experienceList: experienceList,
                            ),
                          ],
                        ),
                        const Sized(
                          height: 0.02,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: CustomDivider(
                              width: 0.4,
                              isHorizontal: true,
                              color: blackColor,
                            )),
                        const Sized(
                          height: 0.02,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                buildSectionTitle(title:  'Languages'.toUpperCase(),color: blackColor,),
                                Sized(
                                  width: 0.27,
                                )
                              ],
                            ),
                            buildLanguageSection(
                                context: context,
                                color: blackColor,
                                style: _getTextStyle(size: 11, color: blackColor,),
                                language: language),
                          ],
                        ),
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
