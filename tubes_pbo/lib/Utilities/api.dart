import 'package:http/http.dart' as http;

import 'const.dart';
import 'package:get/get.dart';
import 'controller.dart';

Future<String> getAllKamar() async {
  var url = Uri.http(backendServerIP, '/kamar');
  var response = await http.get(url);

  if (response.statusCode == 200){
   return response.body;
  }
  return '';
}

Future<void> postPesanHubungiKami(String jsonEncodedPesan) async{
  final KontakFormController kontakFormController = Get.find<KontakFormController>();
  kontakFormController.isLoading.value = true;
  try {
    var url = Uri.http(backendServerIP, '/tesAPI');
    final response = await http
        .post(
          url,
          headers: {'Content-type': 'application/json'},
          body: jsonEncodedPesan,
        )
        .timeout(
          const Duration(seconds: 1),
          onTimeout: () {throw Exception('Request timeout');}
        );
    if (response.statusCode == 200) {
      Get.snackbar('Berhasil', 'Pesan Berhasil dikirim');
    } else {
      Get.snackbar('Gagal', 'Pesan gagal dikirim : ${response.statusCode}');
    }
  } catch (e){
    Get.snackbar('Error', 'Terjadi kesalahan sistem : ${e}');
  } finally{
    kontakFormController.isLoading.value = false;
  }
}

