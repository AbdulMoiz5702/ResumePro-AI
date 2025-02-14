

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FontController extends GetxController {
  var selectedFont = 'Roboto'.obs;
  var textColor = Colors.black.obs;
  var backgroundColor = Colors.white.obs;

  void changeFont(String font){
    selectedFont.value = font;
  }
  void changeTextColor(Color color) => textColor.value = color;
  void changeBackgroundColor(Color color) => backgroundColor.value = color;
}