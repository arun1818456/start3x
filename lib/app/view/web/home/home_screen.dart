import 'package:start3x/app/mixin/responsive_helper.dart';
import 'package:start3x/app/widgets/dialogs/dialogs.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../exports.dart';

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    bool isTablet = ResponsiveHelper.isTablet(context);
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

              if(controller.selectedTab == "Home")...[
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

                    const SizedBox(height: 60),
                    if (isMobile || isTablet)
                      Column(
                        children: [
                          _buildPricingCard(
                            plan: 'STARTER',
                            color: const Color(0xFF0052CC),
                            icon: Icons.rocket_launch_outlined,
                            price: '30,000',
                            appointments: '15',
                            isPopular: false,
                          ),
                          const SizedBox(height: 32),
                          _buildPricingCard(
                            plan: 'MOST POPULAR',
                            color: const Color(0xFFFF6B35),
                            icon: Icons.auto_graph,
                            price: '60,000',
                            appointments: '45',
                            isPopular: true,
                            breakdown: [
                              '15 Included in the first ₹30,000',
                              '+ 30 Additional at ₹1,000 each',
                            ],
                          ),
                          const SizedBox(height: 32),
                          _buildPricingCard(
                            plan: 'SCALE',
                            color: const Color(0xFF00875A),
                            icon: Icons.track_changes,
                            price: '90,000',
                            appointments: '75',
                            isPopular: false,
                            breakdown: [
                              '15 Included in the first ₹30,000',
                              '+ 60 Additional at ₹1,000 each',
                            ],
                          ),
                        ],
                      )
                    else
                      Padding(
                          padding: const EdgeInsets.only(top: 350,left: 50,right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildPricingCard(
                              plan: 'STARTER',
                              color: const Color(0xFF0052CC),
                              icon: Icons.rocket_launch_outlined,
                              price: '30,000',
                              appointments: '15',
                              isPopular: false,
                            ),
                            const SizedBox(width: 24),
                            _buildPricingCard(
                              plan: 'MOST POPULAR',
                              color: const Color(0xFFFF6B35),
                              icon: Icons.auto_graph,
                              price: '60,000',
                              appointments: '45',
                              isPopular: true,
                              breakdown: [
                                '15 Included in the first ₹30,000',
                                '+ 30 Additional at ₹1,000 each',
                              ],
                            ),
                            const SizedBox(width: 24),
                            _buildPricingCard(
                              plan: 'SCALE',
                              color: const Color(0xFF00875A),
                              icon: Icons.track_changes,
                              price: '90,000',
                              appointments: '75',
                              isPopular: false,
                              breakdown: [
                                '15 Included in the first ₹30,000',
                                '+ 60 Additional at ₹1,000 each',
                              ],
                            ),
                          ],
                        ),
                      ),

                    // Padding(
                    //   padding: const EdgeInsets.only(top: 150,left: 50,right: 50),
                    //   child: Row(
                    //     children: [
                    //       _buildPricingCard(
                    //         plan: 'Essential',
                    //         priceA: '₹20,000',
                    //         priceB: ' (Rupees only)',
                    //         pLow: "14 visit done",
                    //         period: '15 days',
                    //         marginTop: 150,
                    //       ),
                    //       const SizedBox(width: 32),
                    //       _buildPricingCard(
                    //         plan: 'Professional',
                    //         pLow: "23 visit done",
                    //         priceA: '₹30,000 ',
                    //         priceB: '(Rupees only)',
                    //         period: '25 days',
                    //       ),
                    //       const SizedBox(width: 32),
                    //       _buildPricingCard(
                    //         plan: 'Enterprise',
                    //         pLow: "for 30 appointments.",
                    //         priceA: '₹1200 ',
                    //         priceB: '- per visit done',
                    //         period: 'within preferred time',
                    //         marginTop: 150,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ] else...[
                _buildDashBoard(),
              ],
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(25),
                color: Colors.white,
                child: Column(
                  children: [
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
                      "Become a partner and bring people who need our services.Earn 10% profit sharing on every closed deal\n"
                          "and receive monthly payouts as long as the client stays active with us.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black, height: 1.6),
                    ),
                    const SizedBox(height: 60),
                    _buildPartnerContactForm(context, controller),
                  ],
                ),
              ),
              // Footer
              FooterWidget(),

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
          LogoTextWidget(),
          Spacer(),
          textButton(controller, text: "Home"),
          SizedBox(width: 25),
          textButton(controller, text: "Dashboard"),
          Spacer(),
          CustomButton(
            text:  "coming-soon",//Log In/Sign Up
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
                  child: HoverScaleWidget(
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
    bool isMobile = ResponsiveHelper.isMobile(context);
    bool isTablet = ResponsiveHelper.isTablet(context);
    double horizontalPadding = ResponsiveHelper.getHorizontalPadding(context);

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 80),
      child: Column(
        children: [
          const Icon(Icons.wb_sunny_outlined, color: Colors.orange, size: 40),
          const SizedBox(height: 12),
          Text(
            'SOLAR GROWTH PLAYBOOK',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0D1B3E),
              fontFamily: AppFonts.inter,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'A simple, proven system to generate qualified appointments\nso you can focus on growing your solar business.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: const Color(0xFF666666),
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
    required Color color,
    required IconData icon,
    required String price,
    required String appointments,
    required bool isPopular,
    List<String>? breakdown,
  }) {
    return HoverScaleWidget(
      scale: 1.03,
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isPopular ? color : Colors.grey,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isPopular ? color.withValues(alpha: 0.15) : Colors.black.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                plan,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Icon(icon, color: color, size: 48),
            const SizedBox(height: 20),
            Text(
              '₹$price',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D1B3E),
              ),
            ),
            const Text(
              '/ 30 Days',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(indent: 40, endIndent: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointments,
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(width: 8),
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    'QUALIFIED\nAPPOINTMENTS\nINCLUDED',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D1B3E),
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
            if (breakdown != null) ...[
              const SizedBox(height: 20),
              ...breakdown.map((text) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
              )),
            ],
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomButton(
                text: "Get Started",
                onPressed: () {
                  CommonDialogs.showScalePlanDialog(
                    Get.context!,
                    planName: plan.toLowerCase().capitalizeFirst!,
                  );
                },
                width: double.infinity,
                buttonHeight: 50,
                radius: 12,
                color: isPopular ? color : Colors.white,
                textColor: isPopular ? Colors.white : color,
                isBorderEnable: !isPopular,
                borderColor: color,
              ),
            ),
            const SizedBox(height: 32),
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
          SizedBox(height: 100,),
          const SizedBox(height: 40),
          _buildInfoBox(context),
          const SizedBox(height: 20),
          _buildWhatWeDoSection(context),
          SizedBox(height: 15,),

        ],
      ),
    );
  }

  Widget _buildPartnerContactForm(BuildContext context, HomeScreenController controller) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: EdgeInsets.all(isMobile ? 24 : 60),
      decoration: BoxDecoration(
        color: const Color(0xFFE6E6E6),
        borderRadius: BorderRadius.circular(24),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPartnerContactInfo(),
                const SizedBox(height: 60),
                _buildPartnerFormFields(controller),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _buildPartnerContactInfo()),
                const SizedBox(width: 80),
                Expanded(flex: 3, child: _buildPartnerFormFields(controller)),
              ],
            ),
    );
  }

  Widget _buildPartnerContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Three ways in.",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0D1B3E),
            fontFamily: AppFonts.inter,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Whichever route, you'll reach a partner — not a sales funnel.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: AppFonts.inter,
          ),
        ),
        const SizedBox(height: 48),
        _buildContactBox(
          label: "EMAIL",
          value: "sme.start3x@gmail.com",
          onTap: () async {
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'sme.start3x@gmail.com',
            );
            try {
              await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
            } catch (e) {
              debugPrint("Could not launch email: $e");
            }
          },
          action: const Icon(Icons.arrow_forward, size: 20),
        ),
        const SizedBox(height: 20),
        _buildContactBox(
          label: "DIRECT LINE",
          value: "+91 76960-23635",
          onTap: () async {
            final Uri telLaunchUri = Uri(
              scheme: 'tel',
              path: '+917696023635',
            );
            try {
              await launchUrl(telLaunchUri, mode: LaunchMode.externalApplication);
            } catch (e) {
              debugPrint("Could not launch phone: $e");
            }
          },
          action: _buildActionText("CALL"),
        ),
        const SizedBox(height: 20),
        _buildContactBox(
          label: "Office",
          value: "Plot No. C-157, Industrial Area, Phase VII, Sector 73, Mohali, Punjab – 160055",
          onTap: () async {
            const String lat = "30.7046";
            const String long = "76.6923";
            final String googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=$lat,$long";
            
            try {
              await launchUrl(Uri.parse(googleMapsUrl), mode: LaunchMode.externalApplication);
            } catch (e) {
              debugPrint("Could not launch maps: $e");
            }
          },
          action: _buildActionText("MAP"),
        ),
      ],
    );
  }

  Widget _buildContactBox({
    required String label,
    required String value,
    required Widget action,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0D1B3E),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: action,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildPartnerFormFields(HomeScreenController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPartnerFormField(number: "01", label: "YOUR NAME", hint: "Type here", controller: controller.nameController),
        _buildPartnerFormField(number: "02", label: "EMAIL", hint: "you@company.com", controller: controller.emailController),
        _buildPartnerFormField(number: "03", label: "CONTACT NUMBER", hint: "enter your number with country code", controller: controller.phoneController),
        _buildPartnerFormField(number: "04", label: "OCCUPATION", hint: "Optional", controller: controller.occupationController),
        // _buildPartnerFormField(number: "05", label: "BUDGET RANGE", hint: "Select a range", isDropdown: true),
        // _buildPartnerFormField(number: "06", label: "TELL US ABOUT THE PROJECT", hint: "One paragraph is plenty — we'll ask the rest.", isMultiline: true),
        controller.isSubmitting 
          ? const Center(child: CircularProgressIndicator(color: AppColors.appColorOrange))
          : CustomButton(
              text: "Become Partner",
              onPressed: () {
                controller.submitPartnerForm();
              },
              width: Get.width * 0.11,
              buttonHeight: 30,
              radius: 8,
            ),
      ],
    );
  }

  Widget _buildPartnerFormField({
    required String number,
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isDropdown = false,
    bool isMultiline = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "[ $number ] — $label",
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  maxLines: isMultiline ? null : 1,
                  style: const TextStyle(fontSize: 18, color: Color(0xFF0D1B3E)),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              if (isDropdown)
                Icon(Icons.keyboard_arrow_down, color: Colors.brown.shade300, size: 24),
            ],
          ),
        ],
      ),
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

  Widget _buildDashBoard() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(
              color: AppColors.appColorOrange,
              fontFamily: AppFonts.inter,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Features that help you manage data with \nclarity and confidence.',
            style: TextStyle(fontSize: 18, color: AppColors.greyDarkColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDashCard(
                onTap: (){
                  Get.toNamed(AppRoutes.profileScreen);
                },
                icon: AppImages.resume,
                description:
                'Personal Information',
              ),
              _buildDashCard(
                onTap: (){
                  Get.toNamed(AppRoutes.invoice);
                },
                icon: AppImages.contract,
                description:
                'Create Invoices & Contracts',
              ),
              _buildDashCard(
                onTap: (){},
                icon: AppImages.solutions,
                description:
                'Manage Prospects & Appointments',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDashCard({
    required GestureTapCallback onTap,
    required String icon,
    required String description,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: Get.height * 0.35,
        width: Get.height * 0.35,
        decoration: BoxDecoration(
          color: AppColors.grey4Color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 80, height: 80),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.appColorOrange,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWhatWeDoSection(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    return Column(
      children: [
        const Text(
          'What will we do in Plans',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.appColorOrange,
            fontFamily: AppFonts.inter,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          alignment: WrapAlignment.center,
          children: [
            _buildServiceItem(Icons.campaign_outlined, 'MARKETING'),
            _buildServiceItem(Icons.groups_outlined, 'LEAD GENERATION'),
            _buildServiceItem(Icons.phone_in_talk_outlined, 'CALLING'),
            _buildServiceItem(Icons.sync_outlined, 'FOLLOW-UP'),
            _buildServiceItem(Icons.chat_outlined, 'CLIENT MESSAGES & REPLIES'),
            _buildServiceItem(Icons.calendar_month_outlined, 'APPOINTMENT SETTING'),
            _buildServiceItem(Icons.storage_outlined, 'DATA MANAGEMENT & SHEET UPDATE'),
            _buildServiceItem(Icons.assignment_outlined, 'GUIDING TASKS TO OVERCOME MISS OPPORTUNITIES'),
            _buildServiceItem(Icons.share_outlined, 'SOCIAL MEDIA STRATEGY'),
            _buildServiceItem(Icons.bar_chart_outlined, 'DAILY REPORTING'),
            _buildServiceItem(Icons.account_tree_outlined, 'KNOWING WORK FLOW FROM CLIENT TEAM'),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoBox(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFCCE0FF)),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Color(0xFF0052CC), size: 32),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              'You always start with 15 qualified appointments included in the first ₹30,000. '
                  'After that, you only pay ₹1,000 for every additional qualified appointment you receive.',
              style: TextStyle(color: const Color(0xFF0D1B3E), fontSize: isMobile ? 13 : 15, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildServiceItem(IconData icon, String title) {
    return HoverScaleWidget(
      child: Container(
        width: 170,
        height: 150,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.appColorOrange, size: 38),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D1B3E),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
