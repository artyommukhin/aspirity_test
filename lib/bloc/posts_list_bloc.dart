import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/post.dart';
import '../data/repository.dart';

part 'posts_list_bloc.freezed.dart';

class PostsListBloc extends Bloc<PostsListEvent, PostsListState> {
  PostsListBloc() : super(const PostsListState.loading()) {
    on<PostsListEvent>(_onEvent);
  }

  _onEvent(PostsListEvent event, Emitter<PostsListState> emit) async {
    await event.when(started: () async {
      emit(const PostsListState.loading());
      try {
        final posts = await _repository.getAllPosts();
        emit(PostsListState.success(posts: posts));
      } catch (e) {
        emit(const PostsListState.error(message: "Can't load posts list"));
      }
    });
  }

  final Repository _repository = Repository();
}

@freezed
class PostsListEvent with _$PostsListEvent {
  const factory PostsListEvent.started() = _Started;
}

@freezed
class PostsListState with _$PostsListState {
  const factory PostsListState.loading() = _Loading;

  const factory PostsListState.success({required List<Post> posts}) = _Success;

  const factory PostsListState.error({required String message}) = _Error;
}
