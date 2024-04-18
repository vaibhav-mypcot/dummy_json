import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/routes/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List title = [
    'Product',
    'Address',
    'Cart',
    'Users',
    'Posts',
    'Image',
    'Recipes'
  ];
  final List<dynamic> routes = [
    const ProductListScreenRoute(),
    const AddressScreenRoute(),
  ];

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
                onTap: () {
                  if (index < routes.length) {
                    AutoRouter.of(context).push(routes[index]);
                  }
                },
                child: Card(
                  child: Column(
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
