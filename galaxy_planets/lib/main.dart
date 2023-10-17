import 'package:flutter/material.dart';
import 'package:galaxy_planets/views/screens/detailpage.dart';
import 'package:galaxy_planets/views/screens/homepage.dart';

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
      initialRoute: "/",
      routes: {
        '/': (context) => HomePage(),
        'Detail_page': (context) => DetailsPage(),
      },
    );
  }
}
