import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../conts/colors.dart';
import '../views/template_detail_view/templeate_detail_view.dart';


class ClassisTempelates extends StatelessWidget {
  const ClassisTempelates({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing:10,childAspectRatio: 8/11),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Get.to(()=>  TemplateDetailView(isClassic: true,index: index,),transition: Transition.downToUp);
            },
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        });
  }
}
