import 'package:flutter/material.dart';
import 'package:jdih/page/profile/components/contact_body.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ContactBody(),
    );
  }
}
