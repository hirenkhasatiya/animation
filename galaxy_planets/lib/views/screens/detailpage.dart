import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("${data['name']}"),
        centerTitle: true,
        backgroundColor: const Color(0xff242134),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              "assets/images/galaxy.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.network("${data['image']}"),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "position : ${data['position']}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${data['description']}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
