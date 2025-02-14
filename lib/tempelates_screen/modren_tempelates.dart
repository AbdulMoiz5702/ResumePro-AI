import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro/conts/const_strings.dart';
import '../views/template_detail_view/templeate_detail_view.dart';

class ModrenTempelates extends StatelessWidget {
  
  const ModrenTempelates({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: modern.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing:10,childAspectRatio: 8/11),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Get.to(()=>  TemplateDetailView(isClassic: false,index: index,),transition: Transition.downToUp);
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(modern[index],fit: BoxFit.fill,isAntiAlias: true,),
            ),
          );
        });
  }
}
