import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/routes/app_routes.gr.dart';
import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/core/utils/functions/show_toast.dart';
import 'package:dummy_json/feature/network/presentation/bloc/network_bloc.dart';
import 'package:dummy_json/feature/onboarding/presentation/widget/wide_button_widget.dart';
import 'package:dummy_json/feature/otp/presentation/bloc/otp_bloc.dart';
import 'package:dummy_json/feature/otp/presentation/bloc/otp_event.dart';
import 'package:dummy_json/feature/otp/presentation/bloc/otp_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:toast/toast.dart';

@RoutePage()
class OtpScreen extends StatefulWidget {
  OtpScreen({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer timer;

  int start = 60;

  final otpController = TextEditingController();

  bool isValidateOtp = true;

  String errorMessage = '';

  // void goToHomeScreen(String phoneNumber, String otp, dynamic context) async {
  //   debugPrint('checking on tap');
  //   if (otpController.text.length == 6) {
  //     isValidateOtp = true;
  //     context.read<OtpBloc>().add(VerifyOtpEvent(phoneNumber, otp));
  //   } else {
  //     errorMessage = 'Please enter valid OTP';
  //     isValidateOtp = false;
  //   }
  // }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
        }
      },
    );
  }

  void onClickedResend(phoneNumber, context) async {
    start = 60;
    // await resendOtp(phoneNumber);
    startTimer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    ToastContext().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kColorBlackOff,
      body: BlocBuilder<NetworkBloc, NetworkState>(
        builder: (networkContext, networkState) {
          return BlocBuilder<OtpBloc, OtpState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: screenHeight,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            //background bottom quarter container
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.42,
                                        decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  color: kColorPrimary
                                                      .withOpacity(0.2)),
                                              right: BorderSide(
                                                  color: kColorPrimary
                                                      .withOpacity(0.2))),
                                          color: kColorBlackOff,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(500.r),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height: 164.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xff141524),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(150.r),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),

                            //background top quarter container
                            Align(
                                alignment: Alignment.topRight,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.42,
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: kColorPrimary
                                                      .withOpacity(0.2)),
                                              left: BorderSide(
                                                  color: kColorPrimary
                                                      .withOpacity(0.2))),
                                          color: kColorBlackOff,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(500.r),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height: 164.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xff141524),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(150.r),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 55.h, left: 18.w),
                                    child: InkWell(
                                      onTap: () => context.router.back(),
                                      child: Container(
                                        // color: Colors.amber,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7.h, horizontal: 5),
                                        child: SvgPicture.asset(
                                          'assets/icons/general/back.svg',
                                          height: 12.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                //otp screen image
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 60.w, right: 60.w, top: 59.h),
                                    // color: Colors.red,
                                    height: 140.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: SvgPicture.asset(
                                        'assets/images/login/otp_screen_image.svg',
                                        fit: BoxFit.fill)),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 49.h, bottom: 24.h, left: 24.w),
                                  child: Text("Welcome to Democracy!",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              kColorWhite.withOpacity(0.75))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: Text("OTP",
                                      style: TextStyle(
                                          fontSize: 32.sp,
                                          fontWeight: FontWeight.w400,
                                          color: kColorWhite)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.h, left: 24.w, bottom: 48.h),
                                  child: Text(
                                      "Enter the OTP sent to your registered\nnumber",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              kColorWhite.withOpacity(0.75))),
                                ),

                                //OTP field
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 24.w, right: 24.w),
                                  child: Center(
                                    child: Pinput(
                                      enabled: true,
                                      autofocus: true,
                                      controller: otpController,
                                      defaultPinTheme: PinTheme(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              border: Border.all(
                                                  color: kColorWhite
                                                      .withOpacity(0.15)),
                                              color: const Color(0xff1d1f27)),
                                          height: 46.h,
                                          width: 46.h,
                                          // margin: EdgeInsets.only(right: 4.w,left: 4.w),
                                          textStyle: TextStyle(
                                              fontSize: 18.sp,
                                              color: kColorWhite
                                                  .withOpacity(0.75))),
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      length: 6,
                                      keyboardType: TextInputType.number,
                                      focusedPinTheme: PinTheme(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              border: Border.all(
                                                  color: kColorPrimary),
                                              color: const Color(0xff1d1f27)),
                                          height: 46.h,
                                          width: 46.h,
                                          // margin: EdgeInsets.only(right: 4.w,left: 4.w),
                                          textStyle: TextStyle(
                                              fontSize: 16.sp,
                                              color: kColorWhite
                                                  .withOpacity(0.75))),
                                    ),
                                  ),
                                ),

                                isValidateOtp
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            left: 24.w, top: 10.h),
                                        child: Text(errorMessage,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: kColorSecondary)),
                                      )
                                    : const SizedBox(),

                                //timer
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 10.h, right: 24.w),
                                      child: Text(
                                          start < 10
                                              ? '0${start} sec'
                                              : '${start} sec',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kColorWhite
                                                  .withOpacity(0.75))),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            //floating button
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0.h,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 24.w,
                                    right: 24.w,
                                    bottom: start == 0 ? 30.h : 60.h
                                    // bottom: 20.h
                                    ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (networkState is NetworkFailure) {
                                          showToast(
                                              "Uh-oh! It seems like you’re offline.\nPlease check your connection and try again",
                                              duration: 3,
                                              gravity: Toast.bottom);
                                        } else if (networkState
                                            is NetworkSuccess) {
                                          if (otpController.text.length == 6) {
                                            isValidateOtp = true;
                                            context.read<OtpBloc>().add(
                                                VerifyOtpEvent(
                                                    widget.phoneNumber,
                                                    otpController.text));
                                            if (state is VerifySuccessState) {
                                              if (state.success == 1) {
                                                context.router.pushAndPopUntil(
                                                    HomeScreenRoute(),
                                                    predicate: (route) =>
                                                        false);
                                              }
                                            }
                                          } else {
                                            errorMessage =
                                                'Please enter valid OTP';
                                            isValidateOtp = false;
                                          }
                                        }
                                      },
                                      child: SizedBox(
                                        height: 54.h,
                                        child: const WideButtonWidget(
                                            buttonTitle: 'Verify'),
                                      ),
                                    ),
                                    start == 0
                                        ? Padding(
                                            padding: EdgeInsets.only(top: 24.h),
                                            child: RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  text: 'Didn’t receive OTP? ',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: kColorWhite
                                                        .withOpacity(0.75),
                                                  )),
                                              TextSpan(
                                                  text: 'Resend',
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          // if (Get.find<NetworkService>()
                                                          //         .connectionStatus ==
                                                          //     Flags
                                                          //         .kFlagConnectionStatus0) {
                                                          //   Utils().showToast(
                                                          //       "Uh-oh! It seems like you’re offline.\nPlease check your connection and try again",
                                                          //       duration: 3,
                                                          //       gravity: Toast.bottom);
                                                          // } else {
                                                          //   otpScreenController
                                                          //       .onClickedResend(
                                                          //           loginScreenController
                                                          //               .loginData
                                                          //               .value
                                                          //               .data!
                                                          //               .result!
                                                          //               .phone,
                                                          //           context);
                                                          // }
                                                        },
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: kColorWhite,
                                                  )),
                                            ])),
                                          )
                                        : SizedBox()
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
