


import 'package:get/get.dart';

class TempleatesCategoriesController extends GetxController {

  var currentIndex = 0.obs;

  changeIndex({required int index}){
    currentIndex.value = index;
  }

}