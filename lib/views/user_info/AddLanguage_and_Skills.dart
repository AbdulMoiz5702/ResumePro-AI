import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/certificates_controller.dart';
import '../../controller/language_controller.dart';
import '../../controller/skill_controller.dart';
import '../../conts/colors.dart';
import '../../models/eduaction_model.dart';
import '../../models/exprience_model.dart';
import '../../models/user_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_sizedBox.dart';
import '../../widgets/custom_textfeild.dart';
import '../../widgets/text_widgets.dart';
import '../view_resuma/my_resume.dart';


class AddLanguageAndSkills extends StatelessWidget {
  final UserModel userModel;
  final  List<ExperienceData> ? experienceList ;
  final List<Education> ? education ;
  final bool isClassic ;
  final int index;
  const AddLanguageAndSkills({super.key,required this.userModel,required this.experienceList,required this.education,required this.isClassic,required this.index});
  @override
  Widget build(BuildContext context) {
    final SkillController skillController = Get.put(SkillController());
    final LanguageController languageController = Get.put(LanguageController());
    final CertificatesController certificatesController = Get.put(CertificatesController());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: blackColor,
          title: mediumText(title: 'Skills',color: whiteColor)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller:  skillController.skill,
                hintText: 'Skills',
                validate: (value) {},
              ),
              const Sized(height: 0.02),
              CustomButton(title: 'Add Skills', onTap: skillController.addSkill,color: whiteColor,height: 0.04,width: 0.5,),
              const Sized(height: 0.02),
              Obx(() {
                return skillController.skillList.isEmpty
                    ? const Sized()
                    : Align(
                  alignment: Alignment.centerLeft,
                      child: Wrap(
                                        spacing: 10,
                                        alignment: WrapAlignment.start,
                                        runAlignment: WrapAlignment.start,
                                        direction: Axis.horizontal,
                                        children:List.generate(skillController.skillList.length, (index){
                      var skill = skillController.skillList[index];
                      return Chip(
                          backgroundColor: whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label:smallText(title: skill.skill,)
                      );
                                        })
                                      ),
                    );
              }),//,
              const Sized(height: 0.03),
              CustomTextField(
                controller:  languageController.language,
                hintText: 'Languages',
                validate: (value) {},
              ),
              const Sized(height: 0.02),
              CustomButton(title: 'Add Languages', onTap: languageController.addLanguage,color: whiteColor,height: 0.04,width: 0.5,),
              const Sized(height: 0.02),
              Obx(() {
                return languageController.languageList.isEmpty
                    ? const Sized()
                    : Align(
                    alignment: Alignment.centerLeft,
                      child: Wrap(
                      spacing: 10,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      children:List.generate(languageController.languageList.length, (index){
                        final language = languageController.languageList[index];
                        return Chip(
                            backgroundColor: whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            label:smallText(title: language.language,)
                        );
                      })
                                      ),
                    );
              }),
              const Sized(height: 0.03),
              CustomTextField(
                controller: certificatesController.certificated,
                hintText: 'Certificated',
                validate: (value) {},
              ),
              const Sized(height: 0.02),
              CustomButton(title: 'Add Certificated', onTap: certificatesController.addCertificates,color: whiteColor,height: 0.04,width: 0.5,),
              const Sized(height: 0.02),
              Obx(() {
                return certificatesController.certificatedList.isEmpty
                    ? const Sized()
                    : Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                      spacing: 10,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      children:List.generate(certificatesController.certificatedList.length, (index){
                        final certificated = certificatesController.certificatedList[index];
                        return Chip(
                            backgroundColor: whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            label:smallText(title: certificated.certificated,)
                        );
                      })
                                      ),
                    );
              }),
              const Sized(height: 0.1,),
              CustomButton(title: 'Next', onTap:(){
                Get.to(() => MyResumePage(experienceList: experienceList, userModel: userModel,education: education,language: languageController.languageList,skills: skillController.skillList,certificated: certificatesController.certificatedList,index: index,isClassic: isClassic,));
              },color: whiteColor,),
            ],
          ),
        ),
      ),
    );
  }
}



