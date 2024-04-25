import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/routes/app_routes.gr.dart';
import 'package:dummy_json/feature/home/presentation/language_screen.dart';
import 'package:dummy_json/feature/home/presentation/localization_bloc/localization_bloc.dart';
import 'package:dummy_json/feature/home/presentation/theme_bloc/theme_block.dart';
import 'package:dummy_json/feature/home/presentation/theme_bloc/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  bool isTheme = false;

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
    final themeBloc = BlocProvider.of<ThemeBloc>(context, listen: true).state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Json'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LanguageScreen();
                }));
              },
              icon: const Icon(Icons.language)),
          IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(ThemeChangeEvent());
              },
              icon: themeBloc.isDark
                  ? Icon(Icons.brightness_2_rounded)
                  : Icon(Icons.sunny)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisExtent: 60.0,
                  mainAxisSpacing: 8.0,
                ),
                shrinkWrap: true,
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
            SizedBox(height: 20.h),
            Text(
              AppLocalizations.of(context)!.hello_world,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.example_text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.world_text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.language,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
