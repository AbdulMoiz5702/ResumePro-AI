import 'package:flutter/material.dart';

import '../conts/colors.dart';

class CustomDivider extends StatelessWidget {
  final bool isHorizontal;  // true for horizontal, false for vertical
  final double thickness;   // thickness of the divider
  final Color color; // color of the divider
  final double height;
  final double width;

  const CustomDivider({
    super.key,
    required this.isHorizontal,
    this.thickness = 1.0,
    this.color = blackColor,
    this.width = 0.9,
    this.height = 0.9,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * width;
    final screenHeight = MediaQuery.of(context).size.height * height ;

    if (isHorizontal) {
      return Container(
        width: screenWidth,
        height: thickness,
        color: color,
      );
    } else {
      return Container(
        width: thickness,
        height: screenHeight,
        color: color,
      );
    }
  }
}

