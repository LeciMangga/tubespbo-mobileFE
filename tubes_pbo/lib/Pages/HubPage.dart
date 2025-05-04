import 'package:flutter/material.dart';

import '../widgets/Appbar.dart';
import '../widgets/HubPageWidget.dart';



class HubPage extends StatefulWidget {
  const HubPage({super.key});

  @override
  State<HubPage> createState() => _HubPageState();
}

class _HubPageState extends State<HubPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: drawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHubWelcome(),
            formKontak(),
          ],
        ),
      ),
    );
  }
}
