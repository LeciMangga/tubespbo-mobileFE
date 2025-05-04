import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../Pages/tipe-kamar.dart';

Container buildPesanSekarang(Size size) {
  return Container(
    width: size.width,
    height: size.height * 0.5,
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.05),
    child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assets/images/cozyKosKosan.jpg', fit: BoxFit.cover,),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [Color(0xED344E41),Color(0x89344E41),Color(0x45000000)])
              ),
            ),
          ),
          Positioned.fill(
            top: size.height * 0.07,
            left: size.width * 0.05,
            right: size.width * 0.05,
            child: Column(
              children: [
                Text('TEMPATI KOS TERBAIK SESUAI IMPIAN ANDA DI LECI MANGGA RESIDENCE',
                  style: TextStyle(
                    color: Color(0xFFF3ECDC),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.02,),
                Text('Tersedia banyak kamar kos-kosan terbaik yang siap Anda tempati',
                  style: TextStyle(
                      color: Color(0xFFF3ECDC),
                      fontWeight: FontWeight.w300,
                      fontSize: 14
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.04,),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF588157),
                  ),
                  child: Text('PESAN SEKARANG', style: TextStyle(color: Color(0xFFF3ECDC),fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 0.7),),
                ),
              ],
            ),
          ),
        ]
    ),
  );
}

Container buildTestimoni(
    Size size,
    List<Map<String, String>> testimoni,
    CarouselSliderController testimoniCarouselController,
    int currentTestimoni,
    void Function(int) onPageChanged,
    ) {
  return Container(
    width: size.width,
    padding: EdgeInsets.symmetric(vertical: size.height * 0.05, horizontal: size.width * 0.05),
    decoration: BoxDecoration(
        color: Color(0xFF344E41)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('FASILITAS UMUM',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFFA3B18A)),),
        Text('TESTIMONI PENGHUNI LECI MANGGA RESIDENCE',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFFF3ECDC), fontWeight: FontWeight.w600, fontSize: 24),),
        SizedBox(height: size.height * 0.05,),
        CarouselSlider.builder(
          carouselController: testimoniCarouselController,
          itemCount: testimoni.length,
          itemBuilder: (context,index,realindex){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(testimoni[index]['nama'] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
                ),
                Text(testimoni[index]['role'] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                ),
                SizedBox(height: size.height * 0.05,),
                Text(testimoni[index]['text'] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontStyle: FontStyle.italic, fontSize: 14),
                )
              ],
            );
          },
          options: CarouselOptions(
              viewportFraction: 1,
              enableInfiniteScroll: false,
              autoPlay: true,
              onPageChanged: (index, reason) {
                onPageChanged(index);
              }
          ),
        ),
      ],
    ),
  );
}

Padding buildKeunggulan(Size size, List<Map<String, String>> keunggulan) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.05),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('KEUNGGULAN YANG KAMI BERIKAN',
          style: TextStyle(
            color: Color(0xFF588157),
            letterSpacing: 0.35,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        Text('KEUNGGULAN LECI MANGGA RESIDENCE',
          style: TextStyle(
              color: Color(0xFF2D2D2D),
              fontWeight: FontWeight.bold,
              fontSize: 24
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.04,),
        ...keunggulan.map((item) =>
            Container(
              width: size.width * 0.8,
              height: size.height * 0.4,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.04),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF344E41),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withValues(),
                        blurRadius: 15,
                        offset: Offset(5, 10)
                    ),
                  ]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF3ECDC),
                    ),
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(9),
                    child: ClipOval(
                      child: Image.asset(item['gambar'] as String, fit: BoxFit.cover,),
                    ),
                  ),
                  Text(item['title'] as String,
                    style: TextStyle(
                      color: Color(0xFFF3ECDC),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 14,),
                  Text(item['text'] as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    ),
                  )
                ],
              ),
            )
        ),


      ],
    ),
  );
}

Padding buildFasilitas(
    Size size,
    List<Map<String, String>> fasilitas,
    CarouselSliderController imageCarouselController,
    int currentImage,
    void Function(int) onPageChanged,
    ) {
  final imageList = [
    'assets/images/toilet.jpeg',
    'assets/images/parkiran.jpeg',
    'assets/images/lobby.jpeg',
    'assets/images/relax.jpeg',
  ];
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.05, child: Container(),),
        Text("FASILITAS UMUM",
          style: TextStyle(
              color: Color(0xFF588157),
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.7,
              height: 3
          ),
          textAlign: TextAlign.left,
        ),
        Text('BERAGAM FASILITAS LENGKAP\n'
            'UNTUK MENDUKUNG KENYAMANAN\n'
            'DAN KEBUTUHAN ANDA DI BARAT \n'
            'RESIDENCE',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18
          ),
        ),
        SizedBox(height: size.height * 0.01,),
        ...fasilitas.map((item) =>
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              child: Row(
                children: [
                  SvgPicture.asset(item['icon'] as String,
                    colorFilter: ColorFilter.mode(
                        Color(0xFF588157), BlendMode.srcIn),),
                  SizedBox(width: size.width * 0.05,),
                  Text(item['text'] as String, style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),)
                ],
              ),
            )
        ),
        SizedBox(height: size.height * 0.07,),
        Stack(
          children: [
            CarouselSlider.builder(
                carouselController: imageCarouselController,
                itemCount: imageList.length,
                itemBuilder: (context, index, realIndex){
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(imageList[index],fit: BoxFit.cover,width: double.infinity,),
                  );
                },
                options: CarouselOptions(
                    height: size.height * 0.32,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                    onPageChanged: (index, reason){
                      onPageChanged(index);
                    }
                )
            ),
            Positioned(
              bottom: size.height * 0.01,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry){
                  return Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentImage == entry.key ? Color(0xFF588157) : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
        SizedBox(height: size.height * 0.1,)
      ],
    ),
  );
}

Stack buildWelcome(Size size) {
  return Stack(
    children: [
      ClipRRect(child: Image.asset("assets/images/bgHomepage.png", fit: BoxFit.cover,height: size.height * 0.8,)),
      Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF344E41),
                    Color(0x00121B12)
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter
              ),
            ),
          )
      ),
      Positioned.fill(
        top: size.height * 0.2,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("TEMPATNNYA SEWA KOS-KOSAN",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: 2.25),),
              Text("TERBAIK DI BOJONGSOANG",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: 2.25),),
              SizedBox(height: size.height * 0.02,),
              Text("Selamat Datang di",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),),
              SizedBox(height: size.height * 0.01,),
              Text("LeciMangga Residence",
                style: TextStyle(
                    color: Color(0xFFF6DFAA),
                    fontWeight: FontWeight.w600,
                    fontSize: 30
                ),),
              SizedBox(height: size.height * 0.03,),
              Text("Tempat Tinggal Nyaman Dan Strategis Di Dekat",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              Text("Telkom University",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              ElevatedButton(
                  onPressed: () {
                    Get.off(() => const tipeKamar());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF588157),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(size.width * 0.85, size.height * 0.07)
                  ),
                  child: Text('LIHAT KAMAR',
                      style: TextStyle(
                          color: Color(0xFFF3ECDC),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.25
                      )
                  )
              ),
              SizedBox(height: size.height * 0.02,),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF3ECDC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(size.width * 0.85, size.height * 0.07)
                  ),
                  child: Text('PESAN SEKARANG',
                      style: TextStyle(
                          color: Color(0xFF588157),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.25
                      )
                  )
              )
            ],
          ),
        ),
      )
    ],
  );
}