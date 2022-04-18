import 'package:flutter/material.dart';

class LogoCompany extends StatelessWidget {
  final String str;
  LogoCompany({Key? key, required this.str}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      /*
        child: CircleAvatar(
            child: Image.network(
          str,
          fit: BoxFit.scaleDown,
        ),
        */

      child: const CircleAvatar(
        radius: 100,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage("assets/images/logo_jdih.png"),
      ),
    );
  }
}
