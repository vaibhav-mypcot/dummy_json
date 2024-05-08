import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/core/utils/constants/const.dart';
import 'package:dummy_json/feature/address/data/profile_model/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toast/toast.dart';

@RoutePage()
class SubProfileScreen extends StatelessWidget {
  const SubProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    return Scaffold(
      backgroundColor: kColorBlackOff,
      body: SafeArea(
        child: Column(
          children: [
            // CustomAppBarNew(
            //   headingText: 'Profile',
            //   getBack: () => Get.back(),
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileHeader(),
                    // ProfileInfo(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});
  Data? data = Data();
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final homeController = Get.find<HomeScreenController>();
    // final profileController = Get.find<ProfileService>();
    return data != null
        ? Container(
            // alignment: Alignment.center,
            // margin: EdgeInsets.only(top: 40.h),

            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage(Const().profile_background_img),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.32,
                  decoration: BoxDecoration(),
                  child: SvgPicture.asset(
                    Const().profileBackgroundImg,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 60.h),
                        // color: Colors.blueAccent,
                        // child: CircleAvatar(
                        //   radius: 50.r,
                        //   backgroundImage: Image.network(
                        //     homeController.profile.value.data!.result!.userImage!,
                        //     errorBuilder: (context, error, stackTrace) {
                        //       return Image.asset(
                        //         Const().profileImage,
                        //         fit: BoxFit.cover,
                        //         height: 100.h,
                        //         width: 100.h,
                        //       );
                        //     },
                        //   ).image,
                        // ),

                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundColor: kColorWhite,
                          child: CircleAvatar(
                            radius: 48.r,
                            backgroundColor: Color(0xff181C28),
                            backgroundImage: FadeInImage.assetNetwork(
                              image: data!.result!.userImage!,
                              placeholder: Const().userProfilePic,
                              width: 100.h,
                              height: 100.h,
                              fit: BoxFit.contain,
                              imageErrorBuilder: (context, object, stackTrace) {
                                return Image.asset(
                                  Const().userProfilePic,
                                  fit: BoxFit.fill,
                                  height: 52.h,
                                  width: 52.h,
                                );
                              },
                            ).image,
                          ),
                        ),
                      ),
                      SizedBox(height: 21.h),
                      Container(
                        color: kBackgroundColor,
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: Text(
                          data!.result!.name.toString(),
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Color(0xffF9F7FF),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "+${data!.result!.phoneCode!} ${data!.result!.phone!}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xffBEBEC6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
