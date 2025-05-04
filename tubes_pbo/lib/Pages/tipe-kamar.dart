import 'package:flutter/material.dart';

import '../widgets/Appbar.dart';
import '../widgets/tipe-kamar-widgets.dart';

class tipeKamar extends StatefulWidget {
  const tipeKamar({super.key});

  @override
  State<tipeKamar> createState() => _tipeKamarState();
}

class _tipeKamarState extends State<tipeKamar> {

  String? selectedHarga;
  String? selectedKamar;
  int jumlahOrang = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Color(0xFFF3ECDC),
      appBar: appBar(),
      drawer: drawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildWelcomeTipeKamar(size),
            buildFilterSearch(),
            buildDetailKamar(),
          ],
        ),
      ),
    );
  }
}
