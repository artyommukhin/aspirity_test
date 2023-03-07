import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/post.dart';
import '../data/repository.dart';

part 'post_bloc.freezed.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState.loading()) {
    on<PostEvent>(_onEvent);
  }

  _onEvent(PostEvent event, Emitter<PostState> emit) async {
    await event.when(started: (id) async {
      emit(const PostState.loading());
      try {
        final post = await _repository.getPost(id);
        emit(PostState.success(post: post));
      } catch (e) {
        emit(const PostState.error(message: "Can't load post data"));
      }
    });
  }

  final Repository _repository = Repository();
}

@freezed
class PostEvent with _$PostEvent {
  const factory PostEvent.started({required int id}) = _Started;
}

@freezed
class PostState with _$PostState {
  const factory PostState.loading() = _Loading;

  const factory PostState.success({required Post post}) = _Success;

  const factory PostState.error({required String message}) = _Error;
}
