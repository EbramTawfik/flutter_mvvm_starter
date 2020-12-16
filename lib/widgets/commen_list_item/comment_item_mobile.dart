part of comment_list_item_widget;

class _CommentItemMobile extends StatelessWidget {
  final Comment comment;
  const _CommentItemMobile(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall,
          Text(comment.body),
        ],
      ),
    );
  }
}
