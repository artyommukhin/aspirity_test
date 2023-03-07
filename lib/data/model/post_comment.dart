import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_comment.freezed.dart';

part 'post_comment.g.dart';

@freezed
class PostComment with _$PostComment {
  const factory PostComment({
    @JsonKey(name: 'postId') required int postId,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String username,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'body') required String text,
  }) = _PostComment;

  factory PostComment.fromJson(Map<String, Object?> json) =>
      _$PostCommentFromJson(json);
}
