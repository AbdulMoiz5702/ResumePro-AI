

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
    runAlignment: WrapAlignment.start,
    crossAxisAlignment: WrapCrossAlignment.start,
    direction: Axis.horizontal, // Ensures horizontal wrapping
    spacing: MediaQuery.sizeOf(context).height * 0.1, // Adds spacing between items
    children: List.generate(skills!.length,(index){
      var data = skills![index];
      return Text(data.skill, style: style);
    }),
  );
}

Widget classicSkillsThree({
  required BuildContext context,
  required  skills,
  required Color color,
  required TextStyle style,
  int itemsPerRow = 2, // Controls how many skills per row
}) {
  if (skills == null || skills.isEmpty) {
    return const Sized();
  }

  return LayoutBuilder(
    builder: (context, constraints) {
      double spacing = 16.0; // Adjust spacing between columns
      double availableWidth = constraints.maxWidth;
      double itemWidth = (availableWidth - ((itemsPerRow - 1) * spacing)) / itemsPerRow; // Equal width per column

      return Wrap(
        spacing: spacing,
        runSpacing: 8.0, // Spacing between rows
        children: List.generate(skills.length, (index) {
          return SizedBox(
            width: itemWidth, // Ensures equal width for each skill block
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("•", style: style.copyWith(fontWeight: FontWeight.bold,color: color)), // Bullet point
                const SizedBox(width: 5), // Space between bullet and skill text
                Flexible(
                  child: Text(skills[index].skill, style: style, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          );
        }),
      );
    },
  );
}


