import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/posts_list_bloc.dart';
import '../../common/error_text.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PostsListBloc>(context);
    return Container(
      margin: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ErrorText(message),
          const SizedBox(height: 8),
          FilledButton.tonalIcon(
              onPressed: () => bloc.add(const PostsListEvent.started()),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'))
        ],
      ),
    );
  }
}
