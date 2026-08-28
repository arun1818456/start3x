import 'package:get_storage/get_storage.dart';
import 'package:start3x/app/models/user_model.dart';

import '../../exports.dart';
import '../constant/local_keys.dart';

mixin BaseClass {
  final storage = GetStorage();

  UserDataModel getUserData() {
    if (storage.hasData(LocalKeys.userData)) {
      return UserDataModel.fromJson(storage.read(LocalKeys.userData));
    } else {
      return UserDataModel();
    }
  }

  void showMySnackBar(
      String message, {
        bool error = false,
        int? second = 2,
        bool success = false,
        bool alert = false,
      }) {
    Get.closeAllSnackbars();

    final borderColor = success
        ? const Color(0xffFFD54F)
        : alert
        ? Colors.orangeAccent
        : Colors.redAccent;

    final icon = success
        ? Icons.emoji_events_rounded
        : alert
        ? Icons.warning_amber_rounded
        : Icons.cancel_rounded;

    Get.showSnackbar(
      GetSnackBar(
        maxWidth: Get.width * 0.5,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(top: 18, left: 16, right: 16),
        padding: EdgeInsets.zero,
        duration: Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 450),
        borderRadius: 18,

        messageText: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff2B1B0F), Color(0xff5A3720)],
            ),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: borderColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: borderColor.withValues(alpha: 0.45),
                blurRadius: 18,
                spreadRadius: 2,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xffFFD54F), Color(0xffFFB300)],
                  ),
                ),
                child: Icon(icon, color: Colors.white, size: 26),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      success
                          ? "VICTORY!"
                          : alert
                          ? "WARNING!"
                          : "FAILED!",
                      style: const TextStyle(
                        color: Color(0xffFFE082),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // final GetStorage storage = GetStorage();
  //
  // UserDataModel getUserData() {
  //   if (storage.hasData(LocalKeys.userData)) {
  //     return UserDataModel.fromJson(storage.read(LocalKeys.userData));
  //   } else {
  //     return UserDataModel();
  //   }
  // }
  //
  // Future getDeviceToken() async {
  //   NotificationSettings settings = await FirebaseMessaging.instance
  //       .requestPermission();
  //
  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     String? token = await FirebaseMessaging.instance.getToken();
  //
  //     debugPrint("🔥 FCM Device Token: $token");
  //     return token ?? "";
  //   } else {
  //     showDialog(
  //       context: Get.context!,
  //       builder: (context) => AlertDialog(
  //         title: const Text("Enable Notifications"),
  //         content: const Text(
  //           "Notifications are turned off. To receive updates, please enable notifications in settings.",
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: const Text("Cancel"),
  //           ),
  //           TextButton(
  //             onPressed: () async {
  //               Navigator.pop(context);
  //               await openAppSettings(); // from permission_handler package
  //             },
  //             child: const Text("Open Settings"),
  //           ),
  //         ],
  //       ),
  //     );
  //     return "";
  //   }
  // }
  //
  // void showCircularLoader() {
  //   Get.dialog(LoadingDialog(), barrierDismissible: false);
  // }
  //
  // Color getCategoryColor(ExpenseCategory category) {
  //   switch (category) {
  //     case ExpenseCategory.food:
  //       return Colors.orange;
  //     case ExpenseCategory.transportation:
  //       return Colors.blue;
  //     case ExpenseCategory.entertainment:
  //       return Colors.purple;
  //     case ExpenseCategory.shopping:
  //       return Colors.pink;
  //     case ExpenseCategory.health:
  //       return Colors.red;
  //     case ExpenseCategory.utilities:
  //       return Colors.teal;
  //     case ExpenseCategory.vegetables:
  //       return Colors.green;
  //     case ExpenseCategory.other:
  //       return Colors.grey;
  //   }
  // }
  //
  // String formatDecimalAmount(double amount) {
  //   if (amount % 1 == 0) {
  //     return amount.toInt().toString();
  //   } else {
  //     return amount
  //         .toStringAsFixed(2)
  //         .replaceAll(RegExp(r'0+$'), '')
  //         .replaceAll(RegExp(r'\.$'), '');
  //   }
  // }
  //
  // String formatCompactAmount(double amount) {
  //   if (amount >= 1000000000) {
  //     return '${(amount / 1000000000).toStringAsFixed(1)}B';
  //   } else if (amount >= 1000000) {
  //     return '${(amount / 1000000).toStringAsFixed(1)}M';
  //   } else if (amount >= 10000) {
  //     return '${(amount / 1000).toStringAsFixed(1)}K';
  //   } else {
  //     return formatDecimalAmount(amount);
  //   }
  // }
  //
  // void showComingSoonDialog() {
  //   Get.dialog(
  //     Dialog(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //       child: Padding(
  //         padding: const EdgeInsets.all(20),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Icon(Icons.build_circle, size: 50, color: Colors.deepPurple),
  //             const SizedBox(height: 12),
  //             const Text(
  //               "Coming Soon 🚀",
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             ),
  //             const SizedBox(height: 10),
  //             const Text(
  //               "App is under process.\nThis feature will be available in the next update.",
  //               textAlign: TextAlign.center,
  //             ),
  //             const SizedBox(height: 20),
  //             ElevatedButton(
  //               onPressed: () => Get.back(),
  //               child: const Text("OK"),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  void keyBoardOff() {
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  //
  // void showMySnackBar(
  //   String message, {
  //   bool error = false,
  //   int? second = 2,
  //   bool success = false,
  //   bool alert = false,
  // }) {
  //   Get.showSnackbar(
  //     GetSnackBar(
  //       message: message,
  //
  //       // backgroundColor: color ?? Colors.green,
  //       backgroundColor: success
  //           ? Colors.green.shade800
  //           : alert
  //           ? Colors.orange.shade100
  //           : Colors.red,
  //       duration: Duration(seconds: second ?? 3),
  //       margin: const EdgeInsets.all(12),
  //       borderRadius: 8,
  //       snackPosition: SnackPosition.TOP,
  //     ),
  //   );
  // }
  //
  // String getId() {
  //   DateTime now = DateTime.now();
  //   String name = (getUserData().name ?? "new").trim().split(" ").first;
  //   return "SID-$name-${now.day.toString().padLeft(2, '0')}"
  //       "${now.month.toString().padLeft(2, '0')}"
  //       "${now.year}-"
  //       "${now.hour.toString().padLeft(2, '0')}"
  //       "${now.minute.toString().padLeft(2, '0')}"
  //       "${now.second.toString().padLeft(2, '0')}";
  // }
  //
  // String timeAgo(String timestamp) {
  //   DateTime past = DateTime.parse(timestamp).toUtc();
  //   DateTime now = DateTime.now().toUtc();
  //
  //   Duration diff = now.difference(past);
  //
  //   if (diff.inSeconds < 60) {
  //     return diff.inSeconds <= 1 ? "1 sec. ago" : "${diff.inSeconds} sec ago";
  //   }
  //   if (diff.inMinutes < 60) {
  //     return diff.inMinutes <= 1 ? "1 min ago" : "${diff.inMinutes} min ago";
  //   }
  //   if (diff.inHours < 24) {
  //     return diff.inHours <= 1 ? "1 hour ago" : "${diff.inHours} hours ago";
  //   }
  //
  //   // Yesterday
  //   if (diff.inDays == 1) {
  //     return "yesterday";
  //   }
  //
  //   if (diff.inDays < 30) {
  //     return diff.inDays <= 1 ? "1 day ago" : "${diff.inDays} days ago";
  //   }
  //
  //   int months = (diff.inDays / 30).floor();
  //   if (months < 12) {
  //     return months <= 1 ? "1 month ago" : "$months months ago";
  //   }
  //
  //   int years = (months / 12).floor();
  //   return years <= 1 ? "1 year ago" : "$years years ago";
  // }
  //
  // String getGreeting() {
  //   final hour = DateTime.now().hour;
  //
  //   if (hour < 12) {
  //     return "Good Morning ☀️";
  //   } else if (hour < 17) {
  //     return "Good Afternoon 🌤️";
  //   } else if (hour < 21) {
  //     return "Good Evening 🌤";
  //   } else {
  //     return "Good Night 🌙";
  //   }
  // }
}
