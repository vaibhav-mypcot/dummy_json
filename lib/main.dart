import 'package:dummy_json/core/routes/app_routes.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_bloc.dart';
import 'package:dummy_json/feature/home/presentation/localization_bloc/localization_bloc.dart';
import 'package:dummy_json/feature/home/presentation/theme_bloc/theme_block.dart';
import 'package:dummy_json/feature/network/presentation/bloc/network_bloc.dart';
import 'package:dummy_json/feature/products/presentation/bloc/product_bloc.dart';
import 'package:dummy_json/init_dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  // await dotenv.load(fileName: '.env');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(create: (_) => serviceLocator<ProductBloc>()),
        BlocProvider<ProfileBloc>(create: (_) => serviceLocator<ProfileBloc>()),
        BlocProvider<NetworkBloc>(
            create: (_) =>
                serviceLocator<NetworkBloc>()..add(NetworkObserve())),
        BlocProvider(create: (_) => LocalizationBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          final themeBloc =
              BlocProvider.of<ThemeBloc>(context, listen: true).state;

          return BlocBuilder<LocalizationBloc, LocalizationState>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: themeBloc.isDark ? ThemeData.dark() : ThemeData.light(),
                routerConfig: _appRouter.config(),
                locale: state.locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'), // English
                  Locale('hi'), // Hindi
                  Locale('mr'), // Marathi
                ],
              );
            },
          );
        });
  }
}
