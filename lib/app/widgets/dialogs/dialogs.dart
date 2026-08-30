import '../../../exports.dart';

class CommonDialogs with BaseClass {
  static void common2ButtonsPopUp(
    BuildContext context, {
    VoidCallback? onClose,
    bool showSecondButton = true,
    required VoidCallback onButtonTap,
    required VoidCallback onButton2Tap,
    required String button1Image,
    required String button2Image,
  }) async {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black12,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween(
                begin: Offset(0, 1),
                end: Offset(0, 0),
              ).animate(animation),
              child: child,
            );
          },
      pageBuilder:
          (
            BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation,
          ) {
            return StatefulBuilder(
              builder: (context, StateSetter setStateDialog) {
                return Container(
                  alignment: Alignment.bottomCenter,
                  child: Wrap(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          padding: EdgeInsets.fromLTRB(
                            20,
                            0,
                            20,
                            MediaQuery.of(context).padding.bottom,
                          ),
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Upload",
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                            onButtonTap();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 14,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                            ),
                                            child: Image.asset(
                                              button1Image,
                                              height: 30,
                                              width: 30,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 14),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                            onButton2Tap();
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                              vertical: 16,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 14,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                            ),
                                            child: Image.asset(
                                              button2Image,
                                              height: 30,
                                              width: 30,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 8,
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(Icons.cancel_outlined),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
    ).then((value) {
      if (onClose != null) {
        onClose();
      }
    });
  }

  void showLogOutDialog(BuildContext context, token) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: AppColors.blackColor.withValues(alpha: 0.9),
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween(
                begin: Offset(0, 1),
                end: Offset(0, 0),
              ).animate(animation),
              child: child,
            );
          },
      pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
        return StatefulBuilder(
          builder: (context, StateSetter setStateDialog) {
            return Padding(
              padding: EdgeInsets.zero,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: true,
                body: Container(
                  alignment: Alignment.bottomCenter,
                  child: Wrap(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                            10,
                            0,
                            10,
                            10 + MediaQuery.of(context).padding.bottom,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: AppColors.blackColor),
                          ),
                          // child: LogoutDialog(
                          //   headerImage: AppImages.logoutPopUp,
                          //   headerImageHeight: 100,
                          //   headerImageWidth: 100,
                          //   title: "Are You Sure You Want to Logout?",
                          //   description:
                          //   "You can log back in to your account to Add You Daily Expenses, are you sure you want to logout?",
                          //   button1Text: "Cancel",
                          //   button2Text: "Logout",
                          //   onButton1Tap: () {
                          //     Get.back();
                          //   },
                          //   onButton2Tap: () async {
                          //     // showCircularLoader();
                          //     // ExpenseController expenseController =
                          //     // Get.find<ExpenseController>();
                          //     // List<Map<String, dynamic>>
                          //     // expenseList = expenseController.expenses
                          //     //     .map(
                          //     //       (expense) => {
                          //     //     "id": expense.id,
                          //     //     "title": expense.title,
                          //     //     "amount": expense.amount,
                          //     //     "category": expense.category.name,
                          //     //     "paymentType": expense.paymentType,
                          //     //     "date": expense.date
                          //     //         .toUtc()
                          //     //         .toIso8601String(),
                          //     //     "groupId":expense.groupId,
                          //     //     "groupName":expense.groupName,
                          //     //     "description": expense.description,
                          //     //   },
                          //     // )
                          //     //     .toList();
                          //     // try {
                          //     //   var response = await httpRequest(
                          //     //     REQUEST.post,
                          //     //     logoutApiEndPoint,
                          //     //     {"expenses": expenseList},
                          //     //     token: token,
                          //     //   );
                          //     //   if (response["success"] == true) {
                          //     //     // Clear SQL Database
                          //     //     await expenseController.clearAllExpenses();
                          //     //
                          //     //     // Clear All Local Storage (GetStorage)
                          //     //     await GetStorage().erase();
                          //     //
                          //     //     // Sign out from Google
                          //     //     await GoogleSignIn().signOut();
                          //     //     try {
                          //     //       await GoogleSignIn().disconnect();
                          //     //     } catch (e) {
                          //     //       debugPrint("Google disconnect error: $e");
                          //     //     }
                          //     //
                          //     //     Get.back();
                          //     //     Get.back();
                          //     //     Get.back();
                          //     //     Get.toNamed(AppRoutes.authScreen);
                          //     //     showMySnackBar("Logged out successfully", success: true);
                          //     //   } else {
                          //     //     showMySnackBar(
                          //     //       response["message"],
                          //     //       error: true,
                          //     //     );
                          //     //   }
                          //     // } catch (e) {
                          //     //   showMySnackBar(e.toString(), error: true);
                          //     // }
                          //   },
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // static void showLoginRequiredDialog(BuildContext context) {
  //   showGeneralDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  //     barrierColor: AppColors.blackColor.withValues(alpha: 0.9),
  //     transitionDuration: const Duration(milliseconds: 150),
  //     transitionBuilder:
  //         (
  //         BuildContext context,
  //         Animation<double> animation,
  //         Animation<double> secondaryAnimation,
  //         Widget child,
  //         ) {
  //       return SlideTransition(
  //         position: Tween(
  //           begin: Offset(0, 1),
  //           end: Offset(0, 0),
  //         ).animate(animation),
  //         child: child,
  //       );
  //     },
  //     pageBuilder:
  //         (
  //         BuildContext buildContext,
  //         Animation animation,
  //         Animation secondaryAnimation,
  //         ) {
  //       return StatefulBuilder(
  //         builder: (context, StateSetter setStateDialog) {
  //           return Padding(
  //             padding: EdgeInsets.zero,
  //             child: Scaffold(
  //               backgroundColor: Colors.transparent,
  //               resizeToAvoidBottomInset: true,
  //               body: Container(
  //                 alignment: Alignment.bottomCenter,
  //                 child: Wrap(
  //                   children: [
  //                     Material(
  //                       color: Colors.transparent,
  //                       child: Container(
  //                         margin: EdgeInsets.fromLTRB(
  //                           10,
  //                           0,
  //                           10,
  //                           10 + MediaQuery.of(context).padding.bottom,
  //                         ),
  //                         decoration: BoxDecoration(
  //                           color: AppColors.whiteColor,
  //                           borderRadius: BorderRadius.circular(14),
  //                           border: Border.all(color: AppColors.blackColor),
  //                         ),
  //                         child: LogoutDialog(
  //                           headerImage: AppImages.loadingGif,
  //                           headerImageHeight: 100,
  //                           headerImageWidth: 100,
  //                           title: "Login Required",
  //                           description:
  //                           "To use this feature please login or signup",
  //                           button1Text: "Cancel",
  //                           button2Text: "Login",
  //                           onButton1Tap: () {
  //                             Get.back();
  //                           },
  //                           onButton2Tap: () {
  //                             Get.back();
  //                             Get.toNamed(AppRoutes.authScreen);
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  Future<void> showUpdateDialog(BuildContext context) async {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Update",
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.system_update,
                      size: 50,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Update Available",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "A new version is now available.\n"
                      "Update now to enjoy the latest features, performance improvements, and bug fixes.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            // isBorderEnable: true,
                            // borderColor: AppColors.appColor,
                            color: Colors.white,
                            // textColor: AppColors.appColor,
                            text: "Later",
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomButton(
                            text: "Update Now",
                            onPressed: () async {
                              // const url =
                              //     "https://play.google.com/store/apps/details?id=com.aruninnovation.studio.daily_expense_tracker";
                              //
                              // await launchUrl(
                              //   Uri.parse(url),
                              //   mode: LaunchMode.externalApplication,
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> showCustomDialog(
    BuildContext context, {
    required String title,
    required String description,
    required String yesButtonText,
    required String noButtonText,
    required VoidCallback onTapYes,
  }) async {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: title,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return SafeArea(
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        if (noButtonText.isNotEmpty)
                          Expanded(
                            child: CustomButton(
                              // isBorderEnable: true,
                              // borderColor: AppColors.appColor,
                              // color: Colors.white,
                              // textColor: AppColors.appColor,
                              text: noButtonText,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomButton(
                            text: yesButtonText,
                            onPressed: () {
                              Navigator.of(context).pop();
                              onTapYes();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void showScalePlanDialog(BuildContext context, {required String planName}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Scale Plan",
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, a1, a2, child) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(opacity: a1.value, child: child),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 400,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$planName plan",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF555555),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildDialogTextField(hint: "Legal Business Name (Required)"),
                  const SizedBox(height: 16),
                  _buildDialogTextField(hint: "Your Name"),
                  const SizedBox(height: 16),
                  _buildDialogTextField(
                    hint: "+91",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(AppImages.flag, width: 24),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDialogTextField(
                    hint: "When would you like to start?",
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(height: 24, width: 1, color: Colors.grey.shade400),
                        const SizedBox(width: 12),
                        const Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(Icons.calendar_month_outlined, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomPaint(
                    painter: DashedRectPainter(color: Colors.black45, gap: 4),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const Text(
                        "GST Document Attachment (PDF,\nPNG, or JPEG format only).",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF444444),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: "Start Now",
                    onPressed: () => Get.back(),
                    width: 200,
                    buttonHeight: 45,
                    radius: 12,
                    color: AppColors.appColorOrange,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildDialogTextField({required String hint, Widget? prefixIcon, Widget? suffixIcon}) {
    return MyTextFieldForm(
      hintText: hint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      fillColor: const Color(0xFFDCDCDC),
      borderColor: Colors.transparent,
      formRadius: 12,
      hintStyle: const TextStyle(color: Color(0xFF666666), fontSize: 14),
    );
  }
}

class DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedRectPainter({this.color = Colors.black, this.strokeWidth = 1.0, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Use a simpler approach for dashed lines to avoid complex path metrics in CanvasKit
    double radius = 12.0;
    RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    Path path = Path()..addRRect(rrect);
    
    // Draw using dash path effect logic but more carefully
    for (final measure in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < measure.length) {
        final double nextDistance = distance + gap;
        canvas.drawPath(
          measure.extractPath(distance, nextDistance),
          dashedPaint,
        );
        distance = nextDistance + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedRectPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.gap != gap;
  }
}
