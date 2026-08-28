import 'package:start3x/app/mixin/base_class.dart';

import '../../../../../exports.dart';


class PassKeyController extends GetxController  with BaseClass{
  final TextEditingController passController = TextEditingController();
  bool loading = false;
  Future<void> onTapSubmittedButton() async {
    // if (_isPassKeyValid()) {
    //   _setLoading(true);
    //   keyBoardOff(); // Call your keyboard dismiss function
    //
    //   String passKey = passController.text.trim();
    //   try {
    //     DocumentSnapshot doc = await _fetchPassKeyDocument(passKey);
    //
    //     if (doc.exists) {
    //       await _handleValidPassKey(doc);
    //     } else {
    //       Message().toast("Passkey not valid.", error: true);
    //     }
    //   } catch (e) {
    //     Message().toast("An error occurred: ${e.toString()}", error: true);
    //   } finally {
    //     _setLoading(false);
    //   }
    // } else {
    //   Message().toast("Please enter passkey", alert: true);
    // }
  }

  // Check if the passkey is valid
  bool _isPassKeyValid() {
    return passController.text.isNotEmpty;
  }

  // Fetch the passkey document from Firestore
  // Future<DocumentSnapshot> _fetchPassKeyDocument(String passKey) {
  //   return FirebaseFirestore.instance.collection("pass_key").doc(passKey).get();
  // }

  // Handle actions for a valid passkey
  // Future<void> _handleValidPassKey(DocumentSnapshot doc) async {
  //   Message().toast("Access granted. Passkey is valid.", success: true);
  //   await LocalStorage().saveAdminData({
  //     "pass_key": passController.text.toString(),
  //     "user_type": "team_member",
  //     "fcm_token":doc["fcm_token"],
  //     "admin_id": doc["admin_id"],
  //     "admin_name": doc["admin_name"],
  //     "subscription_last_day": doc["subscription_last_day"],
  //     "subscription_mode": doc["subscription_mode"],
  //     "subscription_start_day": doc["subscription_start_day"],
  //   });
  //   Get.offNamed(AppRoutes.detailsScreen);
  // }
  //
  // // Private method to set loading state
  // void _setLoading(bool value) {
  //   loading = value; // Update using Rx
  //   update();
  // }
}
