import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color Mycolor = Colors.grey;

  List fruitsimages = [
    "apple",
    "banana",
    "blueberry",
    "lemon",
    "orange",
    "pineapele",
    "strwberry",
    "watermelon",
  ];

  Random r = Random();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Drag & Animation",
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Opacity(
              opacity: 0.4,
              child: Image.asset(
                "assets/images/fruits/bgf.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text("LEVEL : ${index + 1}",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo.shade900)),
                SizedBox(
                  height: 100,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: fruitsimages
                        .map(
                          (e) => LongPressDraggable(
                            data: e,
                            childWhenDragging: Container(),
                            feedback: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "${e.toString().toUpperCase()}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(4),
                              child: Text(
                                "${e.toString().toUpperCase()}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Spacer(),
                DragTarget(
                  onAccept: (data) {
                    setState(() {
                      Mycolor = Colors.transparent;
                    });
                    Navigator.of(context)
                        .pushNamed("Detail_Page", arguments: data);
                    Mycolor = Colors.grey;
                    if (index < 7) {
                      index += 1;
                    }
                  },
                  onWillAccept: (data) {
                    return data == fruitsimages[index];
                  },
                  builder: (context, _, __) {
                    return Stack(
                      children: [
                        Hero(
                          tag: "fruit",
                          child: Image.asset(
                            "assets/images/fruits/${fruitsimages[index]}.png",
                          ),
                        ),
                        Image.asset(
                          "assets/images/fruits/${fruitsimages[index]}.png",
                          color: Mycolor,
                        ),
                      ],
                    );
                  },
                ),
              ],
            )
          ],
        ));
  }
}
