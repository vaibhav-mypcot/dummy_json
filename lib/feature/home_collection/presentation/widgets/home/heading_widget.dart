import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    this.viewAllOnPressed,
    this.title = '',
    this.viewAllFlag = false,
    super.key,
  });

  final String title;
  final bool viewAllFlag;
  final VoidCallback? viewAllOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              color: kColorFontWhite,
            ),
          ),
          viewAllFlag
              ? GestureDetector(
                  onTap: viewAllOnPressed,
                  child: Text(
                    'View all',
                    style: TextStyle(
                      color: kColorSecondary,
                      fontSize: 12.sp,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
