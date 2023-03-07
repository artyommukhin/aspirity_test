import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/post_comments_bloc.dart';
import '../../common/error_text.dart';
import '../../data/model/post_comment.dart';

class PostCommentsView extends StatefulWidget {
  const PostCommentsView({super.key, required this.postId});

  final int postId;

  @override
  State<PostCommentsView> createState() => _PostCommentsViewState();
}

class _PostCommentsViewState extends State<PostCommentsView> {
  var isVisible = false;

  @override
  Widget build(BuildContext context) {
    final Icon icon;
    if (isVisible) {
      icon = const Icon(Icons.arrow_drop_up_rounded);
    } else {
      icon = const Icon(Icons.arrow_drop_down_rounded);
    }

    return BlocProvider(
        create: (context) => PostCommentsBloc()
          ..add(PostCommentsEvent.started(postId: widget.postId)),
        child: Column(
          children: [
            Center(
                child: FilledButton.tonalIcon(
                    onPressed: () => setState(() => isVisible = !isVisible),
                    icon: icon,
                    label: const Text('Comments'))),
            const SizedBox(height: 4),
            Visibility(
              visible: isVisible,
              child: BlocBuilder<PostCommentsBloc, PostCommentsState>(
                builder: (context, state) => state.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    success: (comments) => CommentsListView(comments: comments),
                    error: (message) => ErrorText(message)),
              ),
            ),
          ],
        ));
  }
}

class CommentsListView extends StatelessWidget {
  const CommentsListView({super.key, required this.comments});

  final List<PostComment> comments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...comments.map((comment) => CommentView(comment: comment))],
    );
  }
}

class CommentView extends StatelessWidget {
  const CommentView({super.key, required this.comment});

  final PostComment comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      child: ListTile(
        title: Text("${comment.username} <${comment.email}>"),
        subtitle: Text(comment.text),
      ),
    );
  }
}
