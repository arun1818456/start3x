import '../../exports.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    double horizontalPadding = ResponsiveHelper.getHorizontalPadding(context);

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: Colors.grey[200], thickness: 1, height: 40),
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCompanyInfo(),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 40,
                  runSpacing: 30,
                  children: [
                    _buildFooterColumn('Product', ['Home', 'About', 'Pricing', 'Plans']),
                    _buildFooterColumn('Company', ['About', 'Contact', 'Blog', 'Careers']),
                    _buildFooterColumn('Legal', ['Privacy Policy', 'Terms & Conditions', 'Cookie Policy']),
                  ],
                ),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _buildCompanyInfo()),
                const Spacer(),
                _buildFooterColumn('Product', ['Home', 'About', 'Pricing', 'Plans']),
                const SizedBox(width: 60),
                _buildFooterColumn('Company', ['About', 'Contact', 'Blog', 'Careers']),
                const SizedBox(width: 60),
                _buildFooterColumn('Legal', ['Privacy Policy', 'Terms & Conditions', 'Cookie Policy']),
              ],
            ),
          const SizedBox(height: 60),
          Divider(color: Colors.grey[200]),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '© 2026 Start3x. All rights reserved.',
                style: TextStyle(fontSize: 14, color: AppColors.grey2Color),
              ),
              if (!isMobile)
                const Row(
                  children: [
                    Icon(Icons.facebook, size: 20, color: AppColors.grey2Color),
                    SizedBox(width: 20),
                    Icon(Icons.camera_alt_outlined, size: 20, color: AppColors.grey2Color),
                    SizedBox(width: 20),
                    Icon(Icons.link, size: 20, color: AppColors.grey2Color),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LogoTextWidget(),
        const SizedBox(height: 20),
        const Text(
          'Reduce your effort, get direct client visits,\n'
          'and work smoothly with full clarity and zero\n'
          'stress.',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF666666),
            height: 1.6,
            fontFamily: AppFonts.inter,
          ),
        ),
      ],
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
            fontFamily: AppFonts.inter,
          ),
        ),
        const SizedBox(height: 20),
        ...items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {},
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                  fontFamily: AppFonts.inter,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
