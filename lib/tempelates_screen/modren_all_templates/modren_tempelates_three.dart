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

class ModrenTempelatesThree extends StatelessWidget {
  final List<ExperienceData>? experienceList;
  final List<Education>? education;
  final List<Language>? language;
  final List<SkillsModel>? skills;
  final List<Certificated>? certificated;
  final UserModel userModel;
  final bool isViewScreen ;

  ModrenTempelatesThree({
    super.key,
    this.experienceList,
    required this.userModel,
    this.education,
    this.language,
    this.skills,
    this.certificated,
    required this.isViewScreen ,
  });

  final FontController fontController = Get.put(FontController());
  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> SingleChildScrollView(
            child: Container(
              color: whiteColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:  EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.04,right:MediaQuery.sizeOf(context).width * 0.01, ),
                        color:isViewScreen == true ? brownColor :fontController.backgroundColor.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              clipBehavior: Clip.hardEdge,
                              height: MediaQuery.sizeOf(context).height * 0.17,
                              width: MediaQuery.sizeOf(context).width * 0.28,
                              decoration:  BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color:isViewScreen == true ? whiteColor : fontController.textColor.value,width:3,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignOutside),
                                shape: BoxShape.circle,
                              ),
                              child: Image(image: AssetImage(dummyPicture),fit: BoxFit.contain,isAntiAlias: true,),
                            ),
                            const Sized(height: 0.02,),
                            buildSectionTitle('Education'.toUpperCase(),'Barlow',false),
                            buildEducationSection(context: context,education: education,styleSchoolLevel: _getTextStyle(13,'Poppins',false,FontWeight.bold),styleSchoolName:  _getTextStyle(11,'Poppins',false,FontWeight.bold),stylePtudyPeriod:  _getTextStyle(11,'Poppins',false)),
                            const Sized(height: 0.02,),
                            CustomDivider(width: 0.33,isHorizontal: true,color:isViewScreen == true ? whiteColor : fontController.textColor.value,),
                            const Sized(height: 0.02,),
                            buildSectionTitle('Skills'.toUpperCase(),'Barlow',false),
                            buildSkillsSection(context: context,color:isViewScreen == true ? Color(0xff6c9ac3): fontController.textColor.value,style: _getTextStyle(11,'Poppins',false), skills: skills),
                            const Sized(height: 0.02,),
                            CustomDivider(width: 0.33,isHorizontal: true,color:isViewScreen == true ? whiteColor : fontController.textColor.value,),
                            const Sized(height: 0.02,),
                            buildSectionTitle('Certificates'.toUpperCase(),'Barlow',false),
                            buildCertificatedSection(context: context,color:isViewScreen == true ? Color(0xff6c9ac3): fontController.textColor.value,style: _getTextStyle(11,'Poppins',false), certificated: certificated),
                            const Sized(height: 0.02,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Sized(height: 0.02,),
                            buildPersonalInfoModernTwo(context: context,userModel: userModel,fullNameStyle: _getTextStyle(20,'Poppins',true,FontWeight.bold,),currentPositionStyle: _getTextStyle(16,'Poppins',true,FontWeight.w700),color: fontController.textColor.value,userDataStyle: _getTextStyle(8,'Poppins',true)),
                            const Sized(height: 0.02,),
                            Align(
                                alignment: Alignment.centerRight,
                                child: CustomDivider(width: 0.4,isHorizontal: true,color:blackColor,)),
                            const Sized(height: 0.02,),
                            if (userModel.bio != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildSectionTitle('ABOUT ME','Barlow',true),
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width * 0.55,
                                    child: Text(
                                      userModel.bio!,
                                      style: _getTextStyle(10,'Poppins',true),
                                      softWrap: true,
                                      overflow: TextOverflow.visible, // Allow all content to be visible
                                      maxLines: 10,
                                    ),
                                  ),
                                ],
                              ),
                            const Sized(height: 0.02,),
                            Align(
                                alignment: Alignment.centerRight,
                                child: CustomDivider(width: 0.4,isHorizontal: true,color:blackColor,)),
                            const Sized(height: 0.02,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                buildSectionTitle('Experience'.toUpperCase(),'Barlow',true),
                                buildExperienceSection(context: context,experienceTitle: _getTextStyle(12,'Poppins',true,FontWeight.bold),experiencePeriod: _getTextStyle(8,'Poppins',true,FontWeight.w500),experiencePlace: _getTextStyle(12,'Poppins',true,FontWeight.bold),description: _getTextStyle(10,'Poppins',true),experienceList: experienceList,),
                              ],
                            ),
                            const Sized(height: 0.02,),
                            Align(
                                alignment: Alignment.centerRight,
                                child: CustomDivider(width: 0.4,isHorizontal: true,color:blackColor,)),
                            const Sized(height: 0.02,),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    buildSectionTitle('Languages'.toUpperCase(),'Barlow',true),
                                    Sized(width: 0.27,)
                                  ],
                                ),
                                buildLanguageSection(context: context,color: isViewScreen == true ? blackColor:fontController.textColor.value,style: _getTextStyle(11,'Poppins',true), language: language),
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
  TextStyle _getTextStyle(double size,String fontFamily,bool isSide ,[FontWeight weight = FontWeight.normal,]) {
    return GoogleFonts.getFont(
      isViewScreen == true ? fontFamily :fontController.selectedFont.value,
      fontSize: size,
      fontWeight: weight,
      color: isSide == true ? blackColor : isViewScreen == true ? whiteColor : fontController.textColor.value,
    );
  }

  Widget buildSectionTitle(String title,String fontFamily,bool isSide) {
    return Text(title, style: _getTextStyle(18,fontFamily,isSide,FontWeight.bold,));
  }
}

