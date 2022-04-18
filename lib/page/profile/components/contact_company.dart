import 'package:flutter/material.dart';
import 'package:jdih/helper/func.dart';

import '../model.dart';

// ignore: must_be_immutable
class ContactCompany extends StatelessWidget {
  Result? dataResult;
  ContactCompany({Key? key, required this.dataResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          leading: const Icon(Icons.phone),
          title: const Text('Telepon'),
          subtitle: Text(dataResult!.companyPhone.toString()),
        ),
        ListTile(
          leading: const Icon(Icons.email),
          title: const Text('Email'),
          subtitle: Text(dataResult!.companyEmail.toString()),
        ),
        ListTile(
          leading: const Icon(Icons.location_on),
          title: const Text('Alamat'),
          subtitle:
              Text(regHtmlWithSpace(dataResult!.companyAddress.toString())),
        ),
      ],
    );
  }
}
