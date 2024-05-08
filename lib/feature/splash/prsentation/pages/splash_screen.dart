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

  String accessToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9za3lvbmxpbmVycy5jb21cL2RlbW9cL2RlbW9jcmFjeS1hcGlzXC93ZWJzZXJ2aWNlc1wvdjFcL3ZhbGlkYXRlX290cCIsImlhdCI6MTcwNjg1ODUxMSwiZXhwIjoxNzIyNTgzMzExLCJuYmYiOjE3MDY4NTg1MTEsImp0aSI6IlE4bE5xNkN4Z1pjc0diNngiLCJzdWIiOjczLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.-QTKvI5yuhwkYYbe0RQ-LsK2_j8RBNUPAJYAeUD5W2g';

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
                if (accessToken != null) {
                  // log("GOING HOME");
                  context.router.pushAndPopUntil(HomePageRoute(),
                      predicate: (route) => false);
                } else {
                  // log("GOING ONBOARDING");
                  AutoRouter.of(context).push(const OnBoardingScreenRoute());
                }
              });
          },
        ),
      ),
    );
  }
}
