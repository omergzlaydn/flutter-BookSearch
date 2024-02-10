// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:booksearch/screens/home_page.dart';

import 'screens/home_page.dart'; // Ana sayfanın dosya yolu buraya gelmeli

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitap Arama Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(), // Ana sayfa buraya gelmeli
    );
  }
}
