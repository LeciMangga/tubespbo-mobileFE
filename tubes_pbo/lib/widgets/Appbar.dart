import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../Pages/HomePage.dart';
import '../Pages/tipe-kamar.dart';

AppBar appBar() {
  return AppBar(
    backgroundColor: Color(0xFFF3ECDC),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          color: Color(0xFF344E41),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations
              .of(context)
              .openAppDrawerTooltip,
        );
      },
    ),
  );
}

Drawer drawerMenu() {
  return Drawer(
      backgroundColor: Color(0xFFF3ECDC),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/Logo1.png"),
          ),
          ListTile(
            leading: SvgPicture.asset("assets/images/iconBeranda.svg"),
            title: Text("Beranda"),
            onTap: () {
              Get.off(() => const Homepage());
            },
          ),
          ListTile(
            leading: SvgPicture.asset("assets/images/iconTipeKamar.svg"),
            title: Text("Tipe Kamar"),
            onTap: () {
              Get.off(() => const tipeKamar());
            },
          ),
          ListTile(
            leading: SvgPicture.asset("assets/images/iconSewa.svg"),
            title: Text("Sewa Lapangan"),
            onTap: () {

            },
          ),
          ListTile(
            leading: SvgPicture.asset("assets/images/iconLokasi.svg"),
            title: Text("Lokasi"),
            onTap: () {

            },
          ),
          ListTile(
            leading: SvgPicture.asset("assets/images/iconFAQ.svg"),
            title: Text("F.A.Q"),
            onTap: () {

            },
          ),
          ListTile(
            leading: SvgPicture.asset("assets/images/iconHub.svg"),
            title: Text("Hubungi Kami"),
            onTap: () {

            },
          ),
        ],
      )
  );
}