import 'package:flutter/material.dart';
import 'package:workshop_006_responsive_layout/demo/fragments/chat_view_large.dart';
import 'package:workshop_006_responsive_layout/demo/fragments/chat_view_small.dart';

class ChatPage extends StatelessWidget {
  final Color profileIconColor;
  ChatPage(this.profileIconColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => LayoutBuilder(
          builder: (context, constraints) {
            double breakpointWidth = orientation == Orientation.portrait ? 600 : 800;

            if (constraints.maxWidth < breakpointWidth) {
              return ChatViewSmall(profileIconColor);
            } else {
              return ChatViewLarge(profileIconColor);
            }
          },
        ),
      ),
    );
  }
}
