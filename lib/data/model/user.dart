import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'email') required String email,
  }) = _Post;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
