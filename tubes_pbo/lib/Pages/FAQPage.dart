import 'package:flutter/material.dart';

import '../widgets/Appbar.dart';
import '../widgets/FAQWidgets.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3ECDC),
      appBar: appBar(),
      drawer: drawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FAQWelcome(),
            buildPertanyaan(),
          ],
        ),
      ),
    );
  }
}
