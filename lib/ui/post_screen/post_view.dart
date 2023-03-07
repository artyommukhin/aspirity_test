import 'package:flutter/material.dart';

import '../../data/model/post.dart';
import 'post_author_view.dart';
import 'post_comments_view.dart';

class PostView extends StatelessWidget {
  const PostView({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title, style: textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(post.text, style: textTheme.bodyLarge),
            const SizedBox(height: 8),
            PostAuthorView(userId: post.userId),
            const SizedBox(height: 8),
            PostCommentsView(postId: post.id)
          ],
        ),
      ),
    );
  }

}