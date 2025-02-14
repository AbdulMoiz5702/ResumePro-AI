import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../conts/colors.dart';



Widget largeText({
  required String title,
  context,
  double fontSize = 22,
  double height = 1.1,
  fontWeight = FontWeight.w700,
  color = blackColor,
}) {
  return Text(
    title,
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
          height: height.toDouble(),
          fontSize: fontSize.toDouble(),
          fontWeight: fontWeight,
          color: color,
        )),
  );
}

Widget mediumText({
  required String title,
  context,
  double fontSize = 14,
  fontWeight = FontWeight.bold,
  Color color = blackColor,
  TextDecoration decoration = TextDecoration.none,
}) {
  return Text(
    title,
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
          decoration: decoration,
          fontSize: fontSize.toDouble(),
          decorationColor: whiteColor, // Optional: Change underline color
          decorationThickness: 2, // Optional: Adjust thickness
          fontWeight: fontWeight,
          color: color,
        )),
  );
}

Widget smallText({
  required String title,
  context,
  double fontSize = 12,
  fontWeight = FontWeight.w400,
  color = blackColor,
}) {
  return Text(
    title,
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: fontSize.toDouble(),
          fontWeight: fontWeight,
          color: color,
        )),
    softWrap: true,
    maxLines: 10,
    overflow: TextOverflow.ellipsis,
  );
}






