import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/post_author_bloc.dart';
import '../../common/error_text.dart';

class PostAuthorView extends StatelessWidget {
  const PostAuthorView({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) =>
          PostAuthorBloc()..add(PostAuthorEvent.started(id: userId)),
      child: BlocBuilder<PostAuthorBloc, PostAuthorState>(
        builder: (context, state) => state.when(
          loading: () => const CircularProgressIndicator(),
          success: (user) =>
              Text('Author: ${user.name} <${user.email}>', style: textTheme.titleSmall),
          error: (message) => ErrorText(message),
        ),
      ),
    );
  }
}
