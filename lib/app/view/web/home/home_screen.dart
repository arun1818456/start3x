import '../../../../exports.dart';

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeScreenController(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Header for Desktop
               _buildHeader(context, controller),
                Divider(
                  color: AppColors.greyDarkColor,
                  height: 0,
                  thickness: 0.2,
                ),

              if (controller.selectedTab == "Home") ...[
                _buildHeroSection(context, controller),
                _buildCardSection(context),
                _buildPricingSection(context),
                _buildPartnerSection(context),
              ] else ...[
                _buildDashBoard(context),
              ],
              // Footer
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, HomeScreenController controller) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context), 
        vertical: 10
      ),
      child: Row(
        children: [
          const LogoTextWidget(),
          const Spacer(),
          textButton(controller, text: "Home"),
          const SizedBox(width: 25),
          textButton(controller, text: "Dashboard"),
          const Spacer(),
          HoverScaleWidget(
            child: CustomButton(
              text: "coming-soon",
              onPressed: () {},
              width: 120,
              buttonHeight: 35,
              radius: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, HomeScreenController controller) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    double horizontalPadding = ResponsiveHelper.getHorizontalPadding(context);

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: isMobile ? 40 : 80),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!isMobile) const SizedBox(width: 50),
          Expanded(
            flex: isMobile ? 0 : 3,
            child: TweenAnimationBuilder(
              duration: const Duration(seconds: 1),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 50 * (1 - value)),
                    child: child,
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stop Chasing Leads.',
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    style: TextStyle(
                      fontSize: isMobile ? 40 : 65,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: AppFonts.inter,
                    ),
                  ),
                  Text(
                    'Start Closing Deals.',
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    style: TextStyle(
                      fontSize: isMobile ? 40 : 65,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFF6B35),
                      fontFamily: AppFonts.inter,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'More than revenue growth—we help you build \na productive, organized business that delivers \nconsistent results with complete clarity.',
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    style: TextStyle(
                      fontSize: isMobile ? 18 : 24,
                      color: const Color(0xFF666666),
                      height: 1.6,
                      fontFamily: AppFonts.inter,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: isMobile ? null : Align(
                      alignment: Alignment.centerLeft,
                      child: _buildWatchVideoButton(),
                    ),
                  ),
                  if (isMobile) _buildWatchVideoButton(),
                  if (isMobile) const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          if (!isMobile) const SizedBox(width: 50),
          if (!isMobile)
            Expanded(
              flex: 2,
              child: callBackForm(context),
            ),
          if (isMobile) callBackForm(context),
        ],
      ),
    );
  }

  Widget _buildWatchVideoButton() {
    return HoverScaleWidget(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 45,
          width: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.appColorOrange,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.appColorOrange.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.play_circle_outline, color: Colors.white, size: 24),
              SizedBox(width: 10),
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
    );
  }

  Widget _buildCardSection(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    double horizontalPadding = ResponsiveHelper.getHorizontalPadding(context);

    return Container(
      width: double.infinity,
      color: AppColors.greyDarkColor,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 80),
      child: Column(
        children: [
          const Text(
            'What You Can Expect',
            style: TextStyle(
              color: AppColors.appColorOrange,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.inter,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'The results and commitments we deliver\nafter you get started.',
            style: TextStyle(fontSize: isMobile ? 22 : 32, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          if (isMobile)
            Column(
              children: [
                _buildFeatureCard(
                  icon: AppImages.calendar,
                  description: 'We deliver high-quality, confirmed appointments with details, including visit date and time.',
                ),
                const SizedBox(height: 24),
                _buildFeatureCard(
                  icon: AppImages.quality,
                  description: 'We notify you about every appointment, provide call recording, and arrange replacements if canceled.',
                ),
                const SizedBox(height: 24),
                _buildFeatureCard(
                  icon: AppImages.finger,
                  description: 'By giving you qualified appointments, we save your effort, making your work easy and organized.',
                ),
              ],
            )
          else
            Row(
              children: [
                _buildFeatureCard(
                  icon: AppImages.calendar,
                  description: 'We deliver high-quality, confirmed appointments with details, including visit date and time.',
                ),
                const SizedBox(width: 32),
                _buildFeatureCard(
                  icon: AppImages.quality,
                  description: 'We notify you about every appointment, provide call recording, and arrange replacements if canceled.',
                ),
                const SizedBox(width: 32),
                _buildFeatureCard(
                  icon: AppImages.finger,
                  description: 'By giving you qualified appointments, we save your effort, making your work easy and organized.',
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({required String icon, required String description}) {
    return Expanded(
      flex: 1,
      child: HoverScaleWidget(
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: Column(
            children: [
              Image.asset(icon, width: 50, height: 50, color: Colors.white),
              const SizedBox(height: 24),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
              ),
            ],
          ),
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
            Row(
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
          const SizedBox(height: 40),
          _buildInfoBox(context),
          const SizedBox(height: 80),
          _buildWhatWeDoSection(context),
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
            color: isPopular ? color : Colors.grey.shade200,
            width: isPopular ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isPopular ? color.withValues(alpha: 0.15) : Colors.black.withValues(alpha: 0.05),
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

  Widget _buildWhatWeDoSection(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'WHAT WE DO FOR YOU',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 18 : 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0D1B3E),
                  letterSpacing: 1.5,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 60),
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

  Widget _buildServiceItem(IconData icon, String title) {
    return HoverScaleWidget(
      child: Container(
        width: 180,
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
            Icon(icon, color: const Color(0xFF0052CC), size: 36),
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

  Widget _buildPartnerSection(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    double horizontalPadding = ResponsiveHelper.getHorizontalPadding(context);

    return Container(
      width: double.infinity,
      color: AppColors.greyDarkColor,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 80),
      child: Column(
        children: [
          const Text(
            'Become a Partner',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.appColorOrange,
              fontFamily: AppFonts.inter,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Become a partner and bring people who need our services.\n"
            "Earn 10% profit sharing on every closed deal and receive \n"
            "monthly payouts as long as the client stays active with us.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: isMobile ? 18 : 24, color: Colors.white, height: 1.6),
          ),
          const SizedBox(height: 48),
          HoverScaleWidget(
            child: CustomButton(
              text: "Become Partner",
              onPressed: () {},
              width: isMobile ? double.infinity : 250,
              buttonHeight: 50,
              radius: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget textButton(HomeScreenController controller, {required String text}) {
    bool isActive = controller.selectedTab == text;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            controller.selectedTab = text;
            controller.update();
          },
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? AppColors.appColorOrange : AppColors.greyDarkColor,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              fontFamily: AppFonts.inter,
              fontSize: 16,
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: isActive ? 40 : 0,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.appColorOrange,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

  Widget callBackForm(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    return Container(
      width: isMobile ? double.infinity : 400,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Set a Callback",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: AppColors.grey2Color,
              fontFamily: AppFonts.inter,
            ),
          ),
          const SizedBox(height: 50),
          const MyTextFieldForm(hintText: "Legal Business Name (Required)"),
          const SizedBox(height: 22),
          const MyTextFieldForm(hintText: "Your Name"),
          const SizedBox(height: 22),
          MyTextFieldForm(
            hintText: "+91 ",
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(AppImages.flag,  width: 5,
                height: 5,
                alignment: AlignmentGeometry.center,),

            ),
          ),
          const SizedBox(height: 45),
          HoverScaleWidget(
            child: CustomButton(
              text: "Book Your Free Call",
              onPressed: () {},
              width: Get.width * 0.11,
              buttonHeight: 30,
              radius: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashBoard(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    double horizontalPadding = ResponsiveHelper.getHorizontalPadding(context);

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 80),
      child: Column(
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.appColorOrange,
              fontFamily: AppFonts.inter,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Features that help you manage data with \nclarity and confidence.',
            style: TextStyle(fontSize: isMobile ? 20 : 32, fontWeight: FontWeight.bold, color: AppColors.greyDarkColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              _buildDashCard(
                context,
                onTap: () => Get.toNamed(AppRoutes.profileScreen),
                icon: AppImages.resume,
                description: 'Personal Information',
              ),
              _buildDashCard(
                context,
                onTap: () => Get.toNamed(AppRoutes.invoice),
                icon: AppImages.contract,
                description: 'Create Invoices & Contracts',
              ),
              _buildDashCard(
                context,
                onTap: () {},
                icon: AppImages.solutions,
                description: 'Manage Prospects & Appointments',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDashCard(
    BuildContext context, {
    required GestureTapCallback onTap,
    required String icon,
    required String description,
  }) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    double size = isMobile ? Get.width * 0.8 : 280;

    return HoverScaleWidget(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, width: 80, height: 80),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.appColorOrange,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
