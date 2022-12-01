import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../model/post.dart';
import './widget/post_item.dart';

class GetData extends StatefulWidget {
  @override
  _InfiniteScrollPaginatorDemoState createState() =>
      _InfiniteScrollPaginatorDemoState();
}

class _InfiniteScrollPaginatorDemoState extends State<GetData> {
  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = await get(
          Uri.parse(
              "https://gorest.co.in/public/v2/users?page=$pageKey&per_page=$_numberOfPostsPerRequest"),
          headers: {
            'Authorization':
                'Bearer 1fbcc0653b05027b134631f9addd6aa7b83e435a75eac0db06db98dd8779d9d2'
          });
      List responseList = json.decode(response.body);
      List<Post> postList = responseList
          .map((data) => Post(data['name'], data['email']))
          .toList();
      final isLastPage = postList.length < _numberOfPostsPerRequest;
      if (isLastPage) {
        _pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(postList, nextPageKey);
      }
    } catch (e) {
      print("error --> $e");
      _pagingController.error = e;
    }
  }

  final _numberOfPostsPerRequest = 10;

  final PagingController<int, Post> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _pagingController.refresh()),
        child: PagedListView<int, Post>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Post>(
            itemBuilder: (context, item, index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: PostItem(item.name, item.email),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
