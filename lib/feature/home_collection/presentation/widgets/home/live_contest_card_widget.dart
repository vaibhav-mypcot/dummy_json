import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/core/utils/constants/const.dart';
import 'package:dummy_json/feature/home_collection/presentation/widgets/home/card_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LiveContestCardWidget extends StatelessWidget {
  const LiveContestCardWidget({
    this.contestName = 'Bollyquizz Contest',
    this.totalQuestions = '16',
    this.imageUrl,
    super.key,
  });

  final String? contestName;
  final String? totalQuestions;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      // height: 88.h,
      width: screenWidth,
      decoration: BoxDecoration(
        color: kColorCardBg,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF272931),
            offset:  Offset(0, 6.0),
            blurRadius: 3.0,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // SizedBox(
              //   height: 48.h,
              //   width: 48.h,
              //   child: Image.asset(
              //     'assets/images/home/live_event.png',
              //   ),
              // ),
              SizedBox(
                height: 48.h,
                width: 48.h,
                child: FadeInImage(
                  placeholder: AssetImage(
                    Const().defaultImage,
                  ),
                  image: NetworkImage(imageUrl!),
                  imageErrorBuilder: (context, object, stackTrace) {
                    return Image.asset(
                      Const().defaultImage,
                      fit: BoxFit.fill,
                    );
                  },
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth - 200.w,
                    child: Text(
                      contestName!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kColorFontWhite,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CardIconWidget(
                    svgIconUrl: 'assets/icons/home/questions.svg',
                    text: '$totalQuestions Questions',
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/icons/general/forward.svg',
            height: 24.h,
            width: 24.h,
          ),
        ],
      ),
    );
  }
}
