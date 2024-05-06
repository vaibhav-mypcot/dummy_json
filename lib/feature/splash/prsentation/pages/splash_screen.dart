import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/routes/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (3)),
      vsync: this,
    );
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // Get.find<SplashScreenController>();
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Lottie.asset(
          'assets/splash/democracy_splash.json',
          fit: BoxFit.fill,
          controller: _controller,
          animate: true,
          onLoaded: (composition) {
            //apiCall();
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() async {
                AutoRouter.of(context).push(OnBoardingScreenRoute());
              });
          },
        ),
      ),
    );
  }
}
