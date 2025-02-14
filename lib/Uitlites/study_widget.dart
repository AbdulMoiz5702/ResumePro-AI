
import 'package:flutter/material.dart';

import '../widgets/custom_sizedBox.dart';

Widget buildEducationSection({required context,
  required education,
  required TextStyle styleSchoolLevel,
  required TextStyle styleSchoolName,
  required TextStyle stylePtudyPeriod}) {
  if (education == null || education!.isEmpty) {
    return const Sized();
  }
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(education!.length, (index){
      var data = education![index];
      return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(data.schoolLevel, style: styleSchoolLevel),
            Text(data.schoolName, style:styleSchoolName),
            Text(data.studyPeriod, style:stylePtudyPeriod),
          ],
        ),
      );
    }),
  );
}
