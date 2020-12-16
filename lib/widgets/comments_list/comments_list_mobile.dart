part of comments_list_widget;

class _CommentsListMobile extends StatelessWidget {
  final int postId;
  final PostViewModel viewModel;
  _CommentsListMobile(this.postId, this.viewModel);

  @override
  Widget build(BuildContext context) {
    return viewModel.busy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: viewModel.comments.length,
            itemBuilder: (context, index) =>
                CommentItem(viewModel.comments[index]),
          );
  }
}
