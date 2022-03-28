import 'package:flutter/material.dart';
import 'package:sneakers/product/catalog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sneakers Shop',
      home: ProductCatalogue(),
    );
  }
}
