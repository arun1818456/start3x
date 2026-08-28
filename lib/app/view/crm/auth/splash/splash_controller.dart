import 'dart:async';

import '../../../../../exports.dart';

class SplashController extends GetxController {
  late Timer timer;
  // final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  /// Navigates to the next screen based on the user's authentication status and data.
  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () async {
      // final user = auth.currentUser;
      // if (user != null) {
      //   await _handleAuthenticatedUser(user);
      // } else {
      //   // If no authenticated user, go to the login route
        Get.offAllNamed(AppRoutes.loginScreen);
      // }
    });
  }

  /// Handles logic for authenticated users.
  // Future<void> _handleAuthenticatedUser(User user) async {
  //   final userDoc = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user.uid)
  //       .get();
  //
  //   if (userDoc.exists) {
  //     final userData = userDoc.data()!;
  //     print("--------------------$userData");
  //     await LocalStorage().saveUserData(UserDataModel.fromJson(userData));
  //     LocalStorage().saveAdminTeamLength(userData["team_members"].length);
  //     checkingRoute(
  //       subscriptionMode: userData["subscription_mode"],
  //       newUser: userData["new_user"],
  //       userType: userData["user_type"] == ""
  //           ? "not_selected"
  //           : userDoc["user_type"],
  //     );
  //   } else {
  //     // If user document does not exist, sign out and navigate to login
  //     await auth.signOut();
  //     Get.offAllNamed(AppRoutes.loginScreen);
  //   }
  // }
}
