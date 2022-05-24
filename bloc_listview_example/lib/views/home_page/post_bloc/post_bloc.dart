import 'dart:convert';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

import '../model/post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'post_event.dart';
part 'post_state.dart';

typedef HttpClient = http.Client;
const _postLimit = 20;
const _duration = Duration(milliseconds: 100);

EventTransformer<T> postDropable<T>(Duration duration) {
  return (evenst, mapper) {
    return droppable<T>().call(evenst.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required HttpClient client})
      : _client = client,
        super(
          PostState(),
        ) {
    on<PostFetched>(
      _onPostFetched,
      transformer: postDropable(_duration),
    );
  }
  final HttpClient _client;

  Future<void> _onPostFetched(PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPost();
        return emit(state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasReachedMax: false,
        ));
      }
      final posts = await _fetchPost(state.posts.length);
      posts.isEmpty
          ? emit(
              state.copyWith(hasReachedMax: true),
            )
          : emit(
              state.copyWith(
                posts: state.posts + posts,
                status: PostStatus.success,
              ),
            );
    } catch (_) {
      emit(
        state.copyWith(status: PostStatus.failure),
      );
    }
  }

  Future<List<Post>> _fetchPost([int startIndex = 0]) async {
    final response = await _client.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        {'_start': '$startIndex', '_limit': '$_postLimit'},
      ),
    );
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List<dynamic>)
          .map((dynamic post) => Post.fromJson(post))
          .cast<Post>()
          .toList();
    } else {
      throw PostException(
        error: response.body,
      );
    }
  }
}
