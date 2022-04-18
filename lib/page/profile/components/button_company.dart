import 'package:flutter/material.dart';
import 'package:jdih/page/profile/about_page.dart';
import 'package:jdih/page/profile/legal_page.dart';
import 'package:jdih/page/profile/visionmision_page.dart';
import 'package:jdih/page/profile/organization_page.dart';
import 'package:jdih/page/profile/termcondition_page.dart';
import 'package:jdih/page/profile/faq_page.dart';

class ButtonCompany extends StatelessWidget {
  const ButtonCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AboutPage(title: "Tentang Kami"),
              ),
            );
          },
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)) +
              Border.all(color: Colors.black),
          selected: true,
          selectedTileColor: Colors.grey[200],
          title: const Text(
            "TENTANG KAMI",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          dense: false,
        ),
        const SizedBox(
          height: 5,
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LegalPage(title: "Dasar Hukum"),
              ),
            );
          },
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)) +
              Border.all(color: Colors.black),
          selected: true,
          selectedTileColor: Colors.grey[200],
          title: const Text(
            "DASAR HUKUM",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          dense: false,
        ),
        const SizedBox(
          height: 5,
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const VisionmisionPage(title: "Visi Misi"),
              ),
            );
          },
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)) +
              Border.all(color: Colors.black),
          selected: true,
          selectedTileColor: Colors.grey[200],
          title: const Text(
            "VISI MISI",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          dense: false,
        ),
        const SizedBox(
          height: 5,
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const OrganizationPage(title: "Struktur Organisasi"),
              ),
            );
          },
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)) +
              Border.all(color: Colors.black),
          selected: true,
          selectedTileColor: Colors.grey[200],
          title: const Text(
            "STRUKTUR ORGANISASI",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          dense: false,
        ),
        const SizedBox(
          height: 5,
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const TermconditionPage(title: "Prasyarat"),
              ),
            );
          },
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)) +
              Border.all(color: Colors.black),
          selected: true,
          selectedTileColor: Colors.grey[200],
          title: const Text(
            "PRASYARAT",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          dense: false,
        ),
        const SizedBox(
          height: 5,
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FaqPage(title: "F.A.Q"),
              ),
            );
          },
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)) +
              Border.all(color: Colors.black),
          selected: true,
          selectedTileColor: Colors.grey[200],
          title: const Text(
            "F.A.Q",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          dense: false,
        ),
      ],
    );
  }
}
