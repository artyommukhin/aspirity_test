import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/post_bloc.dart';
import '../../common/error_text.dart';
import 'post_view.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PostBloc()..add(PostEvent.started(id: id)),
        child: Scaffold(
            appBar: AppBar(title: Text("Post $id")),
            body: BlocBuilder<PostBloc, PostState>(
              builder: (context, state) => state.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (post) => PostView(post: post),
                error: (message) => Center(child: ErrorText(message)),
              ),
            )));
  }
}
