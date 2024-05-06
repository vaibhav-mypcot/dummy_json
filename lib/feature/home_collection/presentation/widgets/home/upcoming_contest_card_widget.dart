import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/core/utils/functions/get_color_details_bg_index.dart';
import 'package:dummy_json/feature/home_collection/presentation/widgets/home/card_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpcomingContestCardWidget extends StatelessWidget {
  const UpcomingContestCardWidget({
    this.cardIndex = 0,
    this.contestName = 'BollyQuizz',
    this.subTitle = 'Lorem ipsum dollar domet Lorem ipsum dollar domet',
    this.contestTimeStart = '7:00 pm',
    this.contestDate = '28th Nov',
    this.totalQuestions = '18',
    super.key,
  });

  final int cardIndex;
  final String? contestName;
  final String? subTitle;
  final String? contestTimeStart;
  final String? contestDate;
  final String? totalQuestions;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // height: screenHeight * 0.2,
      padding: EdgeInsets.only(bottom: 24.h),
      width: screenWidth - 80.w,
      decoration: BoxDecoration(
        color: kColorCardBg,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
           BoxShadow(
            color:  Color(0xFF272931),
            offset: Offset(0, 6.0),
            blurRadius: 3.0,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: getColorDetailsBgByIndex(cardIndex)),
                  height: screenHeight * 0.117,
                  width: screenWidth,
                  child: SvgPicture.asset(
                    "assets/icons/upcoming_contest/card.svg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                bottom: 16.h,
                left: 24.w,
                child: Text(
                  contestName!,
                  style: TextStyle(
                    color: kColorFontWhite,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ],
          ),

          //Description
          Container(
            padding: EdgeInsets.only(top: 16.h, right: 24.w, left: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 36.h,
                  child: Text(
                    subTitle!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: kColorFontWhiteOpacity75,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    CardIconWidget(
                      svgIconUrl: 'assets/icons/home/clock.svg',
                      text: contestTimeStart!,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    CardIconWidget(
                      svgIconUrl: 'assets/icons/home/calendar.svg',
                      text: contestDate!,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Column(
                  children: [
                    CardIconWidget(
                      svgIconUrl: 'assets/icons/home/questions.svg',
                      text: '$totalQuestions Questions',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
