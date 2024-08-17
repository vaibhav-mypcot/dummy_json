import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/common_widgets/drawer_widgets/devider.dart';
import 'package:dummy_json/core/common_widgets/drawer_widgets/drawer_list_tiles.dart';
import 'package:dummy_json/core/common_widgets/empty_state_widget.dart';
import 'package:dummy_json/core/routes/app_routes.gr.dart';
import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/core/utils/constants/const.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_bloc.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_event.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_state.dart';
import 'package:dummy_json/feature/terms_policy/presentation/bloc/policy_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class DrawerMenuScreen extends StatefulWidget {
  const DrawerMenuScreen({super.key});

  @override
  State<DrawerMenuScreen> createState() => _DrawerMenuScreenState();
}

class _DrawerMenuScreenState extends State<DrawerMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          ProfileHeader(),
          ProfileListTile(),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchProfileDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final homeController = Get.find<HomeScreenController>();
    // final profileController = Get.find<ProfileService>();
    return MultiBlocListener(
      listeners: [
        BlocListener<PolicyBloc, PolicyState>(listener: (context, state) {
          if (state is PolicyLoadedState) {}
        })
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadedState) {
            if (state.success == 4) {
              return Center(
                child: EmptyStateWidget(
                    isNoInternetScreen: true,
                    title: 'Api is not working',
                    subTitle:
                        'Uh-oh! It seems like you’re offline. \nPlease check your connection and try again'),
              );
            } else {
              return Column(
                children: [
                  SizedBox(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.32,
                          width: screenWidth,
                          child: SvgPicture.asset(
                            Const().drawerBackgroundImg,
                            fit: BoxFit.fill,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.router.back();
                            // Get.back();
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: 60.h, right: 25.w),
                                child: Icon(
                                  Icons.close,
                                  size: 25.h,
                                  color: kColorWhite,
                                )),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 30.h, left: 24.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 16.w),
                                  child: CircleAvatar(
                                    radius: 50.r,
                                    backgroundColor: kColorWhite,
                                    child: CircleAvatar(
                                      radius: 48.r,
                                      backgroundColor: const Color(0xff181C28),
                                      backgroundImage: state.result != null
                                          ? FadeInImage.assetNetwork(
                                              // image: state.result!.userImage!,
                                              image:
                                                  'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg',
                                              placeholder: Const()
                                                  .userProfilePicPlaceholder,
                                              placeholderFit: BoxFit.cover,
                                              width: 52.h,
                                              height: 52.h,
                                              fit: BoxFit.cover,
                                              imageErrorBuilder: (context,
                                                  object, stackTrace) {
                                                return Image.asset(
                                                  Const()
                                                      .userProfilePicPlaceholder,
                                                  fit: BoxFit.cover,
                                                  height: 52.h,
                                                  width: 52.h,
                                                );
                                              },
                                            ).image
                                          : Image.asset(
                                              Const().userProfilePicPlaceholder,
                                              height: 52.h,
                                              width: 52.h,
                                              fit: BoxFit.cover,
                                            ).image,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    state.result != null
                                        ? SizedBox(
                                            width: screenWidth - 160.w,
                                            child: Text(
                                              '${state.result!.name}',
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: kColorFontWhite,
                                                  fontSize: 24.sp),
                                            ),
                                          )
                                        : SizedBox(
                                            width: screenWidth - 160.w,
                                            child: Text(
                                              'Hi, Guest',
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: kColorFontWhite,
                                                  fontSize: 24.sp),
                                            ),
                                          ),
                                    SizedBox(height: 8.h),
                                    state.result != null
                                        ? Text(
                                            '+91 ${state.result!.phone!}',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: kColorWhite,
                                            ),
                                          )
                                        : Text(
                                            '',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: kColorWhite,
                                            ),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class ProfileListTile extends StatefulWidget {
  const ProfileListTile({super.key});

  @override
  State<ProfileListTile> createState() => _ProfileListTileState();
}

class _ProfileListTileState extends State<ProfileListTile> {
  @override
  Widget build(BuildContext context) {
    // final profileController = Get.find<StartupService>();
    // final drawerMenuController = Get.find<DrawerMenuController>();
    bool login = false;
    bool logout = false;
    return MultiBlocListener(
      listeners: [
        BlocListener<PolicyBloc, PolicyState>(listener: (context, state) {
        // if (state is PolicyLoadedState) {
        //     context.router.push(const PolicyPageRoute());
        //   }
        })
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        if (state is ProfileLoadedState) {
          login = state.data.result!.screens!.action!.login!;
          logout = state.data.result!.screens!.action!.logout!;
          print('login: ${state.data.result!.screens!.action!.login!}');
          print('logout: ${state.data.result!.screens!.action!.logout!}');
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            scrollDirection: Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Personal
                      // profileController.response.value.data!.result!.screens!
                      //             .personal!.enrolledContests! ||
                      //         profileController.response.value.data!.result!
                      //             .screens!.personal!.profile!
                      //     ?
                      Text(
                        "Personal",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: kSubTextColor,
                        ),
                      ),
                      // : SizedBox.shrink(),
                      // profileController.response.value.data!.result!.screens!
                      //         .personal!.profile!
                      //     ?
                      DrawerListTiles(
                        ic: Const().profileIc,
                        tags: "Profile",
                        color: kColorWhite,
                        onTap: () {
                          // Get.back();
                          // Get.toNamed(AppRoutes.profileScreen);
                          context.router.push(SubProfileScreenRoute());
                        },
                      ),
                      // : SizedBox.shrink(),
                      const DeviderLine(colorLine: kDividerColor),
                      // profileController.response.value.data!.result!.screens!
                      //         .personal!.enrolledContests!
                      //     ?
                      DrawerListTiles(
                          ic: Const().enrolledContestsIc,
                          tags: "Enrolled Contests",
                          color: kColorWhite,
                          onTap: () {
                            // if (Get.find<NetworkService>().connectionStatus ==
                            //     0) {
                            //   Utils().showToast(
                            //       "Uh-oh! It seems like you’re offline.\nPlease check your connection and try again",
                            //       duration: 3,
                            //       gravity: Toast.bottom);
                            // } else {
                            //   Get.back();
                            //   Get.toNamed(AppRoutes.enrolledContestScreen);
                            // }
                          }),
                      // : SizedBox.shrink(),
                      SizedBox(height: 24.h),
                    ],
                  ),
                  //Other
                  Text(
                    "Other",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: kSubTextColor,
                    ),
                  ),
                  DrawerListTiles(
                    ic: Const().aboutUsIc,
                    tags: "About us",
                    color: kColorWhite,
                    onTap: () async {
                      // Get.back();
                      // var controller = Get.put(AboutUsScreenController());
                      // Utils().showLoading(context);
                      // await controller.fetchAboutUs();
                      // Get.back();
                      // Get.toNamed(AppRoutes.aboutUsScreen);
                    },
                  ),
                  const DeviderLine(colorLine: kDividerColor),
                  DrawerListTiles(
                    ic: Const().contactUsIc,
                    tags: "Contact us",
                    color: kColorWhite,
                    onTap: () {
                      // Get.back();
                      // Get.toNamed(AppRoutes.contactUsScreen);
                    },
                  ),
                  const DeviderLine(colorLine: kDividerColor),

                  // profileController.response.value.data!.result!.screens!.other!
                  //         .notificationSetting!
                  //     ?
                  DrawerListTiles(
                    ic: Const().notificationSettingsIc,
                    onTap: () => {
                      // Get.toNamed(AppRoutes.notificationSettingScreen)
                    },
                    tags: "Notification Settings",
                    color: kColorWhite,
                  ),
                  // : SizedBox.shrink(),

                  const DeviderLine(colorLine: kDividerColor),

                  DrawerListTiles(
                    ic: Const().shareTheAppIc,
                    tags: "Share the app",
                    color: kColorWhite,
                    onTap: () {
                      // Share.share(
                      //     'Check out the Democracy App ${Get.find<StartupService>().response.value.data!.result!.redirectionUrl!}');
                    },
                  ),
                  const DeviderLine(colorLine: kDividerColor),
                  DrawerListTiles(
                    ic: Const().faqIc,
                    tags: "FAQ’s",
                    color: kColorWhite,
                    onTap: () {
                      // Get.back();
                      // Get.toNamed(AppRoutes.faqScreen);
                    },
                  ),
                  const DeviderLine(colorLine: kDividerColor),
                  DrawerListTiles(
                      ic: Const().privacyPolicyIc,
                      tags: "Terms & Policies",
                      color: kColorWhite,
                      onTap: () {
                        // Get.back();
                        // Get.toNamed(AppRoutes.termsAndPoliciesScreen);
                                    context.router.push(const PolicyPageRoute());

                      }),
                  SizedBox(height: 24.h),
                  //Action
                  Text(
                    "Action",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: kSubTextColor,
                    ),
                  ),
                  logout
                      ? DrawerListTiles(
                          ic: Const().logoutIc,
                          tags: "Logout",
                          color: kColorWhite,
                          onTap: () {
                            // Utils().showBottomSheetPopup(
                            //   context: context,
                            //   ic: Const().logoutIc,
                            //   title: "Logout?",
                            //   description:
                            //       "Are you sure you want to logout of the app? ",
                            //   leftButtonName: "No, go back",
                            //   rightButtonName: "Logout",
                            //   leftBtnBackgroundColor: Colors.transparent,
                            //   rightBtnBackgroundColor: kColorPrimary,
                            //   leftBorderColor: kColorPrimary,
                            //   rightBorderColor: Colors.transparent,
                            //   leftTextColor: kColorPrimary,
                            //   rightTextColor: kColorWhite,
                            //   leftBoxShadowColor: Colors.transparent,
                            //   rightBoxShadowColor: Color(0xff3D2690),
                            //   leftButtonHeight: 53.h,
                            //   rightButtonHeight: 50.h,
                            //   saveActionButtonPressed: () async {
                            //     if (Get.find<NetworkService>().connectionStatus ==
                            //         0) {
                            //       Utils().showToast(
                            //           "Uh-oh! It seems like you’re offline.\nPlease check your connection and try again",
                            //           duration: 3,
                            //           gravity: Toast.bottom);
                            //     } else {
                            //       Get.back();
                            //       await drawerMenuController.logoutAsap(
                            //           context: context);
                            //       Get.offAllNamed(AppRoutes.loginScreen);
                            //     }
                            //   },
                            //   cancelButtonPressed: () {
                            //     // Get.back();
                            //   },
                            // );
                          },
                        )
                      : const SizedBox.shrink(),
                  // Version Details
                  SizedBox(height: 88.h),
                  login
                      ? DrawerListTiles(
                          ic: Const().logoutIc,
                          tags: "Login",
                          color: kColorWhite,
                          onTap: () {
                            // Get.toNamed(AppRoutes.loginScreen);
                          },
                        )
                      : const SizedBox.shrink(),
                  SizedBox(height: 88.h),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "App version v1",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xff4A4C54),
                      ),
                    ),
                  ),
                  SizedBox(height: 46.h),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
