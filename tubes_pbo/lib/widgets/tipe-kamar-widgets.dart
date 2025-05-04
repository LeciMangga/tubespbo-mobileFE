import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utilities/api.dart';

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


class buildFilterSearch extends StatefulWidget {
  const buildFilterSearch({super.key});

  @override
  State<buildFilterSearch> createState() => _buildFilterSearchState();
}

class _buildFilterSearchState extends State<buildFilterSearch> {
  int jumlahOrang = 0;
  String? selectedHarga;
  String? selectedKamar;

  @override
  Widget build(BuildContext context) {

    final listHarga = [
      '0-1 juta',
      '1-2 juta',
      '2 juta ke atas'
    ];
    final listKamar = [
      'token',
      'non-token',
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Column(
        spacing: 5,
        children: [
          Row(
            spacing: 5,
            children: [
              _buildDropdown(
                icon: Icons.attach_money,
                hintTxt: "Pilih Harga",
                listItem : listHarga,
                value: selectedHarga,
                selected: selectedHarga,
                onChangedValue: (String? value){
                  setState(() {
                    selectedHarga = value;
                  });
                }
              ),
              _buildDropdown(
                  icon: Icons.bed_rounded,
                  hintTxt: 'Jenis kos',
                  value: selectedKamar,
                  selected: selectedKamar,
                  listItem: listKamar,
                onChangedValue: (String? value){
                  setState(() {
                    selectedKamar = value;
                  });
                }
              ),
            ],
          ),
          Row(
            spacing: 5,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFBF2),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Icon(Icons.people_alt),
                    SizedBox(width: 5,),
                    GestureDetector(
                      child: Icon(Icons.remove_circle_outline),
                      onTap: () {
                        setState(() {
                          jumlahOrang--;
                          if (jumlahOrang < 0){
                            jumlahOrang = 0;
                          }
                        });
                      },
                    ),
                    SizedBox(width: 4,),
                    Text(jumlahOrang.toString(),style: TextStyle(color: Colors.black, fontSize: 15),),
                    SizedBox(width: 4,),
                    GestureDetector(
                      child: Icon(Icons.add_circle_outline),
                      onTap: () {
                        setState(() {
                          jumlahOrang++;
                          if (jumlahOrang >= 3) {
                            jumlahOrang = 3;
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    //search();
                    },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF588157),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search,color: Color(0xFFA3B18A),),
                        SizedBox(width: 7,),
                        Text("Cari",style: TextStyle(color: Color(0xFFF3ECDC)),)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required IconData icon,
    required String hintTxt,
    required String? value,
    required List<String> listItem,
    required String? selected,
    required void Function(String?) onChangedValue,
  }){
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFBF2),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 7,),
              DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text(hintTxt),
                    value: selected,
                      items: listItem.map((String item){
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item,style: TextStyle(fontSize: 15),),
                        );
                      }).toList(),
                      onChanged: onChangedValue,
                  ),
              )
            ],
          ),
      ),
    );
  }

}


class buildDetailKamar extends StatefulWidget {
  const buildDetailKamar({super.key});

  @override
  State<buildDetailKamar> createState() => buildDetailKamarState();
}

class KamarController extends GetxController{
  var ListKamar = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDataKamar();
  }

  Future<void> loadDataKamar() async{
    final responseListKamar = await getAllKamar();
    ListKamar.value = List<Map<String, dynamic>>.from(jsonDecode(responseListKamar ));
  }
}

class buildDetailKamarState extends State<buildDetailKamar> {

  final KamarController controller = Get.put(KamarController());


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() => Column(
      children: controller.ListKamar.map((kamar) => buildCardKamar(size,kamar)).toList(),
    ));
  }

  Container buildCardKamar(Size size, Map<String,dynamic> kamar) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.width * 0.05),
      margin: EdgeInsets.symmetric(horizontal: size.width *0.1,vertical: size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(kamar['imagePath'].toString(), fit: BoxFit.cover, width: double.infinity,),
                ),
                buildStatus(kamar),
              ],
            ),
          ),

          SizedBox(height: 10,),
          Text(kamar['jenisKamar'].toString(), textAlign: TextAlign.start,style: TextStyle(color: Color(0xFF073937), fontWeight: FontWeight.w600, fontSize: 24),),
          Text(kamar['desc'].toString(), style: TextStyle(color: Color(0xFF073937), fontWeight: FontWeight.w400, fontSize: 10),),
          Text('Fasilitas Kamar', style: TextStyle(color: Color(0xFF073937), fontWeight: FontWeight.w600, fontSize: 15),),
          Text(kamar['fasilitas'].toString(), style: TextStyle(color: Color(0xFF073937), fontWeight: FontWeight.w400, fontSize: 11),),
          Text('Harga', style: TextStyle(color: Color(0xFF073937), fontWeight: FontWeight.w600, fontSize: 15),),
          ...List.generate(kamar['maxOrang'] as int, (index){
            final List hargaList = kamar['harga'] as List;
            final harga = hargaList[index];
            print('$index dan $harga');
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${index + 1} Orang', style: TextStyle(color: Colors.black)),
                  Text('Mulai Rp.${harga.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')}',
                      style: TextStyle(color: Colors.black)),
                ],
              )
            );
          })
        ],
      ),
    );
  }

  Container buildStatus(Map<String, dynamic> kamar) {
    if (kamar['status'] == true) {
      return Container(
        decoration: BoxDecoration(
          color: Color(0xFF588157),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
        ),
        child: Padding(padding: EdgeInsets.all(5),child: Text('Tersedia', style: TextStyle(fontSize: 10, color: Color(0xFFF3ECDC), fontWeight: FontWeight.w600),)),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Color(0xFFC63636),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
        ),
        child: Padding(padding: EdgeInsets.all(5),child: Text('Penuh', style: TextStyle(fontSize: 10, color: Color(0xFFF3ECDC), fontWeight: FontWeight.w600),)),
      );
    }

  }
}



