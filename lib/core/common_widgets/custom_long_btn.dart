import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLongButton extends StatelessWidget {
  const CustomLongButton({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(
            width: 1.5.h,
            color: const Color(0xff272A31),
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 105.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 24.0.w, right: 24.0.w, top: 16.h, bottom: 36.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
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
                  label,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
