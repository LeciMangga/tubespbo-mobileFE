import 'package:flutter/material.dart';

import '../widgets/Appbar.dart';
import '../widgets/locationWidgets.dart';

class Locationpage extends StatefulWidget {
  const Locationpage({super.key});

  @override
  State<Locationpage> createState() => _LocationpageState();
}

class _LocationpageState extends State<Locationpage> {


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: appBar(),
        drawer: drawerMenu(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildLocationWelcome(),
              mainLocationWidget(),
            ]
          ),
        ),
      );
  }

}
