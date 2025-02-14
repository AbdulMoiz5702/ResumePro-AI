
import 'package:flutter/material.dart';

import '../conts/colors.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final FormFieldValidator validate;
  final bool isDense ;
  final bool maxLines ;
  const CustomTextField(
      {required this.controller,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      required this.validate,
         this.obscureText = false ,
        this.isDense =false,
        this.maxLines = false,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: whiteColor,
      maxLines: maxLines == true ? 5 : 1,
      obscuringCharacter: '*',
      obscureText: obscureText,
      validator: validate,
      style: const TextStyle(color: whiteColor, fontWeight: FontWeight.bold,fontSize: 14),
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: isDense,
        hintText: hintText,
        hintStyle:  TextStyle(color: whiteColor.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: whiteColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: whiteColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: errorColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: whiteColor, width: 1),
        ),
      ),
    );
  }
}
