import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/exprience_controller.dart';
import '../../conts/colors.dart';
import '../../models/user_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_sizedBox.dart';
import '../../widgets/custom_textfeild.dart';
import '../../widgets/text_widgets.dart';
import 'education_screen.dart';


class AddExperienceScreen extends StatelessWidget {
  final UserModel userModel;
  final bool isClassic ;
  final int index;
  const AddExperienceScreen({super.key,required this.userModel,required this.index,required this.isClassic});
  @override
  Widget build(BuildContext context) {
    final ExperienceController controller = Get.put(ExperienceController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blackColor,
          title: mediumText(title: 'Experience',color: whiteColor)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: controller.titleController,
                hintText: 'Role',
                validate: (value) {},
              ),
              const Sized(height: 0.02),
              CustomTextField(
                controller: controller.placeController,
                hintText: 'Company',
                validate: (value) {},
              ),
              const Sized(height: 0.02),
              CustomTextField(
                controller: controller.descriptionController,
                hintText: 'Responsibilities',
                validate: (value) {},
                maxLines: true,
              ),
              const Sized(height: 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: Obx(
                      ()=> controller.isLoading.value
                      ? const CircularProgressIndicator(color: whiteColor,)
                      :GestureDetector(
                    onTap: controller.generateBioWithAI,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.auto_fix_high),
                          const Sized(width: 0.05,),
                          smallText(title: 'Write with AI'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Sized(height: 0.05),
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
              const Sized(height: 0.02,),
              CustomButton(title: 'Add Experience', onTap: controller.addExperience,color: whiteColor,height: 0.04,),
              const Sized(height: 0.02,),
              Obx(() {
                return controller.experienceList.isEmpty
                    ? const Sized()
                    : ListView.builder(
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: controller.experienceList.length,
                  itemBuilder: (context, index) {
                    final experience = controller.experienceList[index];
                    // Split the description into points (assuming points are separated by newline '\n')
                    List<String> descriptionPoints = experience.experienceDescription.split('\n');
                    return Card(
                      color: whiteColor,
                      elevation: 50,
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mediumText(title: experience.experienceTitle,fontSize: 16,fontWeight: FontWeight.w700),
                            smallText(title: experience.experiencePeriod,fontWeight: FontWeight.w500),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            smallText(title:experience.experiencePlace,fontWeight: FontWeight.w700,fontSize: 15),
                            // Display each point in the description on a new line
                            ...descriptionPoints.map((point) => Container(
                              margin: const EdgeInsets.only(top: 5),
                                child: smallText(title: '•$point'))),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
              const Sized(height: 0.1,),
              CustomButton(title: 'Next', onTap:(){
                Get.to(() => AddEducationScreen(experienceList: controller.experienceList.toList(), userModel: userModel,index: index,isClassic: isClassic,));
              },color: whiteColor,),
            ],
          ),
        ),
      ),
    );
  }
}
