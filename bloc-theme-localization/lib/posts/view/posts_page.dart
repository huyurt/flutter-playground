import 'package:bloc_theme_localization/core/localization/app_localizations.dart';
import 'package:bloc_theme_localization/posts/view/search_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_theme_localization/posts/posts.dart';
import 'package:http/http.dart' as http;

import '../bloc/locale_cubit.dart';
import '../bloc/switch_theme_cubit.dart';
import '../bloc/github_search_bloc.dart';
import '../github_repository.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key, required this.githubRepository}) : super(key: key);

  final GithubRepository githubRepository;

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_bar_title'.tr(context)),
        actions: [
          TextButton(
            child: const Text('en', style: TextStyle(color: Colors.white)),
            onPressed: () {
              BlocProvider.of<LocaleCubit>(context).changeLanguage('en');
            },
          ),
          TextButton(
            child: const Text('tr', style: TextStyle(color: Colors.white)),
            onPressed: () {
              BlocProvider.of<LocaleCubit>(context).changeLanguage('tr');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.brightness_4,
            ),
            tooltip: 'theme_selector_tooltip'.tr(context),
            onPressed: () async {
              await context.read<SwitchThemeCubit>().switchTheme();
            },
          ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                PostBloc(httpClient: http.Client())..add(PostFetched()),
          ),
          BlocProvider(
            create: (_) =>
                GithubSearchBloc(githubRepository: widget.githubRepository),
          ),
        ],
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TabBar(
                labelColor: Colors.green,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'tab_posts_title'.tr(context)),
                  Tab(text: 'tab_search_title'.tr(context)),
                ],
              ),
              const Expanded(
                flex: 1,
                child: TabBarView(
                  children: [
                    PostsList(),
                    SearchForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
