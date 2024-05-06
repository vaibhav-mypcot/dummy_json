import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/core/utils/constants/const.dart';
import 'package:dummy_json/core/utils/functions/get_percent_in_double.dart';
import 'package:dummy_json/core/widgets/custom_painters/percentage_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentlyPlayedCard extends StatelessWidget {
  const RecentlyPlayedCard({
    this.onTap,
    this.title = '',
    this.percent = '',
    this.imageUrl = '',
    super.key,
  });

  final void Function()? onTap;
  final String? title;
  final String? percent;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: kColorPrimary,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: kColorPrimary.withOpacity(0.6),
              offset: const Offset(0, 6.0),
              blurRadius: 3.0,
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        width: screenWidth - 48.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 44.h,
                  width: 44.h,
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
                SizedBox(
                  width: screenWidth * 0.4,
                  child: Text(
                    title!,
                    style: TextStyle(
                      color: kColorFontWhite,
                      fontSize: 14.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 49.h,
                  width: 49.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: kColorFontWhiteOpacity75, width: 1.h),
                  ),
                  child: CustomPaint(
                    painter: PercentagePainter(
                      percentage: getPercentInDouble(percent!),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 49.h,
                  width: 49.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kColorTransparent,
                  ),
                  child: Text(
                    "${getPercentInDouble(percent!).round().toString()}%",
                    style: TextStyle(
                      color: kColorFontWhite,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
