import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: kColorPrimary.withOpacity(0.3),
              highlightColor: kColorPrimary.withOpacity(0.6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Container(
                    height: 30.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  Container(
                    height: 20.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // Shimmer for the top banner
                  Container(
                    height: 175.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30.h),

                  Container(
                    height: 25.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Shimmer for the "Live section
                  Container(
                    height: 88.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  Container(
                    height: 25.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Shimmer for the "Recently" section
                  Container(
                    height: 230.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
