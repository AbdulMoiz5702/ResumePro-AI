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

class ModrenTempelatesFive extends StatelessWidget {
  final List<ExperienceData>? experienceList;
  final List<Education>? education;
  final List<Language>? language;
  final List<SkillsModel>? skills;
  final List<Certificated>? certificated;
  final UserModel userModel;
  final bool isViewScreen ;

  ModrenTempelatesFive({
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
                    padding:  EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.03 ),
                    color:isViewScreen == true ? secondBlackColor :fontController.backgroundColor.value,
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
                        const Sized(height: 0.03,),
                        buildSectionTitle('Education'.toUpperCase(),'Barlow',false,buildSectionTitle: true,),
                        const Sized(height: 0.01,),
                        CustomDivider(width: 0.35,isHorizontal: true,color:isViewScreen == true ? whiteColor : fontController.textColor.value,),
                        const Sized(height: 0.005,),
                        buildEducationSection(context: context,education: education,styleSchoolLevel: _getTextStyle(13,'Poppins',false,false,FontWeight.bold),styleSchoolName:  _getTextStyle(11,'Poppins',false,false,FontWeight.bold),stylePtudyPeriod:  _getTextStyle(11,'Poppins',false,false)),
                        const Sized(height: 0.04,),
                        buildSectionTitle('Skills'.toUpperCase(),'Barlow',false,buildSectionTitle: true),
                        const Sized(height: 0.005,),
                        CustomDivider(width: 0.35,isHorizontal: true,color:isViewScreen == true ? whiteColor : fontController.textColor.value,),
                        buildSkillsSection(context: context,color:isViewScreen == true ? whiteColor: fontController.textColor.value,style: _getTextStyle(11,'Poppins',false,false), skills: skills),
                        const Sized(height: 0.04,),
                        buildSectionTitle('Certificates'.toUpperCase(),'Barlow',false,buildSectionTitle: true),
                        const Sized(height: 0.005,),
                        CustomDivider(width: 0.35,isHorizontal: true,color:isViewScreen == true ? whiteColor : fontController.textColor.value,),
                        buildCertificatedSection(context: context,color:isViewScreen == true ? whiteColor : fontController.textColor.value,style: _getTextStyle(11,'Poppins',false,false), certificated: certificated),
                        const Sized(height: 0.03,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Sized(height: 0.02,),
                        buildPersonalInfo(context: context,userModel: userModel,fullNameStyle: _getTextStyle(20,'Poppins',true,false,FontWeight.bold,),currentPositionStyle: _getTextStyle(16,'Poppins',true,false,FontWeight.w700),color: fontController.textColor.value,userDataStyle: _getTextStyle(8,'Poppins',true)),
                        const Sized(height: 0.03,),
                        if (userModel.bio != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildSectionTitle('ABOUT ME','Barlow',true),
                              const Sized(height: 0.01,),
                              CustomDivider(width: 0.58,isHorizontal: true,color:blackColor,),
                              const Sized(height: 0.01,),
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
                        const Sized(height: 0.04,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildSectionTitle('Experience'.toUpperCase(),'Barlow',true),
                            const Sized(height: 0.01,),
                            CustomDivider(width: 0.58,isHorizontal: true,color:blackColor,),
                            const Sized(height: 0.01,),
                            buildExperienceSection(context: context,experienceTitle: _getTextStyle(12,'Poppins',true,false,FontWeight.bold),experiencePeriod: _getTextStyle(8,'Poppins',true,false,FontWeight.w500),experiencePlace: _getTextStyle(12,'Poppins',true,false,FontWeight.bold),description: _getTextStyle(10,'Poppins',true),experienceList: experienceList,),
                          ],
                        ),
                        const Sized(height: 0.04,),
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
                            const Sized(height: 0.01,),
                            CustomDivider(width: 0.58,isHorizontal: true,color:blackColor,),
                            const Sized(height: 0.01,),
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
  TextStyle _getTextStyle(double size,String fontFamily,bool isSide,[bool buildSectionTitle = false,FontWeight weight = FontWeight.normal,]) {
    return GoogleFonts.getFont(
      isViewScreen == true ? fontFamily :fontController.selectedFont.value,
      fontSize: size,
      fontWeight: weight,
      color: isSide == true ? blackColor : isViewScreen == true ?  whiteColor : fontController.textColor.value,
    );
  }

  Widget buildSectionTitle(String title,String fontFamily,bool isSide,{bool buildSectionTitle = false}) {
    return Text(title, style: _getTextStyle(18,fontFamily,isSide,buildSectionTitle,FontWeight.bold,));
  }
}

