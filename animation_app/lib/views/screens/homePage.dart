import 'dart:math';
import 'package:animation_app/controller/game_controller.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ConfettiController confettiController;

  List<String> displayO = ["", "", "", "", "", "", "", "", "", ""];

  bool turn = true;

  int scorex = 0;
  int scoreo = 0;

  ontapped(int index) {
    setState(() {
      if (turn && displayO[index] == '') {
        displayO[index] = "o";
      } else if (!turn && displayO[index] == '') {
        displayO[index] = "X";
      }
      turn = !turn;
      checkWinner();
    });
  }

  checkWinner() {
    if (displayO[0] == displayO[1] &&
        displayO[0] == displayO[2] &&
        displayO[0] != '') {
      showWinDialog(displayO[0]);
    }
    if (displayO[3] == displayO[4] &&
        displayO[3] == displayO[5] &&
        displayO[3] != '') {
      showWinDialog(displayO[3]);
    }
    if (displayO[6] == displayO[7] &&
        displayO[6] == displayO[8] &&
        displayO[6] != '') {
      showWinDialog(displayO[6]);
    }
    if (displayO[0] == displayO[3] &&
        displayO[0] == displayO[6] &&
        displayO[0] != '') {
      showWinDialog(displayO[0]);
    }
    if (displayO[1] == displayO[4] &&
        displayO[1] == displayO[7] &&
        displayO[1] != '') {
      showWinDialog(displayO[1]);
    }
    if (displayO[2] == displayO[5] &&
        displayO[2] == displayO[8] &&
        displayO[2] != '') {
      showWinDialog(displayO[2]);
    }
    if (displayO[6] == displayO[4] &&
        displayO[6] == displayO[2] &&
        displayO[6] != '') {
      showWinDialog(displayO[6]);
    }
    if (displayO[0] == displayO[4] &&
        displayO[0] == displayO[8] &&
        displayO[0] != '') {
      showWinDialog(displayO[0]);
    }
  }

  showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text("WINNER IS : ${winner}"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                Clearboard();
                Navigator.of(context).pop();
              });
            },
            child: const Text("Play Again"),
          ),
        ],
      ),
    );
    if (winner == 'o') {
      scoreo += 1;
    } else if (winner == 'X') {
      scorex += 1;
    }
    confettiController.play();
  }

  Clearboard() {
    for (int i = 0; i < 9; i++) {
      displayO[i] = '';
    }
  }

  @override
  void initState() {
    super.initState();

    confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: const Text("Tick Tack Toe"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey.shade800,
      body: Consumer<gamecontroller>(builder: (context, Provider, child) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
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
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      ontapped(index);
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Center(
                          child: Text(
                        "${displayO[index]}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                child: Column(
                  children: [
                    const Text("Score Board",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Player X",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "${scorex}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "Player o",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "${scoreo}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        );
      }),
    );
  }
}
