import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    confettiController = ConfettiController(
      duration: Duration(seconds: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;

    confettiController.play();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: confettiController,
                blastDirection: pi / 2,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: ConfettiWidget(
                confettiController: confettiController,
                blastDirection: pi / 2,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: ConfettiWidget(
                confettiController: confettiController,
                blastDirection: pi / 2,
              ),
            ),
            Text(
              "CORRECT IT'S : ${data.toUpperCase()}",
              style: TextStyle(fontSize: 30),
            ),
            Hero(
                tag: "fruit",
                child: Image.asset("assets/images/fruits/${data}.png")),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("NEXT LEVEL"),
            ),
          ],
        ),
      ),
    );
  }
}
