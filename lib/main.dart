import 'package:flutter/material.dart';
import 'package:p6_katalogwisata/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: 'katalog wisata',
      debugShowCheckedModeBanner: false,
    );
  }
}
