import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerListTiles extends StatelessWidget {
  const DrawerListTiles({
    super.key,
    required this.ic,
    required this.tags,
    this.color,
    this.onTap,
  });

  final String ic;
  final String tags;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 16),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  ic,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16.w),
                Text(
                  tags,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: color,
                  ),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: color,
              size: 14.sp,
            )
          ],
        ),
      ),
    );
  }
}
