import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/homePageWidgets.dart';
import '../widgets/Appbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePage();
}

class _HomePage extends State<Homepage> {
  int currentImage = 0;
  int currentTestimoni = 0;
  final CarouselSliderController imageCarouselController = CarouselSliderController();
  final CarouselSliderController testimoniCarouselController = CarouselSliderController();


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    final fasilitas = [
      {'icon': 'assets/images/parking.svg', 'text': 'Tempat Parkir'},
      {'icon': 'assets/images/ruangBersama.svg', 'text': 'Ruang Bersama'},
      {'icon': 'assets/images/dapurUmum.svg', 'text': 'Dapur Umum'},
      {'icon': 'assets/images/cctv.svg', 'text': 'CCTV'},
      {'icon': 'assets/images/wifi.svg', 'text': 'Wi-Fi'},
      {'icon': 'assets/images/kasur.svg', 'text': 'Sprei 1x (Di Awal Masuk)'},
      {'icon': 'assets/images/penjaga.svg', 'text': 'Penjaga Kos 24 Jam'},
      {'icon': 'assets/images/baju.svg', 'text': 'Jemuran'},
    ];
    final keunggulan = [
      {'gambar' : 'assets/images/location.jpg',
        'title' : 'Lokasi Strategis',
        'text' : 'Terletak di pusat kota yang mudah diakses, dekat dengan kampus dan fasilitas umum lainnya'
      },
      {'gambar' : 'assets/images/money.jpg',
        'title' : 'Harga Terjangkau',
        'text' : 'Menawarkan hunian berkualitas dengan harga yang pas di kantong, cocok untuk mahasiswa dan pekerja'
      },
      {'gambar' : 'assets/images/facility-icon.jpg',
        'title' : 'Fasilitas Lengkap',
        'text' : 'Dilengkapi dengan berbagai fasilitas modern untuk memenuhi kebutuhan harian Anda dengan mudah'
      },
    ];
    final testimoni = [
      {'nama': 'Wijaya Pratama',
        'role' : 'Mahasiswa Telkom University',
        'text' : '"Tinggal di Leci Mangga Residence sangat nyaman. Suasananya adem, interiornya bagus, sangat strategis karena dekat dengan kampus."'
      },
      {'nama': 'Muhammad Sulthan Zaki',
        'role' : 'Mahasiswa Tel-U',
        'text' : '"Tinggal di Leci Mangga Residence nggak nyaman. Sering Banjir dan banyak lonte ."'
      }
    ];
    return Scaffold(
      backgroundColor: Color(0xFFF3ECDC),
      appBar: appBar(),
      drawer: drawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildWelcome(size),
            buildFasilitas(size, fasilitas, imageCarouselController, currentImage,
                    (index){
                  setState(() {
                    currentImage = index;
                  });
                }
            ),
            buildKeunggulan(size, keunggulan),
            buildTestimoni(size, testimoni, testimoniCarouselController, currentTestimoni,
                    (index){
                  setState(() {
                    currentTestimoni = index;
                  });
                }
            ),
            buildPesanSekarang(size),
          ],
        ),
      ),

    );
  }




}