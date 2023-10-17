import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_planets/helper/json_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galaxy Planet"),
        centerTitle: true,
        backgroundColor: const Color(0xff242134),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              "assets/images/galaxy.jpg",
              fit: BoxFit.cover,
            ),
          ),
          FutureBuilder(
            future: JsonHelper.jsonHelper.getPlanet(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    // ListView.builder(
                    //   itemCount: snapshot.data!.length,
                    //   itemBuilder: (context, index) {
                    //     return Image.network(
                    //         "${snapshot.data![index]['image']}");
                    //   },
                    // ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CarouselSlider.builder(
                        itemCount: snapshot.data!.length,
                        options: CarouselOptions(
                            initialPage: 1,
                            autoPlay: true,
                            pageSnapping: true,
                            enableInfiniteScroll: true,
                            animateToClosest: true,
                            enlargeCenterPage: true),
                        itemBuilder: (BuildContext context, index, realIndex) {
                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed('Detail_page',
                                      arguments: snapshot.data![index]);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        const BoxShadow(
                                            color: Color(0xff242134),
                                            blurRadius: 6,
                                            spreadRadius: 3,
                                            offset: Offset(3, 2)),
                                      ]),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: 350,
                                        height: 150,
                                        child: Align(
                                          alignment: Alignment(1, 0),
                                          child: Image.network(
                                              "${snapshot.data![index]['image']}"),
                                        ),
                                      ),
                                      Text(
                                        "${snapshot.data![index]['name']}"
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Align(
                                        alignment: Alignment(-1, -0.5),
                                        child: Text(
                                          "velocity : ${snapshot.data![index]['velocity']}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(-1, 0),
                                        child: Text(
                                          "distance : ${snapshot.data![index]['distance']}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(-1, 0.5),
                                        child: Text(
                                          "position : ${snapshot.data![index]['position']}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(-1, 1),
                                        child: Text(
                                          "description : ${snapshot.data![index]['description']}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.hasError}");
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
