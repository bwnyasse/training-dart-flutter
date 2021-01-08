import 'package:flutter/material.dart';
import 'package:workshop_006_responsive_layout/demo/widgets/bookmark_view/bookmark_item.dart';

class BookmarkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return BookmarkItem();
      },
    );
  }
}
