import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/core/utils/functions/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isNoInternetScreen;
  EmptyStateWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      this.isNoInternetScreen = false});

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;

      showToast(
          "Uh-oh! It seems like you’re offline.\nPlease check your connection and try again",
          duration: 3,
          gravity: Toast.bottom);
      return Future.value(false);
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    return isNoInternetScreen
        ? PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              if (didPop) return;
              // Get.currentRoute != AppRoutes.homeScreen ? onWillPop() : () {};
            },
            child: Scaffold(
              backgroundColor: kColorBlackOff,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SvgPicture.asset(
                        'assets/images/empty_state/empty_screen_image.svg',
                        height: 115.h,
                        width: 200.w),
                    Padding(
                      padding: EdgeInsets.only(top: 25.h, bottom: 13.h),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 16.sp, color: kColorWhite),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: Text(
                        subTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: kColorWhite,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: kColorBlackOff,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                      'assets/images/empty_state/empty_screen_image.svg',
                      height: 115.h,
                      width: 200.w),
                  Padding(
                    padding: EdgeInsets.only(top: 25.h, bottom: 13.h),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 16.sp, color: kColorWhite),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Text(
                      subTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: kColorWhite,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
