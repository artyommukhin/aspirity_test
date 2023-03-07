import 'package:flutter/material.dart';

import '../../data/model/post.dart';
import '../post_screen/post_screen.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({super.key, required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) => PostView(post: posts[index])),
      ),
    );
  }
}

class PostView extends StatelessWidget {
  const PostView({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Card(
        shadowColor: Colors.transparent,
        child: ListTile(
          title: Text(post.title, style: textTheme.titleLarge),
          subtitle: Text(post.text, style: textTheme.bodyMedium),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => PostScreen(id: post.id))),
        ),
      ),
    );
  }
}
