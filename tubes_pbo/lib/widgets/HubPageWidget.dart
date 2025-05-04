import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utilities/controller.dart';


class buildHubWelcome extends StatefulWidget {
  const buildHubWelcome({super.key});

  @override
  State<buildHubWelcome> createState() => _buildHubWelcomeState();
}

class _buildHubWelcomeState extends State<buildHubWelcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          child: Image.asset('assets/images/mobilYnto.jpeg',fit: BoxFit.cover ,width: double.infinity,),
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
                Text("INFORMASI KONTAK",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),),
                SizedBox(height: size.height * 0.07,),
                Text("Kami siap membantu Anda. Jangan ragu untuk menghubungi kami melalui kontak atau form di bawah ini.",
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

class formKontak extends StatefulWidget {
  const formKontak({super.key});

  @override
  State<formKontak> createState() => _formKontakState();
}

class _formKontakState extends State<formKontak> {

  final kontakFormKey = GlobalKey<FormState>();
  final KontakFormController kontakFormController = Get.find<KontakFormController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xFFF3ECDC),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Text('HUBUNGI KAMI', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 22), textAlign: TextAlign.start,),
          SizedBox(height: 20,),
          Form(
            key: kontakFormKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Nama Lengkap Anda',
                      labelText: 'Nama',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:BorderSide(color: Colors.grey),
                      ),
                    ),
                    onChanged: (value) => kontakFormController.updateNama(value),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Name required';
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 35,),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Alamat Email Anda',
                        labelText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:BorderSide(color: Colors.grey),
                        ),
                      ),
                      onChanged: (value) => kontakFormController.updateEmail(value),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Email required';
                        }
                        if (!RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(value)){
                          return 'Enter a valid email';
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 35,),
                  SizedBox(
                    height: 135,
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      maxLines: 100 ~/ 20,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Tuliskan Pesan Anda disini',
                        labelText: 'Pesan',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        alignLabelWithHint: true,
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:BorderSide(color: Colors.grey),
                        ),
                      ),
                      onChanged: (value) => kontakFormController.updatePesan(value),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Pesan required';
                        }
                        return null;
                      }
                    ),
                  ),
                ],
              )
          ),
          SizedBox(height: 16,),
          Text('Kami akan merespons pesan Anda secepat mungkin Terima kasih telah menghubungi kami!', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 12),),
          SizedBox(height: 16,),
          Obx(() => SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF588157),
                foregroundColor: Colors.white,
                elevation: 4,
                shadowColor: Colors.black.withAlpha(50),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )
              ),
              onPressed: kontakFormController.isLoading.value ? null : () => kontakFormController.kirimPesan(kontakFormKey),
              child: kontakFormController.isLoading.value ? CircularProgressIndicator(color: Colors.white,) : Text('Kirim Pesan')
            ),
          )
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 25),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alamat',style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.w600)),
                Text('TULT',style: TextStyle(color: Colors.black,fontSize: 13, fontWeight: FontWeight.w400),),
                Text('WhatsApp',style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.w600)),
                Text('Chat dengan kami langsung melalui \n WhatsApp\nDapnek - +62-813-1234-5678\nRio - +62-811-4564-8787',style: TextStyle(color: Colors.black,fontSize: 13, fontWeight: FontWeight.w400),),
                Text('Email',style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.w600)),
                Text('Email kami di',style: TextStyle(color: Colors.black,fontSize: 13, fontWeight: FontWeight.w400),),
                Text('lecimanggaresidence@gmail.com',style: TextStyle(color: Color(0xFF344E41),fontSize: 13, fontWeight: FontWeight.w400),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


