import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/perosnoal_info_controller.dart';
import '../../conts/colors.dart';
import '../../models/user_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_sizedBox.dart';
import '../../widgets/custom_textfeild.dart';
import '../../widgets/text_widgets.dart';
import 'expreince_screen.dart';

class PersonalInformation extends StatelessWidget {
  final bool isClassic ;
  final int index;
  const PersonalInformation({super.key,required this.isClassic,required this.index});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PersonalInfoController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: mediumText(title: 'Personal Information',color: whiteColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Sized(height: 0.02),
            CustomTextField(controller: controller.fullName, hintText: 'Full Name', validate: (value) {}),
            const Sized(height: 0.02),
            CustomTextField(controller: controller.phoneNumber, hintText: 'Phone Number', validate: (value) {}),
            const Sized(height: 0.02),
            CustomTextField(controller: controller.email, hintText: 'Email', validate: (value) {}),
            const Sized(height: 0.02),
            CustomTextField(controller: controller.currentPosition, hintText: 'Current Position', validate: (value) {}),
            const Sized(height: 0.02),
            CustomTextField(controller: controller.address, hintText: 'Address', validate: (value) {}),
            const Sized(height: 0.02),
            // Bio Text Field (Editable)
            CustomTextField(
              controller: controller.bio,
              hintText: 'Bio',
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
            CustomButton(
              color: whiteColor,
              title: 'Next',
              onTap: () {
                if (controller.fullName.text.isEmpty) {
                  Get.snackbar('Error', 'Full Name is required');
                  return;
                }
                final userModel = UserModel(
                  fullName: controller.fullName.text,
                  phoneNumber: controller.phoneNumber.text.isNotEmpty ? controller.phoneNumber.text : null,
                  email: controller.email.text.isNotEmpty ? controller.email.text : null,
                  currentPosition: controller.currentPosition.text.isNotEmpty ? controller.currentPosition.text : null,
                  address: controller.address.text.isNotEmpty ? controller.address.text : null,
                  bio: controller.bio.text.isNotEmpty ? controller.bio.text : null,
                );

                Get.to(() => AddExperienceScreen(userModel: userModel,isClassic: isClassic,index: index,));
              },
            ),
          ],
        ),
      ),
    );
  }
}
