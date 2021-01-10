import 'package:flutter/material.dart';
import 'package:workshop_006_responsive_layout/demo/widgets/contact_view/contact_list.dart';

class ContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ContactList(),
    );
  }
}
