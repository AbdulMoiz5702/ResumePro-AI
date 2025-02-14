import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/eduation_controller.dart';
import '../../conts/colors.dart';
import '../../models/exprience_model.dart';
import '../../models/user_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_sizedBox.dart';
import '../../widgets/custom_textfeild.dart';
import '../../widgets/text_widgets.dart';
import 'AddLanguage_and_Skills.dart';


class AddEducationScreen extends StatelessWidget {
  final UserModel userModel;
  final  List<ExperienceData> ? experienceList ;
  final bool isClassic ;
  final int index;
  const AddEducationScreen({super.key,required this.userModel,required this.experienceList,required this.isClassic,required this.index});
  @override
  Widget build(BuildContext context) {
    final EducationController controller = Get.put(EducationController());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: blackColor,
          title: mediumText(title: 'Education',color: whiteColor)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: controller.schoolLevel,
                hintText: 'Degree',
                validate: (value) {},
              ),
              const Sized(height: 0.02),
              CustomTextField(
                controller: controller.schoolName,
                hintText: 'University',
                validate: (value) {},
              ),
              const Sized(height: 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => controller.selectDate(context, true),
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: whiteColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.calendar_month_outlined),
                          const Sized(width: 0.02,),
                          Obx(()=> smallText(title:controller.startDate.value != null ? DateFormat('MMM yyyy').format(controller.startDate.value!) : 'Start Date',color: blackColor)),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.selectDate(context, false),
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: whiteColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.calendar_month_outlined),
                          const Sized(width: 0.02,),
                          Obx(()=> smallText(title:controller.endDate.value != null ? DateFormat('MMM yyyy').format(controller.endDate.value!) : 'End Date',color: blackColor)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Sized(height: 0.02),
              CustomButton(title: 'Add Education', onTap: controller.addEducation,color: whiteColor,height: 0.04,),
              const Sized(height: 0.02),
              Obx(() {
                return controller.educationList.isEmpty
                    ? const Sized()
                    : ListView.builder(
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: controller.educationList.length,
                  itemBuilder: (context, index) {
                    final education = controller.educationList[index];
                    return Card(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mediumText(title: education.schoolLevel,fontSize: 16,fontWeight: FontWeight.w700),
                            smallText(title: education.studyPeriod,fontWeight: FontWeight.w500),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            smallText(title:education.schoolName,fontWeight: FontWeight.w700,fontSize: 15),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
              const Sized(height: 0.1,),
              CustomButton(title: 'Next', onTap:(){
                Get.to(() => AddLanguageAndSkills(experienceList: experienceList, userModel: userModel, education: controller.educationList,isClassic: isClassic,index: index,));
              },color: whiteColor,),
            ],
          ),
        ),
      ),
    );
  }
}
