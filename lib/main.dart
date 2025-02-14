import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro/tempelates_screen/Select_tempelates_screnn.dart';

import 'conts/colors.dart';


void main() {
  runApp(const MyApp());
}

var geminiApikey = 'AIzaSyCMR2i47-GUdT3NF6nJBsEbfdNKBQKt9SM';

class MyApp extends StatelessWidget {
  const MyApp({super.key,});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       theme: ThemeData(
         appBarTheme: const AppBarTheme(
           iconTheme: IconThemeData(
             color: whiteColor
           )
         ),
         scaffoldBackgroundColor: blackColor,
       ),
      title: 'ResumeAI Pro',
      home: SelectTempelatesScrenn(),
    );
  }
}
