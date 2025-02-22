import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.edit, color: Colors.white),
        onPressed: () {
          Get.to(() => CoverLetterScreen());
        },
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
                return InkWell(
                  borderRadius: BorderRadius.circular(5),
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
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(seconds:2),
                        curve: Curves.easeInOut,
                        style: TextStyle(
                          fontSize: controller.currentIndex.value == index ? 17 : 13,
                          fontWeight: FontWeight.w700,
                          color: controller.currentIndex.value == index ? Colors.black : Colors.white,
                        ),
                        child: Text(controller.currentIndex.value == index
                            ? "${templateCategoryList[index]} Resume" // Show "Resume" when selected
                            : templateCategoryList[index]), // Otherwise, show normal text
                      ),
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



