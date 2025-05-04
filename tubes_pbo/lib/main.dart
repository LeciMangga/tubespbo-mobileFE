import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';
import 'package:get/get.dart';
import 'Utilities/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final KontakFormController formController = Get.put(KontakFormController());
    return GetMaterialApp(
      title: 'Leci Mangga Residence',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        fontFamily: 'OpenSans',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),

        ),
        dividerColor: Colors.transparent
      ),
      home: Homepage(),
    );
  }
}
