import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/feature/home/presentation/localization_bloc/localization_bloc.dart';
import 'package:dummy_json/feature/home/presentation/model/language_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<LocalizationBloc>(context);
    var groupValue = context.read<LocalizationBloc>().state.locale.languageCode;
    return BlocConsumer<LocalizationBloc, LocalizationState>(
      listener: (context, state) {
        groupValue = state.locale.languageCode;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('S.current.language'),
          ),
          body: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: languageModel.length,
                itemBuilder: (context, index) {
                  var item = languageModel[index];
                  return RadioListTile(
                    value: item.languageCode,
                    groupValue: groupValue,
                    title: Text(item.language!),
                    subtitle: Text(item.subLanguage!),
                    onChanged: (value) {
                      BlocProvider.of<LocalizationBloc>(context)
                          .add(LoadLocalization(Locale(item.languageCode!)));
                    },
                  );
                },
              ),
              SizedBox(height: 20.h),
              // Switch(
              //     value: themeBloc.isDark,
              //     onChanged: (isTheme) {
              //       print('${themeBloc.isDark}');
              //       context
              //           .read<LocalizationBloc>()
              //           .add(ToggleThemeEvent(isTheme));
              //     }),
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
        );
      },
    );
  }
}
