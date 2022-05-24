import 'package:bloc_listview_example/views/home_page/post_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/post.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      create: (_) => PostBloc(
        client: HttpClient(),
      )..add(
          const PostFetched(),
        ),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String data = 'Posts';
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener
      ..dispose();

    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(const PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScrool = _scrollController.position.maxScrollExtent;
    final currentScrool = _scrollController.offset;
    return currentScrool > (maxScrool * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data),
        centerTitle: true,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.initial:
              return const IndicatorWidget();
            case PostStatus.success:
              if (state.posts.isEmpty) {
                return Center(
                  child: Text(
                    'Post bulunamadı...',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return index >= state.posts.length
                      ? const IndicatorWidget()
                      : ListPostItem(
                          post: state.posts[index],
                        );
                },
                itemCount: state.hasReachedMax ? state.posts.length : state.posts.length + 1,
                controller: _scrollController,
              );
            case PostStatus.failure:
              return Center(
                child: Text(
                  'Bir Hata Oluştu!',
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            default:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Lütfen bekleyiniz...'),
                    CircularProgressIndicator(
                      strokeWidth: 1.5,
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 36,
        height: 36,
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
        ),
      ),
    );
  }
}

class ListPostItem extends StatefulWidget {
  const ListPostItem({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  State<ListPostItem> createState() => _ListPostItemState();
}

class _ListPostItemState extends State<ListPostItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: Text(
          '${widget.post.id}',
          style: Theme.of(context).textTheme.caption,
        ),
        title: Text(widget.post.title, style: Theme.of(context).textTheme.headline6),
        subtitle: Text(widget.post.body, style: Theme.of(context).textTheme.bodyText2),
        isThreeLine: true,
      ),
    );
  }
}
