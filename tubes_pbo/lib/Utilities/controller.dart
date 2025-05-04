import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'api.dart';

class KontakFormController extends GetxController{
  var nama = ''.obs;
  var email = ''.obs;
  var pesan = ''.obs;
  var isLoading = false.obs;


  void updateNama(String value){
    nama.value = value;
  }

  void updateEmail(String value){
    email.value = value;
  }
  void updatePesan(String value){
    pesan.value = value;
  }

  Future<void> kirimPesan(GlobalKey<FormState> formKey) async{
    if (formKey.currentState!.validate()){
       try {
        final jsonPesan = jsonEncode({
          'nama': nama.value,
          'email': email.value,
          'pesan': pesan.value
        });
        await postPesanHubungiKami(jsonPesan);
      } on Exception catch (e) {
        Get.snackbar('Error', 'Gagal Mengirim Pesan $e');
      }
    }
  }
}
