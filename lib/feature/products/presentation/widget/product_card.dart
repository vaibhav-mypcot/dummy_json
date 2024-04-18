import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  var item;
  ProductCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Column(
          children: [
            Image.network(
              item.images[0],
              fit: BoxFit.cover,
              height: 50.h,
              width: 80.w,
            ),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
            Text(
              '\$ ${item.price} ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
