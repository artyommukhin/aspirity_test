import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/user.dart';
import '../data/repository.dart';

part 'post_author_bloc.freezed.dart';

class PostAuthorBloc extends Bloc<PostAuthorEvent, PostAuthorState> {
  PostAuthorBloc() : super(const PostAuthorState.loading()) {
    on<PostAuthorEvent>(_onEvent);
  }

  _onEvent(PostAuthorEvent event, Emitter<PostAuthorState> emit) async {
    await event.when(started: (id) async {
      emit(const PostAuthorState.loading());
      try {
        var user = await _repository.getUser(id);
        emit(PostAuthorState.success(user: user));
      } catch (e) {
        emit(const PostAuthorState.error(message: "Can't load author data"));
      }
    });
  }


  final Repository _repository = Repository();
}

@freezed
class PostAuthorEvent with _$PostAuthorEvent {
  const factory PostAuthorEvent.started({required int id}) = _Started;
}

@freezed
class PostAuthorState with _$PostAuthorState {
  const factory PostAuthorState.loading() = _Loading;

  const factory PostAuthorState.success({required User user}) = _Success;

  const factory PostAuthorState.error({required String message}) = _Error;
}
