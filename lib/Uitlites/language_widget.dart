import 'package:flutter/material.dart';

import '../widgets/custom_sizedBox.dart';

Widget buildLanguageSection(
    {required context,
    required language,
    required Color color,
    required TextStyle style}) {
  if (language == null || language!.isEmpty) {
    return const Sized();
  }
  return Wrap(
      spacing: 10,
      children: List.generate(language!.length, (index) {
        var data = language![index];
        return Container(
          alignment: Alignment.centerRight,
          margin:
              EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.01),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                color: color,
                size: 5,
              ),
              Sized(
                width: 0.025,
              ),
              Text(data.language, style: style)
            ],
          ),
        );
      }));
}

Widget classicLanguageSection(
    {required context,
      required language,
      required Color color,
      required TextStyle style}) {
  if (language == null || language!.isEmpty) {
    return const Sized();
  }
  return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal, // Ensures horizontal wrapping
      spacing: MediaQuery.sizeOf(context).height * 0.01, // Adds spacing between items
      children: List.generate(language!.length, (index) {
        var data = language![index];
        return Text(data.language, style: style);
      }));
}
