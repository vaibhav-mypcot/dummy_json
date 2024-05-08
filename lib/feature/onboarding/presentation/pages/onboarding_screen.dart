import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/common_widgets/no_internet_screen.dart';
import 'package:dummy_json/core/routes/app_routes.gr.dart';
import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/feature/network/presentation/bloc/network_bloc.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:dummy_json/feature/onboarding/presentation/model/onboarding_data_model.dart';
import 'package:dummy_json/feature/onboarding/presentation/widget/wide_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // OnBoardingBloc onBoardingBloc = OnBoardingBloc();

  int updatedIndex = 0;
  final controller = PageController(keepPage: true, viewportFraction: 1.0);

  @override
  void initState() {
    super.initState();
    // context.read<OnBoardingBloc>().add(FetchStartUpApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(builder: (context, state) {
      if (state is NetworkFailure) {
        return const NoInternetScreen();
      } else if (state is NetworkSuccess) {
        context.read<OnBoardingBloc>().add(FetchStartUpApiEvent(true));
      }
      return BlocBuilder<OnBoardingBloc, OnBoardingState>(
          builder: (context, state) {
        if (state is UpdatedIndexState) {
          updatedIndex = state.index;
          controller.jumpToPage(updatedIndex);
        }
        // int onBoardingBloc = OnBoardingBloc(onBoardingRepository: OnBoardingRepository(startupServices)).currentIndex;
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: kColorBlackOff,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: updatedIndex == 0
                ? Padding(
                    padding:
                        EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
                    child: GestureDetector(
                      onTap: () {
                        updatedIndex++;
                        controller.jumpToPage(updatedIndex);
                        print(updatedIndex);
                        context
                            .read<OnBoardingBloc>()
                            .add(UpdateIndexEvent(updatedIndex));
                      },
                      child: Container(
                        // color: Colors.pink,
                        height: 54.h,
                        child: const WideButtonWidget(buttonTitle: 'Next'),
                      ),
                    ),
                  )
                : Padding(
                    padding:
                        EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
                    child: Container(
                      // color: Colors.amber,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.read<OnBoardingBloc>().add(
                                    PreviousButtonClickedEvent(updatedIndex));
                              },
                              child: Container(
                                height: 54.h,
                                // margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(color: kColorPrimary),
                                  color: kColorBlackOff,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text(
                                    "Previous",
                                    style: TextStyle(
                                        color: kColorPrimary, fontSize: 16.sp),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<OnBoardingBloc>()
                                    .add(NextButtonClickedEvent(updatedIndex));

                                if (updatedIndex == 3) {
                                  context.router.pushAndPopUntil(
                                      AuthScreenRoute(),
                                      predicate: (route) => false);
                                }
                              },
                              child: Container(
                                height: 54.h,
                                // margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xff3d2690),
                                        spreadRadius: -0.7.h,
                                        offset: Offset(0, 5)),
                                    // BoxShadow(
                                    //     color: Color(0xff3d2690),
                                    //     spreadRadius: -0.7.h,
                                    //     offset: Offset(0, 5)),
                                  ],
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: kColorPrimary,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text(
                                    updatedIndex == 3 ? "Get Started" : "Next",
                                    style: TextStyle(
                                        color: kColorFontWhite,
                                        fontSize: 16.sp),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
            body: Stack(
              children: [
                //background half circle
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.84,
                    width: MediaQuery.of(context).size.width * 0.88,
                    decoration: BoxDecoration(
                      color: kColorBlackOff,
                      border: Border(
                          top:
                              BorderSide(color: kColorPrimary.withOpacity(0.2)),
                          bottom:
                              BorderSide(color: kColorPrimary.withOpacity(0.2)),
                          left: BorderSide(
                              color: kColorPrimary.withOpacity(0.2))),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(1000.r),
                        topLeft: Radius.circular(1000.r),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.42,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: kColorPrimary.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(1000.r),
                            topLeft: Radius.circular(1000.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //page content
                Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 56.h),
                      //skip text
                      GestureDetector(
                        onTap: () {
                          context.router.pushAndPopUntil(HomePageRoute(),
                              predicate: (route) => false);
                        },
                        child: Text("Skip",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: kColorSecondary,
                                decoration: TextDecoration.underline,
                                decorationColor: kColorSecondary)),
                      ),

                      //onboarding list
                      Expanded(
                        child: PageView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            controller: controller,
                            itemCount: 4,
                            onPageChanged: (value) {
                              updatedIndex = value;
                            },
                            itemBuilder: (ctx, index) {
                              return onboardingComponent(
                                onboardingList[index].assets,
                                onboardingList[index].title1,
                                onboardingList[index].title2,
                                onboardingList[index].subtitle,
                                context,
                                updatedIndex,
                              );
                            }),
                      ),

                      //for indicator
                      Padding(
                        padding: EdgeInsets.only(bottom: 180.h),
                        child: SmoothPageIndicator(
                            controller: controller,
                            effect: ExpandingDotsEffect(
                                expansionFactor: 2.5,
                                dotHeight: 8.h,
                                dotWidth: 8.h,
                                activeDotColor: kColorWhite,
                                dotColor: kColorWhite.withOpacity(0.5)),
                            count: 4),
                      )
                    ],
                  ),
                ),
              ],
            ));
      });
    });
  }

  //for scrollable onboarding list
  Widget onboardingComponent(image, title1, title2, subtitle, context, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Center(
              child: SvgPicture.asset(image,
                  height: 220.h,
                  width:
                      index == 2 ? MediaQuery.of(context).size.width : 220.h)),
        ),
        Padding(
            padding: EdgeInsets.only(top: 75.h),
            child: Text(title1,
                style: TextStyle(
                    height: 1.1, fontSize: 32.sp, color: Color(0xffCACEF2)))),
        Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Text(title2,
                style: TextStyle(
                    height: 1.1, fontSize: 32.sp, color: Color(0xffDEDFF0)))),
        Text(subtitle,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: kColorFontWhite.withOpacity(0.75))),
      ],
    );
  }
}
