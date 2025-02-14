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
  final bool isViewScreen ;

  ModrenTempelatesTwo({
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
          ()=> Container(
        color: fontController.backgroundColor.value,
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
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color:isViewScreen == true ? Color(0xff6c9ac3) : fontController.textColor.value,width:3,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignOutside),
                        shape: BoxShape.circle,
                      ),
                      child: Image(image: AssetImage(dummyPicture),fit: BoxFit.contain,isAntiAlias: true,),
                    ),
                    Sized(width: 0.01,),
                    buildPersonalInfoModernTwo(context: context,userModel: userModel,fullNameStyle: _getTextStyle(20,'Poppins',FontWeight.bold,),currentPositionStyle: _getTextStyle(16,'Poppins',FontWeight.w700),color: fontController.textColor.value,userDataStyle: _getTextStyle(8,'Poppins')),
                  ],
                ),
              ),
              const Sized(height: 0.03,),
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
                        buildSectionTitle('Education'.toUpperCase(),'Barlow'),
                        buildEducationSection(context: context,education: education,styleSchoolLevel: _getTextStyle(13,'Poppins',FontWeight.bold),styleSchoolName:  _getTextStyle(11,'Poppins',FontWeight.bold),stylePtudyPeriod:  _getTextStyle(11,'Poppins')),
                        const Sized(height: 0.033,),
                        buildSectionTitle('Skills'.toUpperCase(),'Barlow'),
                        buildSkillsSection(context: context,color:isViewScreen == true ? Color(0xff6c9ac3): fontController.textColor.value,style: _getTextStyle(11,'Poppins'), skills: skills),
                        const Sized(height: 0.033,),
                        buildSectionTitle('Certificates'.toUpperCase(),'Barlow'),
                        buildCertificatedSection(context: context,color:isViewScreen == true ? Color(0xff6c9ac3): fontController.textColor.value,style: _getTextStyle(11,'Poppins'), certificated: certificated),
                      ],
                    ),
                  ),
                  CustomDivider(isHorizontal: false,color:isViewScreen == true ? Color(0xff6c9ac3): fontController.textColor.value,),
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
                              buildSectionTitle('ABOUT ME','Barlow'),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.55,
                                child: Text(
                                  userModel.bio!,
                                  style: _getTextStyle(10,'Poppins'),
                                  softWrap: true,
                                  overflow: TextOverflow.visible, // Allow all content to be visible
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        const Sized(height: 0.033,),
                        buildSectionTitle('Experience'.toUpperCase(),'Barlow'),
                        buildExperienceSection(context: context,experienceTitle: _getTextStyle(12,'Poppins',FontWeight.bold),experiencePeriod: _getTextStyle(8,'Poppins',FontWeight.w500),experiencePlace: _getTextStyle(12,'Poppins',FontWeight.bold),description: _getTextStyle(10,'Poppins',),experienceList: experienceList,),
                        const Sized(height: 0.033,),
                        buildSectionTitle('Languages'.toUpperCase(),'Barlow'),
                        buildLanguageSection(context: context,color: isViewScreen == true ? Color(0xff6c9ac3):fontController.textColor.value,style: _getTextStyle(11,'Poppins'), language: language),
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
  TextStyle _getTextStyle(double size,String fontFamily,[FontWeight weight = FontWeight.normal,]) {
    return GoogleFonts.getFont(
      isViewScreen == true ? fontFamily :fontController.selectedFont.value,
      fontSize: size,
      fontWeight: weight,
      color: fontController.textColor.value,
    );
  }

  Widget buildSectionTitle(String title,String fontFamily) {
    return Text(title, style: _getTextStyle(18,fontFamily,FontWeight.bold,));
  }
}
