// ignore_for_file: must_be_immutable

part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  List<Post> posts;
  final bool hasReachedMax;
  final PostStatus status;

  PostState({
    this.posts = const <Post>[],
    this.hasReachedMax = false,
    this.status = PostStatus.initial,
  });

  PostState copyWith({
    List<Post>? posts,
    bool? hasReachedMax,
    PostStatus? status,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [posts, hasReachedMax, status];
}
