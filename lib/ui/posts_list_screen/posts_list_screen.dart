import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/posts_list_bloc.dart';
import 'error_view.dart';
import 'posts_list_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: BlocProvider(
          create: (_) => PostsListBloc()..add(const PostsListEvent.started()),
          child: BlocBuilder<PostsListBloc, PostsListState>(
            builder: (context, state) => state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (posts) => PostsListView(posts: posts),
              error: (message) => ErrorView(message: message),
            ),
          ),
        ));
  }
}
