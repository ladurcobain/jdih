import 'package:flutter/material.dart';
import 'package:jdih/page/profile/about_page.dart';
import 'package:jdih/page/profile/legal_page.dart';
import 'package:jdih/page/profile/visionmision_page.dart';
import 'package:jdih/page/profile/organization_page.dart';
import 'package:jdih/page/profile/termcondition_page.dart';
import 'package:jdih/page/profile/faq_page.dart';

class ContactBody extends StatefulWidget {
  const ContactBody({Key? key}) : super(key: key);

  @override
  _ContactBodyPageState createState() => _ContactBodyPageState();
}

class _ContactBodyPageState extends State<ContactBody> {
  @override
  void initState() {
    super.initState();
  }

  Widget logoJdih() {
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
      child: const CircleAvatar(
        radius: 100,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage("assets/images/logo_jdih.png"),
      ),
    );
  }

  Widget titleJdih() {
    return const Text(
      "JDIH",
      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    );
  }

  Widget subtitleJdih() {
    return const Text(
      "Kementerian Agama RI",
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    );
  }

  Widget contactJdih() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Telepon'),
          subtitle: Text('(+6221) – 3811556 – 34830582'),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text('Email'),
          subtitle: Text('hkln.agama@kemenag.go.id'),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Alamat'),
          subtitle:
              Text('Jalan Lapangan Banteng Barat No. 3-4 Jakarta Pusat 10710'),
        ),
      ],
    );
  }

  Widget buttonJdih() {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            logoJdih(),
            const SizedBox(
              height: 20,
            ),
            titleJdih(),
            subtitleJdih(),
            const SizedBox(
              height: 5,
            ),
            contactJdih(),
            const SizedBox(
              height: 25,
            ),
            buttonJdih(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
