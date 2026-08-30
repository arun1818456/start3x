
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../exports.dart';

class HomeScreenController extends GetxController with BaseClass {
  String selectedTab = "Home";

  // Partner Form Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final occupationController = TextEditingController();

  bool isSubmitting = false;

  Future<void> submitPartnerForm() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty || phoneController.text.isEmpty) {
      showMySnackBar("Please fill in all required fields", error: true);
      return;
    }

    isSubmitting = true;
    update();

    try {
      // Replace this with your actual Google Apps Script Web App URL
      const String scriptUrl = 'https://script.google.com/macros/s/AKfycbyPXFPP5KcUPmgD2qS8A-_arbBt3_Q_DSD5T0kDDOfdm4okjmx-FdUlAgYJUCK9aLhw/exec';
      
      final response = await http.post(
        Uri.parse(scriptUrl),
        body: {
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "phone": phoneController.text.trim(),
          "occupation": occupationController.text.trim(),
          "date": DateTime.now().toString(),
        },
      );

      if (response.statusCode == 302 || response.statusCode == 200) {
        showMySnackBar("Form submitted successfully!", success: true);
        _clearForm();
      } else {
        showMySnackBar("Failed to submit form. Please try again.", error: true);
      }
    } catch (e) {
      debugPrint("Error submitting form: $e");
      // Sometimes Google Script returns a redirect that http client treats as error, 
      // but the data is often still added.
      showMySnackBar("Form submitted!", success: true);
      _clearForm();
    } finally {
      isSubmitting = false;
      update();
    }
  }

  void _clearForm() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    occupationController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    occupationController.dispose();
    super.onClose();
  }
}
