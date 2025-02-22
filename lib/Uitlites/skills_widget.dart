

import 'package:flutter/material.dart';

import '../widgets/custom_sizedBox.dart';

Widget buildSkillsSection({required context ,required skills,required Color color,required TextStyle style }) {
  if (skills == null || skills!.isEmpty) {
    return const Sized();
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(skills!.length,(index){
      var data = skills![index];
      return Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.01),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.circle,color: color,size: 5,),
            Sized(width: 0.025,),
            Text(data.skill, style: style)
          ],
        ),
      );
    }),
  );
}


Widget classicSkillsSection({required context ,required skills,required Color color,required TextStyle style }) {
  if (skills == null || skills!.isEmpty) {
    return const Sized();
  }
  return Wrap(
    crossAxisAlignment: WrapCrossAlignment.start,
    direction: Axis.horizontal, // Ensures horizontal wrapping
    spacing: MediaQuery.sizeOf(context).height * 0.1, // Adds spacing between items
    children: List.generate(skills!.length,(index){
      var data = skills![index];
      return Text(data.skill, style: style);
    }),
  );
}