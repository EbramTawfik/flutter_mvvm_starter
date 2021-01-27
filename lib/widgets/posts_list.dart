import 'package:flutter_mvvm_starter/core/constants/route_paths.dart';
import 'package:flutter_mvvm_starter/views/home/home_view_model.dart';
import 'package:flutter_mvvm_starter/widgets/post_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Container(
        child: viewModel.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: viewModel.posts.length,
                itemBuilder: (context, index) {
                  print(viewModel.posts[index].title);
                  return PostItem(
                    post: viewModel.posts[index],
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutePaths.Post,
                        arguments: viewModel.posts[index],
                      );
                    },
                  );
                },
              ));
  }
}
