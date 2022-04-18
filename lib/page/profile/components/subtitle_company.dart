import 'package:flutter/material.dart';

class SubTitleCompany extends StatelessWidget {
  final String str;
  const SubTitleCompany({Key? key, required this.str}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
