import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List title = ['Product', 'Cart', 'Users', 'Posts', 'Image', 'Recipes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Json'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisExtent: 60.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: title.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Card(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title[index],
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
