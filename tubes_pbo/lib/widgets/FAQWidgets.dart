import 'dart:convert';

import 'package:flutter/material.dart';

class FAQWelcome extends StatelessWidget {
  const FAQWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          child: Image.asset('assets/images/FAQimagebg.png',fit: BoxFit.cover ,width: double.infinity,),
        ),
        Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFF344E41),
                      Color(0xDD344E41),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("PERTANYAAN UMUM",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),),
                SizedBox(height: size.height * 0.07,),
                Text("Temukan jawaban dari pertanyaan yang sering diajukan terkait kos-kosan kami",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF3ECDC),
                    fontWeight: FontWeight.w500,
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
}

class buildPertanyaan extends StatefulWidget {
  const buildPertanyaan({super.key});

  @override
  State<buildPertanyaan> createState() => BuildPertanyaanState();
}

class BuildPertanyaanState extends State<buildPertanyaan> {

  late List listPertanyaan;

  @override
  void initState(){
    super.initState();
    final jsonListPertanyaan =
    '''[
      {
       "question" : "Bagaimana cara memesan kamar di LeciMangga Residence ?",
       "answer" : "Anda dapat memesan kamar melalui halaman Tipe Kamar , memilih kamar yang diingankan, dan mengisi formulir pemesanan yang tersedia" 
      },
      {
        "question" : "Bagaimana kebijakan pembayaran pada Barat Residense ?",
        "answer" : "Pembayaran dapat dilakukan secara transfer"
      },
      {
        "question" : "Bagaimana aturan yang ada di kosan Barat Residence ?",
        "answer" : "Tidak boleh komplain"
      }
    ]''';
    listPertanyaan = jsonDecode(jsonListPertanyaan);
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
          SizedBox(height: size.height*0.1,),
          Text('PERTANYAAN YANG SERING DITANYAKAN',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: size.height*0.04,),
          Text('ADA PERTANYAAN ?\n KAMI PUNYA JAWABAN!',
            style: TextStyle(
                color: Color(0xFF588157),
                fontWeight: FontWeight.w600,
                fontSize: 26
            ),
            textAlign: TextAlign.center, ),
          SizedBox(height: size.height*0.03,),
          ...listPertanyaan.map( (QnA) => cardPertanyaan(size, context, QnA) )
        ],
      ),
    );
  }


  Container cardPertanyaan(Size size, BuildContext context, Map<String, dynamic> QnA){
        return Container(
          margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                maintainState: true,
                title: Text(QnA['question']!, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                backgroundColor: Color(0xFF6B8157),
                collapsedBackgroundColor: Color(0xFF588157),
                iconColor: Colors.white,
                collapsedIconColor: Colors.white,
                childrenPadding: EdgeInsets.zero,
                tilePadding: EdgeInsets.symmetric(horizontal: 16),
                trailing: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFA3B18A),
                  ),
                  child: Icon(Icons.expand_more, size: 28,),
                ),
                children : [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      width: double.infinity,
                      child: Text(QnA['answer']!, style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.w600),),
                    ),
                ],
              ),
            ),
          ),
        );
  }
}
