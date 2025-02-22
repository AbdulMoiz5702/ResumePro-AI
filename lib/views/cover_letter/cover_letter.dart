import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/CoverLetterController.dart';
import '../../conts/colors.dart';
import '../../widgets/custom_sizedBox.dart';
import '../../widgets/custom_textfeild.dart';
import '../../widgets/text_widgets.dart';


class CoverLetterScreen extends StatelessWidget {
  const CoverLetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CoverLetterController());

    return Scaffold(
      appBar: AppBar(
        title: Text("AI Cover Letter"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(controller: controller.fullName, hintText: 'Full Name', validate: (value) {}),
            Sized(height: 0.02,),
            CustomTextField(controller: controller.jobTitle, hintText: 'Job Title', validate: (value) {}),
            Sized(height: 0.02,),
            CustomTextField(
                maxLines: true,
                controller: controller.jobDescription, hintText: 'Job Description', validate: (value) {}),
            Sized(height: 0.05,),
            Align(
              alignment: Alignment.centerLeft,
              child: Obx(
                    ()=> controller.isLoading.value
                    ? const CircularProgressIndicator(color: whiteColor,)
                    :GestureDetector(
                  onTap: controller.generateCoverLetter,
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
            const Sized(height: 0.05,),
            Obx(() => controller.coverLetter.value.isNotEmpty
                ? Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(controller.coverLetter.value,style: TextStyle(fontWeight: FontWeight.w400,color: whiteColor),),
                ),
              ),
            )
                : Container()),
            Sized(height: 0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: controller.copyText,
                  icon: Icon(Icons.copy, color: blackColor),
                  label: Text("Copy", style: TextStyle(color: blackColor)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteColor, // Button color
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: controller.shareAsPDF,
                  icon: Icon(Icons.share, color: blackColor),
                  label: Text("Share PDF", style: TextStyle(color: blackColor)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteColor, // Button color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
