import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/common_widgets/empty_state_widget.dart';
import 'package:dummy_json/core/routes/app_routes.gr.dart';
import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/core/utils/constants/const.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_bloc.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_state.dart';
import 'package:dummy_json/feature/home_collection/presentation/bloc/home_bloc.dart';
import 'package:dummy_json/feature/home_collection/presentation/widgets/home/heading_widget.dart';
import 'package:dummy_json/feature/home_collection/presentation/widgets/home/home_shimmer_widget.dart';
import 'package:dummy_json/feature/home_collection/presentation/widgets/home/suggest_question_card.dart';
import 'package:dummy_json/feature/network/presentation/bloc/network_bloc.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:carousel_slider/carousel_slider.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: 'Press back to exit',
          backgroundColor: kColorBlackOff.withOpacity(0.8));
      return Future.value(false);
    }
    SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<HomeBloc>().add(FetchHomeDataList());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    //-- Accessing Profile state
    final profileData = BlocProvider.of<ProfileBloc>(context).state;
    final startUpService = BlocProvider.of<OnBoardingBloc>(context).state;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        onWillPop();
      },
      child: Scaffold(
        backgroundColor: kColorBlackOff,
        body: BlocBuilder<NetworkBloc, NetworkState>(
          builder: (context, state) {
            if (state is NetworkFailure) {
              return Center(
                child: EmptyStateWidget(
                    isNoInternetScreen: true,
                    title: 'No Internet Connection',
                    subTitle:
                        'Uh-oh! It seems like you’re offline. \nPlease check your connection and try again'),
              );
            } else if (state is NetworkSuccess) {
              return RefreshIndicator(
                  onRefresh: () async {
                    // homeController.isLoading.value = true;
                    // await homeController.fetchHomeListing();
                  },
                  color: kColorFontWhiteOpacity75,
                  backgroundColor: kColorPrimary,
                  child: SingleChildScrollView(
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoadingState) {
                          return const HomeScreenShimmer();
                        } else if (state is HomeDataSuccess) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                for (int i = 0;
                                    i < state.result.length;
                                    i++) ...[
                                  // 1 BANNER
                                  state.result[i].type! == 'banner'
                                      ? Stack(
                                          children: [
                                            Container(
                                              height: screenHeight * 0.44,
                                            ),
                                            SizedBox(
                                              width: screenWidth,
                                              child: Image.asset(
                                                'assets/images/home/top_bg_banner.png',
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: screenHeight * 0.074,
                                                right: 24.w,
                                                left: 24.w,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      context.router.push(
                                                          const DrawerMenuScreenRoute());
                                                    },
                                                    child: SvgPicture.asset(
                                                      'assets/icons/home/drawer.svg',
                                                      height: 24.h,
                                                      width: 24.h,
                                                    ),
                                                  ),

                                                  // -- Notification Screen
                                                  // Obx(
                                                  //   () => Get.find<
                                                  //               StartupService>()
                                                  //           .response
                                                  //           .value
                                                  //           .data!
                                                  //           .result!
                                                  //           .screens!
                                                  //           .extraTabs!
                                                  //           .notificationIcon!
                                                  //       ? GestureDetector(
                                                  //           onTap: () {
                                                  //             Get.toNamed(AppRoutes
                                                  //                 .notificationListingScreen);
                                                  //           },
                                                  //           child: SvgPicture
                                                  //               .asset(
                                                  //             'assets/icons/home/notification.svg',
                                                  //             height: 24.h,
                                                  //             width: 24.h,
                                                  //           ),
                                                  //         )
                                                  //       : const SizedBox(),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: screenHeight * 0.074,
                                                  right: 24.w,
                                                  left: 65.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  BlocBuilder<ProfileBloc,
                                                      ProfileState>(
                                                    builder: (context, state) {
                                                      if (state
                                                          is ProfileLoadedState) {
                                                        return SizedBox(
                                                          width: screenWidth -
                                                              125.w,
                                                          child: Text(
                                                            'Hi, ${state.result!.name!}',
                                                            style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color:
                                                                    kColorFontWhite,
                                                                fontSize:
                                                                    24.sp),
                                                          ),
                                                        );
                                                      }
                                                      return SizedBox(
                                                        width:
                                                            screenWidth - 125.w,
                                                        child: Text(
                                                          'Hi, Guest',
                                                          style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              color:
                                                                  kColorFontWhite,
                                                              fontSize: 24.sp),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Text(
                                                    'Let’s play a quiz',
                                                    style: TextStyle(
                                                      color:
                                                          kColorFontWhiteOpacity75,
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            //Banner
                                            Positioned(
                                              top: screenHeight * 0.176,
                                              child: state.result.first.type ==
                                                      "banner"
                                                  ? Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 24.w,
                                                                  right: 24.w),
                                                          height: screenHeight *
                                                              0.22,
                                                          width: screenWidth -
                                                              48.w,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.r),
                                                            child: FadeInImage(
                                                              placeholder:
                                                                  AssetImage(
                                                                Const()
                                                                    .bannerDefaultImage,
                                                              ),
                                                              image:
                                                                  NetworkImage(
                                                                state
                                                                    .result
                                                                    .first
                                                                    .bannerImage
                                                                    .toString(),
                                                              ),
                                                              imageErrorBuilder:
                                                                  (context,
                                                                      object,
                                                                      stackTrace) {
                                                                return Image
                                                                    .asset(
                                                                  Const()
                                                                      .defaultImage,
                                                                  // fit: BoxFit.cover,
                                                                );
                                                              },
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : const SizedBox(),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),

                                  //2 LIVE CONTESTS
                                  // state.result[i].type! == 'live_contest'
                                  //     ? Column(
                                  //         children: [
                                  //           HeadingWidget(
                                  //             title: state.result[i].title!,
                                  //             viewAllFlag: state
                                  //                 .result[i]
                                  //                 .homeController
                                  //                 .response
                                  //                 .value
                                  //                 .data!
                                  //                 .result![i]
                                  //                 .viewAll!,
                                  //             viewAllOnPressed: () {
                                  //               Get.toNamed(
                                  //                 AppRoutes
                                  //                     .liveContestListingScreen,
                                  //                 arguments: {
                                  //                   // 'isEnrolledFlag': false,
                                  //                   'liveContestImgUrl': state
                                  //                       .result[i].imageUrl!,
                                  //                 },
                                  //               );
                                  //             },
                                  //           ),

                                  //       SizedBox(
                                  //         height: 16.h,
                                  //       ),

                                  //       //Live Contest List
                                  //       ListView.separated(
                                  //         padding: EdgeInsets.zero,
                                  //         shrinkWrap: true,
                                  //         physics:
                                  //             const NeverScrollableScrollPhysics(),
                                  //         itemBuilder: (context, index) =>
                                  //             GestureDetector(
                                  //           onTap: () {
                                  //             // Get.toNamed(
                                  //             //   AppRoutes
                                  //             //       .contestDetailsScreen,
                                  //             //   arguments: {
                                  //             //     // 'isEnrolledFlag': false,
                                  //             //     'cardIndex': index,
                                  //             //     'contestId':
                                  //             //         homeController
                                  //             //             .response
                                  //             //             .value
                                  //             //             .data!
                                  //             //             .result![i]
                                  //             //             .collectionData![
                                  //             //                 index]
                                  //             //             .contestId
                                  //             //   },
                                  //             // );

                                  //             log('---- Live contest tapped from home_screen ----');

                                  //             //Clearing contest details list when routing from home again
                                  //             // contestDetailsController
                                  //             //     .contestDetailsList
                                  //             //     .clear();
                                  //             // contestDetailsController
                                  //             //     .clearDetailsStates();

                                  //             // Utils().loading(context);
                                  //             // contestDetailsController
                                  //             //     .getContestDetails(
                                  //             //         homeController
                                  //             //             .response
                                  //             //             .value
                                  //             //             .data!
                                  //             //             .result![i]
                                  //             //             .collectionData![
                                  //             //                 index]
                                  //             //             .contestId);

                                  //             Get.back();

                                  //             Navigator.push(
                                  //               context,
                                  //               MaterialPageRoute(
                                  //                 builder: (context) =>
                                  //                     ContestDetailsScreen(
                                  //                         cardIndex: index,
                                  //                         contestId: homeController
                                  //                             .response
                                  //                             .value
                                  //                             .data!
                                  //                             .result![i]
                                  //                             .collectionData![
                                  //                                 index]
                                  //                             .contestId!),
                                  //               ),
                                  //             );
                                  //           },
                                  //           child: LiveContestCardWidget(
                                  //             totalQuestions: homeController
                                  //                 .response
                                  //                 .value
                                  //                 .data!
                                  //                 .result![i]
                                  //                 .collectionData![index]
                                  //                 .totalQuestion!
                                  //                 .toString(),
                                  //             contestName: homeController
                                  //                 .response
                                  //                 .value
                                  //                 .data!
                                  //                 .result![i]
                                  //                 .collectionData![index]
                                  //                 .contestName,
                                  //             imageUrl: homeController
                                  //                 .response
                                  //                 .value
                                  //                 .data!
                                  //                 .result![i]
                                  //                 .imageUrl!,
                                  //           ),
                                  //         ),
                                  //         separatorBuilder:
                                  //             (context, index) => SizedBox(
                                  //           height: 16.h,
                                  //         ),
                                  //         itemCount: homeController
                                  //             .response
                                  //             .value
                                  //             .data!
                                  //             .result![i]
                                  //             .collectionData!
                                  //             .length,
                                  //       ),

                                  //       SizedBox(
                                  //         height: 36.h,
                                  //       ),
                                  //     ],
                                  //   )
                                  // : const SizedBox(),

                                  // 3 RECENTLY PLAYED
                                  state.result[i].type! == 'recently_played'
                                      ? BlocSelector<OnBoardingBloc,
                                          OnBoardingState, bool>(
                                          selector: (state) {
                                            if (state is LoadStartupService) {
                                              bool recentlyPlayed = state
                                                      .result
                                                      .screens!
                                                      .home!
                                                      .recentlyPlayed ??
                                                  false;
                                              return recentlyPlayed;
                                            }
                                            return false;
                                          },
                                          builder: (context, recentlyPlayed) {
                                            recentlyPlayed
                                                ? Column(
                                                    children: [
                                                      const HeadingWidget(
                                                        title:
                                                            'Recently Played',
                                                        viewAllFlag: false,
                                                      ),
                                                      SizedBox(height: 16.h),
                                                      //Tab: Recently Played
                                                      // CarouselSlider(
                                                      //   options: CarouselOptions(
                                                      //     clipBehavior: Clip.none,
                                                      //     height: 70.h,
                                                      //     enableInfiniteScroll: false,
                                                      //     viewportFraction: 0.9,
                                                      //     // onPageChanged:
                                                      //     //     (index, reason) {
                                                      //     //   homeController
                                                      //     //       .currentIndex
                                                      //     //       .value = index;
                                                      //     // },
                                                      //   ),
                                                      //   items: List.generate(
                                                      //     homeController
                                                      //         .response
                                                      //         .value
                                                      //         .data!
                                                      //         .result![i]
                                                      //         .collectionData!
                                                      //         .length,
                                                      //     (index) => Builder(
                                                      //       builder: (BuildContext
                                                      //           context) {
                                                      //         return RecentlyPlayedCard(
                                                      //           title: homeController
                                                      //               .response
                                                      //               .value
                                                      //               .data!
                                                      //               .result![i]
                                                      //               .collectionData![
                                                      //                   index]
                                                      //               .contestName!,
                                                      //           onTap: () {
                                                      //             Get.toNamed(
                                                      //                 AppRoutes
                                                      //                     .quizResultScreen,
                                                      //                 arguments: {
                                                      //                   'contestId': homeController
                                                      //                       .response
                                                      //                       .value
                                                      //                       .data!
                                                      //                       .result![
                                                      //                           i]
                                                      //                       .collectionData![
                                                      //                           index]
                                                      //                       .contestId
                                                      //                 });
                                                      //           },
                                                      //           percent: homeController
                                                      //               .response
                                                      //               .value
                                                      //               .data!
                                                      //               .result![i]
                                                      //               .collectionData![
                                                      //                   index]
                                                      //               .percentage!,
                                                      //           imageUrl:
                                                      //               homeController
                                                      //                   .response
                                                      //                   .value
                                                      //                   .data!
                                                      //                   .result![i]
                                                      //                   .imageUrl!,
                                                      //         );
                                                      //       },
                                                      //     ),
                                                      //   ),
                                                      // ),

                                                      SizedBox(
                                                        height: 16.h,
                                                      ),

                                                      // Dots Indicator
                                                      // Container(
                                                      //   margin: EdgeInsets.only(
                                                      //       right: 24.w),
                                                      //   child: Row(
                                                      //     mainAxisAlignment:
                                                      //         MainAxisAlignment
                                                      //             .end,
                                                      //     children: List.generate(
                                                      //       homeController
                                                      //           .response
                                                      //           .value
                                                      //           .data!
                                                      //           .result![i]
                                                      //           .collectionData!
                                                      //           .length,
                                                      //       (index) => Obx(
                                                      //         () => Container(
                                                      //           width: 8.0,
                                                      //           height: 8.0,
                                                      //           margin:
                                                      //               const EdgeInsets
                                                      //                   .symmetric(
                                                      //                   vertical:
                                                      //                       8.0,
                                                      //                   horizontal:
                                                      //                       4.0),
                                                      //           decoration:
                                                      //               BoxDecoration(
                                                      //             borderRadius:
                                                      //                 BorderRadius
                                                      //                     .circular(
                                                      //                         2.r),
                                                      //             color: index ==
                                                      //                     2
                                                      //                 ? kColorSecondary
                                                      //                 : kColorSecondary
                                                      //                     .withOpacity(
                                                      //                         0.25), // Adjust active and inactive dot colors
                                                      //           ),
                                                      //         ),
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),

                                                      SizedBox(height: 36.h),
                                                    ],
                                                  )
                                                : const SizedBox();
                                            return const SizedBox();
                                          },
                                        )
                                      : const SizedBox(),

                                  // //4 FEATURED CONTEST
                                  // homeController.response.value.data!.result![i]
                                  //             .type! ==
                                  //         'featured_contest'
                                  //     ? Container(
                                  //         child: Column(
                                  //           children: [
                                  //             HeadingWidget(
                                  //               title: homeController
                                  //                   .response
                                  //                   .value
                                  //                   .data!
                                  //                   .result![i]
                                  //                   .title!,
                                  //               viewAllFlag: homeController
                                  //                   .response
                                  //                   .value
                                  //                   .data!
                                  //                   .result![i]
                                  //                   .viewAll!,
                                  //               viewAllOnPressed: () async {
                                  //                 // Call featured_contest listing API here

                                  //                 Get.toNamed(
                                  //                   AppRoutes
                                  //                       .contestListingFeaturedScreen,
                                  //                   arguments: {
                                  //                     "screenTitle":
                                  //                         homeController
                                  //                             .response
                                  //                             .value
                                  //                             .data!
                                  //                             .result![i]
                                  //                             .title!,
                                  //                     "contestListType":
                                  //                         homeController
                                  //                             .response
                                  //                             .value
                                  //                             .data!
                                  //                             .result![i]
                                  //                             .type!,
                                  //                   },
                                  //                 );
                                  //               },
                                  //             ),

                                  //             SizedBox(
                                  //               height: 16.h,
                                  //             ),

                                  //             //featured_contest List
                                  //             SizedBox(
                                  //               height: 246.h,
                                  //               child: ListView.separated(
                                  //                   clipBehavior: Clip.none,
                                  //                   padding: EdgeInsets.only(
                                  //                       left: 24.w,
                                  //                       right: 24.w),
                                  //                   scrollDirection:
                                  //                       Axis.horizontal,
                                  //                   shrinkWrap: true,
                                  //                   itemBuilder:
                                  //                       (context, index) =>
                                  //                           GestureDetector(
                                  //                             onTap: () {
                                  //                               log('---- Featured contest tapped from home_screen ----');

                                  //                               //Clearing contest details list when routing from home again
                                  //                               // contestDetailsController
                                  //                               //     .contestDetailsList
                                  //                               //     .clear();
                                  //                               contestDetailsController
                                  //                                   .clearDetailsStates();

                                  //                               Utils().loading(
                                  //                                   context);
                                  //                               contestDetailsController.getContestDetails(homeController
                                  //                                   .response
                                  //                                   .value
                                  //                                   .data!
                                  //                                   .result![i]
                                  //                                   .collectionData![
                                  //                                       index]
                                  //                                   .contestId);

                                  //                               Get.back();

                                  //                               Navigator.push(
                                  //                                 context,
                                  //                                 MaterialPageRoute(
                                  //                                   builder: (context) => ContestDetailsScreen(
                                  //                                       cardIndex:
                                  //                                           index,
                                  //                                       contestId: homeController
                                  //                                           .response
                                  //                                           .value
                                  //                                           .data!
                                  //                                           .result![i]
                                  //                                           .collectionData![index]
                                  //                                           .contestId!),
                                  //                                 ),
                                  //                               );

                                  //                               // Get.toNamed(
                                  //                               //   AppRoutes
                                  //                               //       .contestDetailsScreen,
                                  //                               //   arguments: {
                                  //                               //     // 'isEnrolledFlag': false,
                                  //                               //     'cardIndex':
                                  //                               //         index,
                                  //                               // 'contestId': homeController
                                  //                               //     .response
                                  //                               //     .value
                                  //                               //     .data!
                                  //                               //     .result![
                                  //                               //         i]
                                  //                               //     .collectionData![
                                  //                               //         index]
                                  //                               //     .contestId
                                  //                               //   },
                                  //                               // );
                                  //                             },
                                  //                             child:
                                  //                                 UpcomingContestCardWidget(
                                  //                               cardIndex:
                                  //                                   index,
                                  //                               contestName: homeController
                                  //                                   .response
                                  //                                   .value
                                  //                                   .data!
                                  //                                   .result![i]
                                  //                                   .collectionData![
                                  //                                       index]
                                  //                                   .contestName!,
                                  //                               subTitle: homeController
                                  //                                   .response
                                  //                                   .value
                                  //                                   .data!
                                  //                                   .result![i]
                                  //                                   .collectionData![
                                  //                                       index]
                                  //                                   .subTitle!,
                                  //                               contestDate: homeController
                                  //                                   .response
                                  //                                   .value
                                  //                                   .data!
                                  //                                   .result![i]
                                  //                                   .collectionData![
                                  //                                       index]
                                  //                                   .contestDate!,
                                  //                               contestTimeStart:
                                  //                                   homeController
                                  //                                       .response
                                  //                                       .value
                                  //                                       .data!
                                  //                                       .result![
                                  //                                           i]
                                  //                                       .collectionData![
                                  //                                           index]
                                  //                                       .contestTimeStart!,
                                  //                               totalQuestions: homeController
                                  //                                   .response
                                  //                                   .value
                                  //                                   .data!
                                  //                                   .result![i]
                                  //                                   .collectionData![
                                  //                                       index]
                                  //                                   .totalQuestion!
                                  //                                   .toString(),
                                  //                             ),
                                  //                           ),
                                  //                   separatorBuilder:
                                  //                       (context, index) =>
                                  //                           SizedBox(
                                  //                             width: 16.w,
                                  //                           ),
                                  //                   itemCount: homeController
                                  //                       .response
                                  //                       .value
                                  //                       .data!
                                  //                       .result![i]
                                  //                       .collectionData!
                                  //                       .length),
                                  //             ),

                                  //             SizedBox(
                                  //               height: 36.h,
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       )
                                  //     : const SizedBox(),

                                  //5 WIN BIG THIS WEEK
                                  // homeController.response.value.data!.result![i]
                                  //             .type! ==
                                  //         'win_big_this_week'
                                  //     ? Container(
                                  //         child: Column(
                                  //           children: [
                                  //             HeadingWidget(
                                  //               title: homeController
                                  //                   .response
                                  //                   .value
                                  //                   .data!
                                  //                   .result![i]
                                  //                   .title!,
                                  //               viewAllFlag: homeController
                                  //                   .response
                                  //                   .value
                                  //                   .data!
                                  //                   .result![i]
                                  //                   .viewAll!,
                                  //               viewAllOnPressed: () async {
                                  //                 // Call win_big_this_week listing API here

                                  //                 Get.toNamed(
                                  //                   AppRoutes
                                  //                       .contestListingWinBigScreen,
                                  //                   arguments: {
                                  //                     "screenTitle":
                                  //                         homeController
                                  //                             .response
                                  //                             .value
                                  //                             .data!
                                  //                             .result![i]
                                  //                             .title!,
                                  //                     "contestListType":
                                  //                         homeController
                                  //                             .response
                                  //                             .value
                                  //                             .data!
                                  //                             .result![i]
                                  //                             .type!,
                                  //                   },
                                  //                 );
                                  //               },
                                  //             ),

                                  //             SizedBox(
                                  //               height: 16.h,
                                  //             ),

                                  //             //WIN BIG THIS WEEK Contest List
                                  //             SizedBox(
                                  //               height: 246.h,
                                  //               child: ListView.separated(
                                  //                   clipBehavior: Clip.none,
                                  //                   padding: EdgeInsets.only(
                                  //                       left: 24.w,
                                  //                       right: 24.w),
                                  //                   scrollDirection:
                                  //                       Axis.horizontal,
                                  //                   shrinkWrap: true,
                                  //                   itemBuilder:
                                  //                       (context, index) =>
                                  //                           GestureDetector(
                                  //                             onTap: () {
                                  //                               log('---- Win big this week contest tapped from home_screen ----');

                                  //                               //Clearing contest details list when routing from home again
                                  //                               // contestDetailsController
                                  //                               //     .contestDetailsList
                                  //                               //     .clear();
                                  //                               contestDetailsController
                                  //                                   .clearDetailsStates();

                                  //                               Utils().loading(
                                  //                                   context);
                                  //                               contestDetailsController.getContestDetails(homeController
                                  //                                   .response
                                  //                                   .value
                                  //                                   .data!
                                  //                                   .result![i]
                                  //                                   .collectionData![
                                  //                                       index]
                                  //                                   .contestId);

                                  //                               Get.back();

                                  //                               Navigator.push(
                                  //                                 context,
                                  //                                 MaterialPageRoute(
                                  //                                   builder: (context) => ContestDetailsScreen(
                                  //                                       cardIndex:
                                  //                                           index,
                                  //                                       contestId: homeController
                                  //                                           .response
                                  //                                           .value
                                  //                                           .data!
                                  //                                           .result![i]
                                  //                                           .collectionData![index]
                                  //                                           .contestId!),
                                  //                                 ),
                                  //                               );

                                  //                               // Get.toNamed(
                                  //                               //   AppRoutes
                                  //                               //       .contestDetailsScreen,
                                  //                               //   arguments: {
                                  //                               //     // 'isEnrolledFlag': false,
                                  //                               //     'cardIndex':
                                  //                               //         index,
                                  //                               //     'contestId': homeController
                                  //                               //         .response
                                  //                               //         .value
                                  //                               //         .data!
                                  //                               //         .result![
                                  //                               //             i]
                                  //                               //         .collectionData![
                                  //                               //             index]
                                  //                               //         .contestId
                                  //                               //   },
                                  //                               // );
                                  //                             },
                                  //                             child:
                                  //                                 UpcomingContestCardWidget(
                                  //                               cardIndex:
                                  //                                   index,
                                  //                               contestName: homeController
                                  //                                   .response
                                  //                                   .value
                                  //                                   .data!
                                  //                                   .result![i]
                                  //                                   .collectionData![
                                  //                                       index]
                                  //                                   .contestName!,
                                  //                               subTitle: homeController
                                  //                                   .response
                                  //                                   .value
                                  //                                   .data!
                                  //                                   .result![i]
                                  //                                   .collectionData![
                                  //                                       index]
                                  //                                   .subTitle!,
                                  //                               contestDate: homeController
                                  //                                   .response
                                  //                                   .value
                                  //                                   .data!
                                  //                                   .result![i]
                                  //                                   .collectionData![
                                  //                                       index]
                                  //                                   .contestDate!,
                                  //                               contestTimeStart:
                                  //                                   homeController
                                  //                                       .response
                                  //                                       .value
                                  //                                       .data!
                                  //                                       .result![
                                  //                                           i]
                                  //                                       .collectionData![
                                  //                                           index]
                                  //                                       .contestTimeStart!,
                                  //                               totalQuestions: homeController
                                  //                                   .response
                                  //                                   .value
                                  //                                   .data!
                                  //                                   .result![i]
                                  //                                   .collectionData![
                                  //                                       index]
                                  //                                   .totalQuestion!
                                  //                                   .toString(),
                                  //                             ),
                                  //                           ),
                                  //                   separatorBuilder:
                                  //                       (context, index) =>
                                  //                           SizedBox(
                                  //                             width: 16.w,
                                  //                           ),
                                  //                   itemCount: homeController
                                  //                       .response
                                  //                       .value
                                  //                       .data!
                                  //                       .result![i]
                                  //                       .collectionData!
                                  //                       .length),
                                  //             ),

                                  //             SizedBox(
                                  //               height: 36.h,
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       )
                                  //     : const SizedBox(),

                                  //YOU CAN TEST THE CRASH FROM HERE
                                  // TextButton(
                                  //   onPressed: () => throw Exception(),
                                  //   child: const Text("Throw Test Exception"),
                                  // ),
                                ],
                                Column(
                                  children: [
                                    //5 STATIC: SUGGEST QUESTION
                                    const HeadingWidget(
                                      title: 'Suggest Question',
                                      viewAllFlag: false,
                                    ),

                                    SizedBox(
                                      height: 16.h,
                                    ),

                                    //Suggest Question Card
                                    const SuggestQuestionCard(),
                                  ],
                                ),
                                SizedBox(
                                  height: 60.h,
                                ),
                              ],
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
