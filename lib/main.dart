import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,  //Bu kod sayfanın sağ üstündeki kırmızı banneri kaldırmak için
     theme:ThemeData(fontFamily: 'Poppins') ,
     home: HomePage()
    );
  }
}

