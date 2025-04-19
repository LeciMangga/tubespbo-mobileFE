import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Stack buildWelcomeTipeKamar(Size size){
  return Stack(
    children: [
      ClipRRect(child: Image.asset('assets/images/kamar.jpg', width: double.infinity,fit: BoxFit.cover,)),
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
        left: size.width * 0.1,
        right: size.width * 0.1,
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
              Text("TIPE KAMAR",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),),
              SizedBox(height: size.height * 0.07,),
              Text("Segera pilih daftar kamar sesuai impian anda di bawah ini.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Column buildFilterSearch(Size size, void Function(String?) onChangedDropDown, String? selectedHarga){
  final List<String> listHarga = [
    '0-1 juta',
    '1-2 juta',
    '2 juta ke atas'
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: size.width * 0.01,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.005),
            decoration: BoxDecoration(
              color: Color(0xFFFFFBF2),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              children : [
                SvgPicture.asset(
                  'assets/images/paid.svg',
                  colorFilter: ColorFilter.mode(Color(0xFFA3B18A),BlendMode.srcIn),
                ),
                SizedBox(width: size.width * 0.02,),
                DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    value: selectedHarga,
                    hint: Text('Pilih Harga'),
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.black,),
                    items: listHarga.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,style: TextStyle(fontSize: 10),),
                      );
                    }).toList(),
                    onChanged: (value) => onChangedDropDown(value),
                    ),
                ),
              ]
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.005),
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.01),
            decoration: BoxDecoration(
                color: Color(0xFFFFFBF2),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
                children : [
                  SvgPicture.asset(
                    'assets/images/bed.svg',
                    colorFilter: ColorFilter.mode(Color(0xFFA3B18A),BlendMode.srcIn),
                    height: size.height * 0.03,
                  ),
                  SizedBox(width: size.width * 0.02,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedHarga,
                      hint: Text('Pilih Luas Kamar',style: TextStyle(fontSize: 10),),
                      icon: Icon(Icons.keyboard_arrow_down, color: Colors.black,),
                      items: listHarga.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item,style: TextStyle(fontSize: 10),),
                        );
                      }).toList(),
                      onChanged: (value) => onChangedDropDown(value),
                    ),
                  ),
                ]
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.005),
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.01),
            decoration: BoxDecoration(
                color: Color(0xFFFFFBF2),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
                children : [
                  SvgPicture.asset(
                    'assets/images/profile-user.svg',
                    colorFilter: ColorFilter.mode(Color(0xFFA3B18A),BlendMode.srcIn),
                    height: size.height * 0.03,
                  ),
                  SizedBox(width: size.width * 0.02,),

                ]
            ),
          )
        ],
      ),
      SizedBox(height: size.height * 0.1,)
    ],
  );
}