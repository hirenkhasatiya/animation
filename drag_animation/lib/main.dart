import 'package:drag_animation/views/screens/detail_page.dart';
import 'package:drag_animation/views/screens/homePage.dart';
import 'package:drag_animation/views/screens/implicit_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: "Animation_Page",
      routes: {
        '/': (context) => HomePage(),
        'Detail_Page': (context) => DetailPage(),
        'Animation_Page': (context) => ImplicitAnimation(),
      },
    );
  }
}
