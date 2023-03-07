import 'package:dio/dio.dart';

import 'api.dart';
import 'model/post.dart';
import 'model/post_comment.dart';
import 'model/user.dart';

class Repository {
  final Api _api = Api(Dio());

  Future<List<Post>> getAllPosts() async => await _api.getPosts();

  Future<Post> getPost(int id) async => await _api.getPost(id);

  Future<List<PostComment>> getPostComments(int postId) async =>
      await _api.getPostComments(postId);

  Future<User> getUser(int id) async => await _api.getUser(id);
}
