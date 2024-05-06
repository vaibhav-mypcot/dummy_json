import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WideButtonWidget extends StatelessWidget {
  const WideButtonWidget({
    this.buttonTitle = '',
    super.key,
  });

  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
      decoration: BoxDecoration(
        color: kColorPrimary,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
              color: const Color(0xff3D2690),
              spreadRadius: -0.7.h,
              offset: const Offset(0, 5))
        ],
      ),
      child: Center(
        child: Text(
          buttonTitle,
          style: TextStyle(color: kColorFontWhite, fontSize: 16.sp),
        ),
      ),
    );
  }
}
