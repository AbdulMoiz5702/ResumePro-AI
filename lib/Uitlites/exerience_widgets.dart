

import 'package:flutter/material.dart';

import '../widgets/custom_sizedBox.dart';

Widget buildExperienceSection({
  required context,
  required experienceList,
  required TextStyle experienceTitle,
  required TextStyle experiencePeriod,
  required TextStyle experiencePlace,
  required TextStyle description
}) {
  if (experienceList == null || experienceList!.isEmpty) {
    return const Sized();
  }
  return Column(
    mainAxisSize: MainAxisSize.min, // Shrink-wrap the Column's children
    children: List.generate(experienceList!.length, (index) {
      var data = experienceList![index];
      // Split the description into points (assuming points are separated by newline '\n')
      List<String> descriptionPoints = data.experienceDescription.split('\n');
      return Container(
        margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(data.experienceTitle, style: experienceTitle),
                const Sized(width: 0.1,),
                Text(data.experiencePeriod, style:experiencePeriod),
              ],
            ),
            const Sized(height: 0.002,),
            Text(data.experiencePlace, style: experiencePlace),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  descriptionPoints.length, // Number of bullet points
                      (index) => Container(
                    margin:const EdgeInsets.only(top: 5),
                    child: Text(
                      '• ${descriptionPoints[index]} ',
                      style: description,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }),
  );
}

Widget classicExperienceSection({
  required context,
  required experienceList,
  required TextStyle experienceTitle,
  required TextStyle experiencePeriod,
  required TextStyle experiencePlace,
  required TextStyle description
}) {
  if (experienceList == null || experienceList!.isEmpty) {
    return const Sized();
  }
  return Column(
    mainAxisSize: MainAxisSize.min, // Shrink-wrap the Column's children
    children: List.generate(experienceList!.length, (index) {
      var data = experienceList![index];
      // Split the description into points (assuming points are separated by newline '\n')
      List<String> descriptionPoints = data.experienceDescription.split('\n');
      return Container(
        margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(data.experienceTitle, style: experienceTitle),
                const Sized(width: 0.3,),
                Text(data.experiencePeriod, style:experiencePeriod),
              ],
            ),
            const Sized(height: 0.002,),
            Text(data.experiencePlace, style: experiencePlace),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  descriptionPoints.length, // Number of bullet points
                      (index) => Container(
                    margin:const EdgeInsets.only(top: 5),
                    child: Text(
                      '• ${descriptionPoints[index]} ',
                      style: description,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }),
  );
}



