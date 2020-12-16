part of posts_list_widget;

class _PostsListMobile extends StatelessWidget {
  final HomeViewModel viewModel;
  _PostsListMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
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
