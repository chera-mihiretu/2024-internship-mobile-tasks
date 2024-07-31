import 'package:flutter/material.dart';
import 'package:intern_project/MainPage.dart';
import 'package:intern_project/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,

      ),
      debugShowCheckedModeBanner: false,
      routes: {
        MainPage.routes: (context) => const MainPage(),
        SingleProduct.routes: (context) => const SingleProduct(),
      },
      initialRoute: SingleProduct.routes,
    );
  }
}
