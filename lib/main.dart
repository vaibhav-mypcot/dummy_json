import 'package:dummy_json/core/services/firebase/firebase_cloud_messaging.dart';
import 'package:dummy_json/core/services/network/connectivity_bloc/connectivity_bloc.dart';
import 'package:dummy_json/feature/otp/presentation/bloc/otp_bloc.dart';
import 'package:dummy_json/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:dummy_json/core/routes/app_routes.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_bloc.dart';
import 'package:dummy_json/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:dummy_json/feature/home/presentation/localization_bloc/localization_bloc.dart';
import 'package:dummy_json/feature/home/presentation/theme_bloc/theme_block.dart';
import 'package:dummy_json/feature/home_collection/presentation/bloc/home_bloc.dart';
import 'package:dummy_json/feature/network/presentation/bloc/network_bloc.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dummy_json/feature/products/presentation/bloc/product_bloc.dart';
import 'package:dummy_json/feature/suggest_question/prsentation/bloc/suggest_question_bloc.dart';
import 'package:dummy_json/feature/users/presentation/bloc/user_bloc.dart';
import 'package:dummy_json/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    provisional: false,
  );
  await FirebaseMessaging.instance.requestPermission();

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseCloudMessaging firebaseCloudMessaging = FirebaseCloudMessaging();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await firebaseCloudMessaging.setupFlutterNotifications();
  await firebaseCloudMessaging.getFirebaseNotification();

  // await dotenv.load(fileName: '.env');

  // Handling grey screen
  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());

    if (inDebug) {
      return ErrorWidget(details.exception);
    }
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Error\n${details.exception}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.amberAccent,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  };

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
        BlocProvider<SuggestQuestionBloc>(
            create: (_) => serviceLocator<SuggestQuestionBloc>()),
        BlocProvider<UserBloc>(create: (_) => serviceLocator<UserBloc>()),
        BlocProvider<OnBoardingBloc>(
            create: (_) => serviceLocator<OnBoardingBloc>()),
        BlocProvider<HomeBloc>(create: (_) => serviceLocator<HomeBloc>()),
        BlocProvider<AuthBloc>(create: (_) => serviceLocator<AuthBloc>()),
        BlocProvider<OtpBloc>(create: (_) => serviceLocator<OtpBloc>()),
        BlocProvider<ConnectivityBloc>(
            create: (_) => serviceLocator<ConnectivityBloc>()),
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
