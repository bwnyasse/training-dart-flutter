import 'package:flutter/material.dart';
import 'package:workshop_006_responsive_layout/demo/widgets/contact_view/contact_item.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ContactItem();
      },
    );
  }
}
