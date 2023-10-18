import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_planets/helper/json_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late AnimationController controller;

late Animation<double> animation;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    );
    controller.forward();
    controller.repeat();
  }

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
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.30, -1.1),
                          child: Container(
                            height: 100,
                            width: 125,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onLongPress: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      color: Color(0xff242134)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                              '${snapshot.data![8]["image"]}'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${snapshot.data![8]["name"]}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "position : ${snapshot.data![8]["position"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "description : ${snapshot.data![8]["description"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Image.network(
                                "${snapshot.data![8]['image']}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 60,
                          width: 100,
                          height: 100,
                          child: RotationTransition(
                            alignment: const Alignment(-1.50, -1.50),
                            turns: animation = CurvedAnimation(
                              parent: controller,
                              curve: Curves.linear,
                            ),
                            child: GestureDetector(
                              onLongPress: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      color: Color(0xff242134)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                              '${snapshot.data![7]["image"]}'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${snapshot.data![7]["name"]}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "position : ${snapshot.data![7]["position"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "description : ${snapshot.data![7]["description"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${snapshot.data![7]['image']}")),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 110,
                          left: 110,
                          width: 100,
                          height: 100,
                          child: RotationTransition(
                            alignment: const Alignment(-3.50, -5.50),
                            turns: animation = CurvedAnimation(
                              parent: controller,
                              curve: Curves.linear,
                            ),
                            child: GestureDetector(
                              onLongPress: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      color: Color(0xff242134)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                              '${snapshot.data![6]["image"]}'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${snapshot.data![6]["name"]}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "position : ${snapshot.data![6]["position"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "description : ${snapshot.data![6]["description"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${snapshot.data![6]['image']}")),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 160,
                          left: 130,
                          width: 100,
                          height: 100,
                          child: RotationTransition(
                            alignment: const Alignment(-6.50, -7.50),
                            turns: animation = CurvedAnimation(
                              parent: controller,
                              curve: Curves.linear,
                            ),
                            child: GestureDetector(
                              onLongPress: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      color: Color(0xff242134)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                              '${snapshot.data![5]["image"]}'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${snapshot.data![5]["name"]}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "position : ${snapshot.data![5]["position"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "description : ${snapshot.data![5]["description"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${snapshot.data![5]['image']}")),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          left: 210,
                          width: 100,
                          height: 100,
                          child: RotationTransition(
                            alignment: const Alignment(-8.30, -10.10),
                            turns: animation = CurvedAnimation(
                              parent: controller,
                              curve: Curves.linear,
                            ),
                            child: GestureDetector(
                              onLongPress: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      color: Color(0xff242134)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                              '${snapshot.data![4]["image"]}'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${snapshot.data![4]["name"]}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "position : ${snapshot.data![4]["position"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "description : ${snapshot.data![4]["description"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${snapshot.data![4]['image']}")),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 230,
                          left: 210,
                          width: 100,
                          height: 100,
                          child: RotationTransition(
                            alignment: const Alignment(-12.50, -13.0),
                            turns: animation = CurvedAnimation(
                              parent: controller,
                              curve: Curves.linear,
                            ),
                            child: GestureDetector(
                              onLongPress: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      color: Color(0xff242134)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                              '${snapshot.data![3]["image"]}'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${snapshot.data![3]["name"]}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "position : ${snapshot.data![3]["position"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "description : ${snapshot.data![3]["description"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${snapshot.data![3]['image']}")),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 250,
                          left: 240,
                          width: 100,
                          height: 100,
                          child: RotationTransition(
                            alignment: const Alignment(-15.0, -16.50),
                            turns: animation = CurvedAnimation(
                              parent: controller,
                              curve: Curves.linear,
                            ),
                            child: GestureDetector(
                              onLongPress: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      color: Color(0xff242134)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                              '${snapshot.data![2]["image"]}'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${snapshot.data![2]["name"]}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "position : ${snapshot.data![2]["position"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "description : ${snapshot.data![2]["description"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${snapshot.data![2]['image']}")),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 310,
                          left: 300,
                          width: 100,
                          height: 100,
                          child: RotationTransition(
                            alignment: const Alignment(-18.50, -19.50),
                            turns: animation = CurvedAnimation(
                              parent: controller,
                              curve: Curves.linear,
                            ),
                            child: GestureDetector(
                              onLongPress: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      color: Color(0xff242134)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                              '${snapshot.data![1]["image"]}'),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${snapshot.data![1]["name"]}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "position : ${snapshot.data![1]["position"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "description : ${snapshot.data![1]["description"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${snapshot.data![1]['image']}")),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 370,
                          left: 350,
                          width: 100,
                          height: 100,
                          child: RotationTransition(
                            alignment: const Alignment(-21.50, -24.50),
                            turns: animation = CurvedAnimation(
                              parent: controller,
                              curve: Curves.linear,
                            ),
                            child: GestureDetector(
                              onLongPress: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      color: Color(0xff242134)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                              '${snapshot.data![0]["image"]}'),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${snapshot.data![0]["name"]}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "position : ${snapshot.data![0]["position"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "description : ${snapshot.data![0]["description"]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${snapshot.data![0]['image']}")),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          FutureBuilder(
              future: JsonHelper.jsonHelper.getPlanet(),
              builder: (ctx, snapshot) {
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
                              aspectRatio: 10 / 3,
                              enlargeCenterPage: true),
                          itemBuilder:
                              (BuildContext context, index, realIndex) {
                            return Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        'Detail_page',
                                        arguments: snapshot.data![index]);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
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
                                            alignment: const Alignment(1, 0),
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
                                          alignment: const Alignment(-1, 0),
                                          child: Text(
                                            "position : ${snapshot.data![index]['position']}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Align(
                                          alignment: const Alignment(-1, 1),
                                          child: Text(
                                            "distance : ${snapshot.data![index]['distance']}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
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
                  return Text("Error:${snapshot.error}");
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}
