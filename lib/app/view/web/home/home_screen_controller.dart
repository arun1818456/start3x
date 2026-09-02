
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

  // Callback Form Controllers
  final callBusinessController = TextEditingController();
  final callNameController = TextEditingController();
  final callPhoneController = TextEditingController();

  bool isSubmitting = false;
  bool isSubmittingPlan = false;
  bool isSubmittingCallback = false;

  Future<void> submitCallbackForm() async {
    final business = callBusinessController.text.trim();
    final name = callNameController.text.trim();
    final phone = callPhoneController.text.trim();

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

    isSubmittingCallback = true;
    update();

    try {
      final response = await http.post(
        Uri.parse(freeCallLeads),
        body: jsonEncode({
          "business": business,
          "name": name,
          "phone": phone,
        }),
      );

      if (response.statusCode == 302 || response.statusCode == 200) {
        showMySnackBar("Free Call booked successfully!", success: true);
        _clearCallbackForm();
      } else {
        showMySnackBar("Free Call booked successfully!", success: true);
        _clearCallbackForm();
      }
    } catch (e) {
      debugPrint("Error submitting callback form: $e");
      showMySnackBar("Free Call booked successfully!", success: true);
      _clearCallbackForm();
    } finally {
      isSubmittingCallback = false;
      update();
    }
  }

  void _clearCallbackForm() {
    callBusinessController.clear();
    callNameController.clear();
    callPhoneController.clear();
  }

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
    if (address.isEmpty) {
      showMySnackBar("Address is required", error: true);
      return;
    }
    if (gst.isEmpty) {
      showMySnackBar("GST is required", error: true);
      return;
    }
    isSubmittingPlan = true;
    update();

    try {
      await http.post(
        Uri.parse(planSelectSheet),
        body: jsonEncode({
          "business": business,
          "name": name,
          "phone": phone,
          "date": date,
          "amount": planAmount,
          "address": address,
          "gst": gst,
        }),
      );
      Get.back();
      showMySnackBar("Plan request submitted successfully!", success: true);
      clearPlanForm();
    } catch (e) {
      debugPrint("Error submitting plan form: $e");
      showMySnackBar("Plan request submitted!", success: true);
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


  Future<void> submitPartnerForm() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty || phoneController.text.isEmpty) {
      showMySnackBar("Please fill in all required fields", error: true);
      return;
    }

    isSubmitting = true;
    update();

    try {
      // Replace this with your actual Google Apps Script Web App URL

      final response = await http.post(
        Uri.parse(partnerSheet),
        body:jsonEncode( {
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "phone": phoneController.text.trim(),
          "occupation": occupationController.text.trim(),
        }),
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
      showMySnackBar("Form Failed to Submit!", error: true);
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
    callBusinessController.dispose();
    callNameController.dispose();
    callPhoneController.dispose();
    super.onClose();
  }
}
