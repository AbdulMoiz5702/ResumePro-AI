import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/certificated.dart';





class CertificatesController extends GetxController {


  RxList<Certificated> certificatedList = <Certificated>[].obs;
  final certificated = TextEditingController();


  // Function to add experience
  void addCertificates() {
    if (certificated.text.isNotEmpty) {
      final newCertificated= Certificated(certificated.text);
      certificatedList.add(newCertificated);
      // Clear the input fields after adding experience
      certificated.clear();
    }
  }


}
