import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/common_widgets/customTextField.dart';
import 'package:dummy_json/core/routes/app_routes.gr.dart';
import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/core/utils/functions/show_toast.dart';
import 'package:dummy_json/core/utils/validation/validation_mixin.dart';
import 'package:dummy_json/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:dummy_json/feature/auth/presentation/bloc/auth_event.dart';
import 'package:dummy_json/feature/auth/presentation/bloc/auth_state.dart';
import 'package:dummy_json/feature/network/presentation/bloc/network_bloc.dart';
import 'package:dummy_json/feature/onboarding/presentation/widget/wide_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toast/toast.dart';

@RoutePage()
class AuthScreen extends StatelessWidget with ValidationsMixin {
  AuthScreen({super.key});

  GlobalKey<FormState> authForm = GlobalKey<FormState>();
  final phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    ToastContext().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kColorBlackOff,
      body: BlocBuilder<NetworkBloc, NetworkState>(
          builder: (context, networkState) {
        return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              height: screenHeight,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: MediaQuery.of(context).size.height *
                                        0.42,
                                    decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: kColorPrimary
                                                  .withOpacity(0.2)),
                                          left: BorderSide(
                                              color: kColorPrimary
                                                  .withOpacity(0.2))),
                                      color: kColorBlackOff,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(500.r),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 164.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xff141524),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(150.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: MediaQuery.of(context).size.height *
                                        0.42,
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: kColorPrimary
                                                  .withOpacity(0.2)),
                                          right: BorderSide(
                                              color: kColorPrimary
                                                  .withOpacity(0.2))),
                                      color: kColorBlackOff,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(500.r),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 164.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xff141524),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(150.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),

                        //page content
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //login image
                              Stack(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 24.w, right: 24.w),
                                      height: 313.h,
                                      width: MediaQuery.of(context).size.width,
                                      child: SvgPicture.asset(
                                        'assets/images/login/login_screen_image.svg',
                                        fit: BoxFit.fill,
                                      )),
                                  // Obx(() =>
                                  // !profileService.isGuest.value &&
                                  //         Platform.operatingSystem == 'ios' &&
                                  //         startUpService.response.value.data!
                                  //             .result!.loginWith!.skipLoginIos!
                                  //     ? Align(
                                  //         alignment: Alignment.bottomRight,
                                  //         child: Padding(
                                  //           padding: EdgeInsets.only(
                                  //               top: 45.h, right: 24.w),
                                  //           child: InkWell(
                                  //             onTap: () {
                                  //               Get.find<ProfileService>()
                                  //                   .isGuest
                                  //                   .value = true;
                                  //               // Get.offNamed(AppRoutes.homeScreen);
                                  //               // Get.offAllNamed(
                                  //               //     AppRoutes.homeScreen);
                                  //             },
                                  //             child: Text("Skip",
                                  //                 style:
                                  //                     TextStyle(
                                  //                         fontSize: 14.sp,
                                  //                         color: kColorSecondary,
                                  //                         decoration: TextDecoration
                                  //                             .underline,
                                  //                         decorationColor:
                                  //                             kColorSecondary)),
                                  //           ),
                                  //         ),
                                  //       )
                                  // : !profileService.isGuest.value &&
                                  //         Platform.operatingSystem ==
                                  //             'android' &&
                                  //         startUpService
                                  //             .response
                                  //             .value
                                  //             .data!
                                  //             .result!
                                  //             .loginWith!
                                  //             .skipLoginAndroid!
                                  //     ? Align(
                                  //         alignment: Alignment.bottomRight,
                                  //         child: Padding(
                                  //           padding: EdgeInsets.only(
                                  //               top: 45.h, right: 24.w),
                                  //           child: InkWell(
                                  //             onTap: () {
                                  //               if (Get.find<NetworkService>()
                                  //                       .connectionStatus ==
                                  //                   Flags
                                  //                       .kFlagConnectionStatus0) {
                                  //                 Utils().showToast(
                                  //                     "Uh-oh! It seems like you’re offline.\nPlease check your connection and try again",
                                  //                     duration: 3,
                                  //                     gravity: Toast.bottom);
                                  //               } else {
                                  //                 Get.find<ProfileService>()
                                  //                     .isGuest
                                  //                     .value = true;
                                  //                 // Get.offNamed(
                                  //                 //     AppRoutes.homeScreen);
                                  //                 Get.offAllNamed(
                                  //                     AppRoutes.homeScreen);
                                  //               }
                                  //             },
                                  //             child: Text("Skip",
                                  //                 style: kTextStylePoppins400
                                  //                     .copyWith(
                                  //                         fontSize: 14.sp,
                                  //                         color:
                                  //                             kColorSecondary,
                                  //                         decoration:
                                  //                             TextDecoration
                                  //                                 .underline,
                                  //                         decorationColor:
                                  //                             kColorSecondary)),
                                  //           ),
                                  //         ),
                                  //       )
                                  //     : SizedBox.shrink(),
                                  // ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 40.h, bottom: 20.h, left: 24.w),
                                child: Text("Welcome to Democracy!",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kColorWhite.withOpacity(0.75))),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 24.w),
                                child: Text("Get Started",
                                    style: TextStyle(
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kColorWhite)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10.h, left: 24.w, bottom: 48.h),
                                child: Text(
                                    "Enter your number and we will send an\nOTP. That is it!",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kColorWhite.withOpacity(0.75))),
                              ),

                              //phone number textfield
                              Form(
                                key: authForm,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 24.w, left: 24.w),
                                  child: CustomTextfieldWidget(
                                    controller: phoneNumber,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    validator: validatedPhoneNumber,
                                    hintText: 'Enter your mobile number',
                                    hintStyle: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            kColorWhite.withOpacity(0.7500000)),
                                    errorStyle: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kColorWhite),
                                    prefixIconConstraints: BoxConstraints(),
                                    textInputType: TextInputType.phone,
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: 16.w, right: 10.w),
                                      child: SvgPicture.asset(
                                          'assets/icons/drawer_ic/contact_ic.svg',
                                          height: 24.h,
                                          width: 24.h,
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        //floating
                        Positioned(
                          // bottom: 48.h,
                          bottom: 60.h,
                          left: 0,
                          right: 0,
                          child: Padding(
                              padding: EdgeInsets.only(
                                left: 24.w,
                                right: 24.w,
                              ),
                              child: GestureDetector(
                                onTap: () async {
                                  debugPrint('clicked...');
                                  if (networkState is NetworkFailure) {
                                    print('Network failure');
                                    showToast(
                                        "Uh-oh! It seems like you’re offline.\nPlease check your connection and try again",
                                        duration: 3,
                                        gravity: Toast.bottom);
                                  } else if (networkState is NetworkSuccess) {
                                    if (authForm.currentState!.validate()) {
                                      context
                                          .read<AuthBloc>()
                                          .add(AuthUserEvent(phoneNumber.text));
                                      if (state is AuthSuccess) {
                                        print('otp send successfully');
                                        if (state.success == 1) {
                                          context.router.push(OtpScreenRoute(
                                              phoneNumber: phoneNumber.text));
                                        }
                                      }
                                    }
                                  }

                                  // if (Get.find<NetworkService>().connectionStatus ==
                                  //     0) {
                                  //   Utils().showToast(
                                  //       "Uh-oh! It seems like you’re offline.\nPlease check your connection and try again",
                                  //       duration: 3,
                                  //       gravity: Toast.bottom);
                                  // }
                                  // {
                                  //   loginScreenController.goToOtpScreen(
                                  //       loginScreenController.phoneNumber.text,
                                  //       context);
                                  // }
                                },
                                child: SizedBox(
                                    height: 54.h,
                                    child: const WideButtonWidget(
                                        buttonTitle: 'Send OTP')),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      }),
    );
  }
}
