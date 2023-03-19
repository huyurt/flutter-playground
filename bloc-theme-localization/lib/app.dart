import 'package:bloc_theme_localization/posts/bloc/locale_cubit.dart';
import 'package:bloc_theme_localization/posts/bloc/locale_state.dart';
import 'package:bloc_theme_localization/posts/github_repository.dart';
import 'package:bloc_theme_localization/posts/bloc/switch_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bloc_theme_localization/posts/posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/helpers/cache_helper.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/app_localizations_setup.dart';
import 'core/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.githubRepository}) : super(key: key);

  final GithubRepository githubRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SwitchThemeCubit(
              initialTheme: CacheHelper.getCachedTheme()
                  ? AppTheme.darkTheme
                  : AppTheme.lightTheme),
        ),
      ],
      child: Builder(
        builder: (context) {
          return BlocProvider(
            create: (BuildContext context) => LocaleCubit()..getSavedLanguage(),
            child: BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
                if (state is ChangeLocaleState) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: context.watch<SwitchThemeCubit>().state,
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    locale: state.locale,
                    home: PostsPage(
                      githubRepository: githubRepository,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          );
        },
      ),
    );
  }
}
