import 'package:bloc/bloc.dart';
import 'package:bloc_theme_localization/posts/github_cache.dart';
import 'package:bloc_theme_localization/posts/github_client.dart';
import 'package:bloc_theme_localization/posts/github_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_theme_localization/app.dart';
import 'package:bloc_theme_localization/simple_bloc_observer.dart';

import 'core/helpers/cache_helper.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  final githubRepository = GithubRepository(
    GithubCache(),
    GithubClient(),
  );

  Bloc.observer = const SimpleBlocObserver();
  runApp(App(
    githubRepository: githubRepository,
  ));
}
