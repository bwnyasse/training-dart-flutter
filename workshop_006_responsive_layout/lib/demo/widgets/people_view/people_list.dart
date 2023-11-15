import 'package:flutter/material.dart';
import 'package:workshop_006_responsive_layout/demo/widgets/people_view/people_item.dart';

class PeopleList extends StatelessWidget {
  final bool isNotInChatMode;

  PeopleList({required this.isNotInChatMode});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 30,
      itemBuilder: (context, index) {
        return PeopleItem(
          isNotInChatMode: isNotInChatMode,
        );
      },
    );
  }
}
