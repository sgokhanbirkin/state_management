// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

typedef JsonMap = Map<String, dynamic>;

class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  const Post({
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  List<Object?> get props => [id, title, body];

  factory Post.fromJson(JsonMap json) => Post(
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );
}

class PostException implements Exception {
  final String error;
  const PostException({required this.error});
}
