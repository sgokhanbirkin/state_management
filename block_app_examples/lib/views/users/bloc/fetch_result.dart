part of 'user_bloc.dart';

@immutable
class FetchResult {
  const FetchResult({
    this.users = const [],
    required this.isCache,
  });
  final Iterable<User> users;
  final bool isCache;

  @override
  bool operator ==(covariant FetchResult other) {
    return users.isEqualOrIgnoring(other.users) && isCache == other.isCache;
  }

  @override
  int get hashCode => Object.hash(users, isCache);
}
