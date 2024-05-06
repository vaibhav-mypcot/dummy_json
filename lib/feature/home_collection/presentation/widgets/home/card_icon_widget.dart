import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardIconWidget extends StatelessWidget {
  const CardIconWidget({
    this.svgIconUrl = '',
    this.text = '',
    super.key,
  });

  final String svgIconUrl;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        svgIconUrl != ''
            ? SvgPicture.asset(
                svgIconUrl,
                height: 18.h,
                width: 18.h,
                // ignore: deprecated_member_use
                color: kColorFontWhiteOpacity75,
              )
            : const SizedBox(),
        SizedBox(
          width: 8.w,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: kColorFontWhiteOpacity75,
          ),
        ),
      ],
    );
  }
}
