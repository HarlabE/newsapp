import 'package:flutter/material.dart';
import 'package:newsapp/home_page.dart';
import 'package:newsapp/login.dart';
import 'package:newsapp/news_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff222847)),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
      ),
      home: Login(),
    );
  }
}
