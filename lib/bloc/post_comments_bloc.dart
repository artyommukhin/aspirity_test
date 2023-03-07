import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/post_comment.dart';
import '../data/repository.dart';

part 'post_comments_bloc.freezed.dart';

class PostCommentsBloc extends Bloc<PostCommentsEvent, PostCommentsState> {
  PostCommentsBloc() : super(const PostCommentsState.loading()) {
    on<PostCommentsEvent>(_onEvent);
  }

  _onEvent(PostCommentsEvent event, Emitter<PostCommentsState> emit) async {
    await event.when(started: (postId) async {
      emit(const PostCommentsState.loading());
      try {
        var comments = await _repository.getPostComments(postId);
        emit(PostCommentsState.success(comments: comments));
      } catch (e) {
        emit(const PostCommentsState.error(message: "Can't load post comments"));
      }
    });
  }

  final Repository _repository = Repository();
}

@freezed
class PostCommentsEvent with _$PostCommentsEvent {
  const factory PostCommentsEvent.started({required int postId}) = _Started;
}

@freezed
class PostCommentsState with _$PostCommentsState {
  const factory PostCommentsState.loading() = _Loading;

  const factory PostCommentsState.success(
      {required List<PostComment> comments}) = _Success;

  const factory PostCommentsState.error({required String message}) = _Error;
}
