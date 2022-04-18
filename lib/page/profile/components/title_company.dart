import 'package:flutter/material.dart';

class TitleCompany extends StatelessWidget {
  final String str;
  const TitleCompany({Key? key, required this.str}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    );
  }
}
