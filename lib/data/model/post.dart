import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    @JsonKey(name: 'userId') required int userId,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'body') required String text,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);
}
