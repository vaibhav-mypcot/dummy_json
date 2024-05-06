import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/routes/app_routes.gr.dart';
import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestQuestionCard extends StatelessWidget {
  const SuggestQuestionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding:
          EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w, bottom: 24.h),
      width: screenWidth,
      decoration: BoxDecoration(
        color: kColorCardBg,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF272931),
            offset: Offset(0, 6.0),
            blurRadius: 3.0,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Got an interesting quiz question?',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: kColorFontWhite,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(SuggestQuestionScreenRoute());
                    //Get.toNamed(AppRoutes.suggestQuestionScreen);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: kColorBlackOff.withOpacity(0.25),
                        border: Border.all(
                          width: 1.w,
                          color: kColorPrimary,
                        )),
                    child: Text(
                      'Suggest Question',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kColorPrimary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 108.h,
            width: 108.h,
            child: Image.asset('assets/icons/home/suggestion.gif'),
          )
        ],
      ),
    );
  }
}
