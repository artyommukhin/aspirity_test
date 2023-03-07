import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'model/post.dart';
import 'model/post_comment.dart';
import 'model/user.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET('/posts')
  Future<List<Post>> getPosts();

  @GET('/posts/{id}')
  Future<Post> getPost(@Path('id') int id);

  @GET('/posts/{id}/comments')
  Future<List<PostComment>> getPostComments(@Path('id') int id);

  @GET('/users/{id}')
  Future<User> getUser(@Path('id') int id);
}
