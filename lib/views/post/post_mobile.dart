part of post_view;

class _PostMobile extends StatelessWidget {
  final PostViewModel viewModel;
  final Post post;
  const _PostMobile(this.viewModel, this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge,
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium,
            Text(post.body),
            Expanded(child: CommentsList(post.id))
          ],
        ),
      ),
    );
  }
}
