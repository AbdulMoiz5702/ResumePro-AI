import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:pro/views/analysis_page/ATS_Analysis_screen.dart';
import '../controller/templeates_categories.dart';
import '../conts/colors.dart';
import '../conts/const_strings.dart';
import '../views/cover_letter/cover_letter.dart';
import '../widgets/text_widgets.dart';



class SelectTempelatesScrenn extends StatelessWidget {
  const SelectTempelatesScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TempleatesCategoriesController());
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: Icon(Icons.widgets), // 🔄 Dynamically change icon
          fabSize: ExpandableFabSize.regular,
          foregroundColor: whiteColor,
          backgroundColor: blackColor,
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(Icons.close), // ❌ Close icon when expanded
          fabSize: ExpandableFabSize.small,
          foregroundColor: whiteColor,
          backgroundColor: errorColor,
          shape: const CircleBorder(),
        ),
        children: [
          FloatingActionButton.small(
            backgroundColor: blackColor,
            heroTag: "CoverLetterScreen",
            child: const Icon(Icons.description,color: whiteColor,),
            onPressed: () {
              Get.to(() => CoverLetterScreen());
            },
          ),
          FloatingActionButton.small(
            backgroundColor: blackColor,
            heroTag: "ATSAnalysisScreen",
            child: const Icon(Icons.analytics,color: whiteColor),
            onPressed: () {
              Get.to(() => ATSAnalysisScreen());
            },
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blackColor,
        title: mediumText(title: 'Resume Templates',color: whiteColor,fontWeight: FontWeight.w700),
      ),
      body: Column(
        children: [
          AppBar(
            backgroundColor: blackColor,
            title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(templateCategoryList.length, (index){
                return GestureDetector(
                  onTap: (){
                    controller.changeIndex(index: index);
                  },
                  child: Obx(
                        () => AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      alignment: Alignment.center,
                      width: controller.currentIndex.value == index
                          ? MediaQuery.sizeOf(context).width * 0.6
                          : MediaQuery.sizeOf(context).width * 0.3,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: controller.currentIndex.value == index ? whiteColor : Colors.grey,
                      ),
                      child: mediumText(title:controller.currentIndex.value == index
                          ? "${templateCategoryList[index]} Resume" // Show "Resume" when selected
                          : templateCategoryList[index],color: blackColor),
                    ),
                  ),
                );
              }),
            ),
          ),
          Obx(()=> Expanded(child: templateCategoryScreens[controller.currentIndex.value])),
        ],
      ),
    );
  }
}



