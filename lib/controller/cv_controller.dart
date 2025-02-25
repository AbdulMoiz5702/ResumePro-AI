

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro/conts/colors.dart';


class FontController extends GetxController {
  var selectedFont = 'Roboto'.obs;
  var textColor = blackColor.obs;
  var backgroundColor = whiteColor.obs;
  var isDefault = true.obs;


  void changeFont(String font){
    selectedFont.value = font;
  }
  void changeTextColor(Color color){
    textColor.value = color;
    isDefault(false);
  }
  void changeBackgroundColor(Color color){
    backgroundColor.value = color;
    isDefault(false);
  }
}