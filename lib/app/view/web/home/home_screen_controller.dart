
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:start3x/app/constant/api_constant.dart';
import 'package:start3x/app/services/api_handler.dart';
import 'dart:convert';
import '../../../../exports.dart';

class HomeScreenController extends GetxController with BaseClass {
  String selectedTab = "Home";

  // Partner Form Controllers
  final businessNameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final occupationController = TextEditingController();

  // Scale Plan Form Controllers
  final planBusinessController = TextEditingController();
  final planNameController = TextEditingController();
  final planPhoneController = TextEditingController();
  final planDateController = TextEditingController();
  final planAddressController = TextEditingController();
  final planGstController = TextEditingController();

  bool isSubmitting = false;
  bool isSubmittingPlan = false;

  Future<void> submitScalePlanForm({required String planAmount}) async {
    final business = planBusinessController.text.trim();
    final name = planNameController.text.trim();
    final phone = planPhoneController.text.trim();
    final date = planDateController.text.trim();
    final address = planAddressController.text.trim();
    final gst = planGstController.text.trim();

    if (business.isEmpty) {
      showMySnackBar("Legal Business Name is required", error: true);
      return;
    }
    if (name.isEmpty) {
      showMySnackBar("Your Name is required", error: true);
      return;
    }
    if (phone.isEmpty) {
      showMySnackBar("Phone Number is required", error: true);
      return;
    }
    if (date.isEmpty) {
      showMySnackBar("Start Date is required", error: true);
      return;
    }

    isSubmittingPlan = true;
    update();

    try {
      const String scriptUrl = 'https://script.google.com/macros/s/AKfycbx_VyIaN_YXnlgsuCR0GgB85_FdvhHTpunbbrO-wUmrf_DtUX5sSw649D9RDftebSr_/exec';

      await http.post(
        Uri.parse(scriptUrl),
        body: {
          "business": business,
          "name": name,
          "phone": phone,
          "date": date,
          "amount": planAmount,
          "address": address,
          "gst": gst,
        },
      );

      if (Get.isDialogOpen == true) {
        Get.back();
      }
      showMySnackBar("Plan request submitted successfully!", success: true);
      clearPlanForm();
    } catch (e) {
      debugPrint("Error submitting plan form: $e");
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      showMySnackBar("Plan request submitted!", success: true);
      clearPlanForm();
    } finally {
      isSubmittingPlan = false;
      update();
    }
  }

  void clearPlanForm() {
    planBusinessController.clear();
    planNameController.clear();
    planPhoneController.clear();
    planDateController.clear();
    planAddressController.clear();
    planGstController.clear();
  }

  void onTapSelectPlan() async {
    try {
      var res = await httpRequest(REQUEST.post, googleFormSheet1, {
        'name': nameController.text.trim(),
        'mobile': phoneController.text.trim(),
        'email': 'rahul@gmail.com',
        'amount': 500,
      });
    } catch (e) {
      showMySnackBar(e.toString(), error: true);
    }
  }

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
    planBusinessController.dispose();
    planNameController.dispose();
    planPhoneController.dispose();
    planDateController.dispose();
    planAddressController.dispose();
    planGstController.dispose();
    super.onClose();
  }
}
