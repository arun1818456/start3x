import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:start3x/app/constant/app_fonts.dart';
import 'package:start3x/app/constant/assets_images.dart';
import 'package:start3x/app/view/home/home_screen_controller.dart';
import 'package:start3x/app/widgets/button.dart';
import 'package:start3x/app/widgets/text_field.dart';

import '../../../exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeScreenController(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              _buildHeader(controller),
              Divider(
                color: AppColors.greyDarkColor,
                height: 0,
                thickness: 0.2,
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      _buildHeroSection(controller),
                      // // Get Cards Section
                      _buildCardSection(context),
                    ],
                  ),
                  callBackForm(),
                ],
              ),

              Stack(
                children: [
                  Column(
                    children: [
                      // Pricing Section
                      _buildPricingSection(context),
                      // // Partner Section
                      _buildPartnerSection(context),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150,left: 50,right: 50),
                    child: Row(
                      children: [
                        _buildPricingCard(
                          plan: 'Essential',
                          priceA: '₹20,000',
                          priceB: ' (Rupees only)',
                          pLow: "14 visit done",
                          period: '15 days',
                          marginTop: 150,
                        ),
                        const SizedBox(width: 32),
                        _buildPricingCard(
                          plan: 'Professional',
                          pLow: "23 visit done",
                          priceA: '₹30,000 ',
                          priceB: '(Rupees only)',
                          period: '25 days',
                        ),
                        const SizedBox(width: 32),
                        _buildPricingCard(
                          plan: 'Enterprise',
                          pLow: "for 30 appointments.",
                          priceA: '₹1200 ',
                          priceB: '- per visit done',
                          period: 'within preferred time',
                          marginTop: 150,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // // Footer
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(HomeScreenController controller) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B35),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'S3',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: AppFonts.inter,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Start',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.greyDarkColor,
                    fontFamily: AppFonts.inter,
                  ),
                ),
                TextSpan(
                  text: '3x',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.appColorOrange,
                    fontFamily: AppFonts.inter,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          textButton(controller, text: "Home"),
          SizedBox(width: 25),
          textButton(controller, text: "Dashboard"),
          Spacer(),
          CustomButton(
            text:  "Log In/Sign Up",
            onPressed: () {},
            width: Get.width * 0.09,
            buttonHeight: 30,
            radius: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(HomeScreenController controller) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Row(
        children: [
          SizedBox(width: 100),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Stop Chasing Leads.',
                  style: TextStyle(
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: AppFonts.inter,
                  ),
                ),
                const Text(
                  'Start Closing Deals.',
                  style: TextStyle(
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF6B35),
                    fontFamily: AppFonts.inter,
                  ),
                ),
                const Text(
                  'More than revenue growth—we help you build \n'
                  'a productive, organized business that delivers \n'
                  'consistent results with complete clarity.',
                  style: TextStyle(
                    fontSize: 28,
                    color: Color(0xFF666666),
                    height: 1.6,
                    fontFamily: AppFonts.inter,
                  ),
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    // Play Video
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 30,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.appColorOrange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Watch Video",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.inter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 150),
        ],
      ),
    );
  }

  Widget _buildCardSection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.greyDarkColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'What You Can Expect',
            style: TextStyle(
              color: AppColors.appColorOrange,
              fontFamily: AppFonts.inter,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'The results and commitments we deliver\nafter you get started.',
            style: TextStyle(fontSize: 22, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              _buildFeatureCard(
                icon: AppImages.calendar,
                description:
                    'We deliver high-quality, confirmed appointments with the customer\'s details, including the scheduled visit date and time.',
              ),
              const SizedBox(width: 32),
              _buildFeatureCard(
                icon: AppImages.quality,
                description:
                    'We will notify you about every appointment, provide the call recording, and arrange a replacement if the appointment is canceled.',
              ),
              const SizedBox(width: 32),
              _buildFeatureCard(
                icon: AppImages.finger,
                description:
                    'By directly giving you qualified appointments, we save your effort and the daily hassle, making your work easy, clear, and organized.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required String icon,
    required String description,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(icon, width: 50, height: 50),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.greyDarkColor,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingSection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        children: [
          const Text(
            'Get Started',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.appColorOrange,
              fontFamily: AppFonts.inter,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Choose your plan today and start meeting qualified solar\nbuyers instead of chasing leads.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: AppColors.greyDarkColor,
              fontFamily: AppFonts.inter,
            ),
          ),
        SizedBox(height: 430,)
        ],
      ),
    );
  }

  Widget _buildPricingCard({
    required String plan,
    required String priceA,
    required String priceB,
    required String pLow,
    required String period,
    double? marginTop,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: marginTop ?? 0),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.appColorOrange, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              plan,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.inter,
                color: AppColors.appColorOrange,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "For growing businesses. Get consistent,\n quality solar appointments.",
              style: const TextStyle(
                color: AppColors.greyDarkColor,
                fontFamily: AppFonts.inter,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.only(top: 25, bottom: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: priceA,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appColorOrange,
                        fontFamily: AppFonts.inter,
                      ),
                      children: [
                        TextSpan(
                          text: priceB,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            color: AppColors.appColorOrange,
                            fontFamily: AppFonts.inter,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    pLow,
                    style: const TextStyle(
                      color: AppColors.greyDarkColor,
                      fontFamily: AppFonts.inter,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              text: "Get Started",
              onPressed: () {},
              width: Get.width * 0.18,
              buttonHeight: 30,
              radius: 8,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Confirmed solar appointments\n"
                "Replacement on cancellation\n"
                "Delivery in $period \n"
                "Targeted leads (location & interest)\n"
                " Less cold calling, more savings\n"
                "Easy-to-convert meetings",
                style: TextStyle(
                  color: AppColors.greyDarkColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  fontFamily: AppFonts.inter,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPartnerSection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.greyDarkColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        children: [
          SizedBox(height: 150,),
          const Text(
            'Become a Partner',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.appColorOrange,
              fontFamily: AppFonts.inter,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Become a partner and bring people who need our services.\n"
            " Earn 10% profit sharing on every closed deal and receive \n"
            "monthly payouts as long as the client stays active with us.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color: Colors.white, height: 1.6),
          ),
          const SizedBox(height: 32),
          CustomButton(
            text: "Become Partner",
            onPressed: () {},
            width: Get.width * 0.11,
            buttonHeight: 30,
            radius: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.appColorOrange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'S3',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Start',
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.greyDarkColor,
                                fontFamily: AppFonts.inter,
                              ),
                            ),
                            TextSpan(
                              text: '3x',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.appColorOrange,
                                fontFamily: AppFonts.inter,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Reduce your effort, get direct client visits,\n'
                    'and work smoothly with full clarity and zero\n'
                    'stress.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFooterColumn('Product', [
                    'Home',
                    'About',
                    'Pricing',
                    'Plans',
                  ]),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFooterColumn('Company', [
                    'About',
                    'Contact',
                    'Blog',
                    'Careers',
                  ]),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFooterColumn('Legal', [
                    'Privacy Policy',
                    'Terms & Conditions',
                    'Cookie Policy',
                  ]),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Divider(color: Colors.grey[700]),
          const SizedBox(height: 20),
          const Text(
            '© 2026 Start3x. All rights reserved. GSTIN: 18EKHPM0377M1ZL',
            style: TextStyle(fontSize: 14, color: AppColors.greyDarkColor),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterColumn(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.greyDarkColor,
          ),
        ),
        const SizedBox(height: 16),
        ...items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.greyDarkColor,
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget textButton(HomeScreenController controller, {required String text}) {
    Color color = controller.selectedTab == text
        ? AppColors.appColorOrange
        : Colors.transparent;
    return Column(
      children: [
        TextButton(
          onPressed: () {
            controller.selectedTab = text;
            controller.update();
          },
          child: Text(
            text,
            style: TextStyle(
              color: controller.selectedTab == text
                  ? AppColors.appColorOrange
                  : AppColors.greyDarkColor,
              fontFamily: AppFonts.inter,
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 55,
          height: 2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

  Widget callBackForm() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: Get.width / 3 - 50,
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 35),
        margin: EdgeInsets.only(top: 40, right: 100),
        height: 500,
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Set a Callback",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: AppColors.grey2Color,
                fontFamily: AppFonts.inter,
              ),
            ),
            SizedBox(height: 50),
            MyTextFieldForm(hintText: "Legal Business Name (Required)"),
            SizedBox(height: 22),
            MyTextFieldForm(hintText: "Your Name"),
            SizedBox(height: 22),
            MyTextFieldForm(
              hintText: "+91 ",
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: Image.asset(
                  AppImages.flag,
                  width: 5,
                  height: 5,
                  alignment: AlignmentGeometry.center,
                ),
              ),
            ),
            SizedBox(height: 45),
            CustomButton(
              text: "Book Your Free Call",
              onPressed: () {},
              width: Get.width * 0.11,
              buttonHeight: 30,
              radius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
