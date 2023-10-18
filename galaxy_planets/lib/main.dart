import 'package:flutter/material.dart';
import 'package:galaxy_planets/views/screens/detailpage.dart';
import 'package:galaxy_planets/views/screens/homepage.dart';
import 'package:galaxy_planets/views/screens/splash_screen.dart';

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
      initialRoute: "Splash_screen",
      routes: {
        '/': (context) => HomePage(),
        'Splash_screen': (context) => splashscreen(),
        'Detail_page': (context) => DetailsPage(),
      },
    );
  }
}
