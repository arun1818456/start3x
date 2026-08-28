import '../../../../../exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(backgroundColor: Colors.white, body: _buildBody());
      },
    );
  }

  /// Builds the body of the Splash Screen.
  Widget _buildBody() {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(AppImages.appLogo, height: 250, width: 250),
          const Spacer(),
          const LinearProgressIndicator(
            color: AppColors.blueColor,
            minHeight: 8,
          ),
        ],
      ),
    );
  }
}

class DownloadingAnimation extends StatefulWidget {
  const DownloadingAnimation({super.key});

  @override
  State<DownloadingAnimation> createState() => _DownloadingAnimationState();
}

class _DownloadingAnimationState extends State<DownloadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  /// Initializes the animation controller and tween.
  void _initializeAnimation() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0,
      end: 200,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _buildAnimatedContainer(),
        const Positioned(bottom: 20, child: CircularProgressIndicator()),
      ],
    );
  }

  /// Builds the animated container.
  Widget _buildAnimatedContainer() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Loading',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
