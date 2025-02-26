import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_image_controller.dart';

class ProfileImagePicker extends StatelessWidget {
  final double height;
  final double width;
  final String defaultImage;
  final Color borderColor;

  const ProfileImagePicker({
    Key? key,
    required this.height,
    required this.width,
    required this.defaultImage,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileImageController controller = Get.put(ProfileImageController());
    return GestureDetector(
      onTap: controller.pickImage,
      child: Obx(() => Container(
        margin: const EdgeInsets.only(left: 5),
        clipBehavior: Clip.hardEdge,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: borderColor,
            width: 3,
            style: BorderStyle.solid,
          ),
          shape: BoxShape.circle,
        ),
        child: controller.selectedImage.value != null
            ? ClipOval(
          child: Image.file(
            controller.selectedImage.value!,
            fit: BoxFit.cover,
          ),
        )
            : ClipOval(
          child: Image.asset(
            defaultImage,
            fit: BoxFit.cover,
          ),
        ),
      )),
    );
  }
}
