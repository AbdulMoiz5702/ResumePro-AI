import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pro/conts/colors.dart';
import 'package:pro/widgets/text_widgets.dart';
import '../../controller/ATSAnalysisController.dart';
import '../../widgets/custom_sizedBox.dart';
import '../../widgets/custom_textfeild.dart';

class ATSAnalysisScreen extends StatelessWidget {
  final ATSAnalysisController controller = Get.put(ATSAnalysisController());
  final TextEditingController roleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: mediumText(title: "ATS Resume Analyzer",color: whiteColor),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(controller: roleController, hintText: 'Job Role', validate: (value) {}),
            Sized(height: 0.02,),
            CustomTextField(maxLines: true,controller: descriptionController, hintText: 'Job Description', validate: (value) {}),
            Sized(height: 0.05,),
            Obx(() => controller.selectedFile.value == null
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.file_upload,color: whiteColor,),
                Sized(width: 0.02,),
                smallText(title: "No file selected",color: whiteColor)
              ],
            )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.picture_as_pdf,color: whiteColor,),
                    Sized(width: 0.02,),
                    smallText(title: controller.selectedFile.value!.path.split('/').last,color: whiteColor,fontSize: 10),
                  ],
                )),
            Sized(height: 0.02,),
            ElevatedButton(
              onPressed: () => controller.pickPDF(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                ),
                backgroundColor: Colors.white, // White background
                elevation: 2, // Slight elevation for better UI
              ),
              child: smallText(title: "Pick PDF Resume", color: blackColor),
            ),
            Sized(height: 0.05,),
            Align(
              alignment: Alignment.center,
              child: Obx(
                    ()=> controller.isLoading.value
                    ? const CircularProgressIndicator(color: whiteColor,)
                    :GestureDetector(
                  onTap: ()=> controller.analyzeResume(roleController.text, descriptionController.text),
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
                        smallText(title: 'Analyze Resume with AI'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(() => controller.isLoading.value
                ? smallText(title: "Analyzing........", color: whiteColor)
                : controller.resultText.value.isNotEmpty
                ? Text("\n\nResult:\n\n${controller.resultText.value}",style: TextStyle(color: whiteColor,fontSize: 13,fontWeight: FontWeight.w500),)
                : controller.error.value.isNotEmpty
                ? smallText(title: "Error: ${controller.error.value}", color: errorColor)
                : Container()),
          ],
        ),
      ),
    );
  }
}