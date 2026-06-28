import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start3x/app/constant/app_fonts.dart';
import 'package:start3x/app/constant/colors.dart';
import 'package:start3x/app/view/profile/profile_controller.dart';
import 'package:start3x/app/widgets/button.dart';
import 'package:start3x/app/widgets/logo_text_widget.dart';
import 'package:start3x/app/widgets/profile_name_widget.dart';

import '../../widgets/footer_widget.dart';
import '../../widgets/text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  _buildHeader(controller),
                  Divider(
                    color: AppColors.greyDarkColor,
                    height: 0,
                    thickness: 0.2,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 3 - 80,
                      vertical: 20,
                    ),
                    height: 100,
                    alignment: Alignment.bottomLeft,
                    color: AppColors.appColorOrange,
                    child: Text(
                      "Arun Mehra",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 3 - 80,
                      vertical: 20,
                    ),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomButton(
                          width: 150,
                          text: "Save Changes",
                          onPressed: () {},
                          color: Colors.white,
                          buttonHeight: 30,
                          isBorderEnable: true,
                          textColor: AppColors.appColorOrange,
                          borderColor: AppColors.appColorOrange,
                        ),
                        SizedBox(height: 20),

                        Row(
                          children: [
                            Expanded(
                              child: MyTextFieldForm(
                                hintText: "Enter Full Name",
                                label: "Full Name",
                                borderColor: AppColors.grey2Color,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: MyTextFieldForm(
                                hintText: "Email",
                                label: "Email Id",
                                borderColor: AppColors.grey2Color,
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: MyTextFieldForm(
                                label: "Mobile Number",
                                hintText: "+91 ",
                                borderColor: AppColors.grey2Color,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: MyTextFieldForm(
                                hintText: "City",
                                label: "City",
                                borderColor: AppColors.grey2Color,
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: MyTextFieldForm(
                                label: " Business Niche",
                                hintText: "Solar",
                                borderColor: AppColors.grey2Color,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: MyTextFieldForm(
                                label: "Team Size",
                                hintText: "**",
                                borderColor: AppColors.grey2Color,
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: MyTextFieldForm(
                                label: "Business Niche",
                                hintText: "Solar",
                                borderColor: AppColors.grey2Color,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FooterWidget(),
                ],
              ),
              Positioned(
                top: 100,
                left: 200,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Profile Image
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Online Indicator
                    Positioned(
                      right: 2,
                      bottom: 2,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
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

  Widget _buildHeader(ProfileController controller) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      child: Row(
        children: [
          LogoTextWidget(),
          Spacer(),
          Text(
            "Profile",
            style: TextStyle(
              fontFamily: AppFonts.inter,
              fontSize: 20,
              color: AppColors.greyDarkColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          ProfileNameWidget(),
        ],
      ),
    );
  }
}
