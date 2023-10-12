import 'package:flutter/material.dart';

class gamecontroller extends ChangeNotifier {
  List<String> displayO = ["", "", "", "", "", "", "", "", "", ""];

  bool turn = true;

  ontapped(int index) {
    if (turn && displayO[index] == '') {
      displayO[index] = "0";
    } else if (!turn && displayO[index] == '') {
      displayO[index] = "X";
    }
    turn = !turn;
    notifyListeners();
    checkWinner();
  }

  checkWinner() {
    if (displayO[0] == displayO[1] &&
        displayO[0] == displayO[2] &&
        displayO[0] != '') {
      showWinDialog();
    }
    if (displayO[3] == displayO[4] &&
        displayO[3] == displayO[5] &&
        displayO[3] != '') {
      showWinDialog();
    }
    if (displayO[6] == displayO[7] &&
        displayO[6] == displayO[8] &&
        displayO[6] != '') {
      showWinDialog();
    }
    if (displayO[0] == displayO[3] &&
        displayO[0] == displayO[6] &&
        displayO[0] != '') {
      showWinDialog();
    }
    if (displayO[1] == displayO[4] &&
        displayO[1] == displayO[7] &&
        displayO[1] != '') {
      showWinDialog();
    }
    if (displayO[2] == displayO[5] &&
        displayO[2] == displayO[8] &&
        displayO[2] != '') {
      showWinDialog();
    }
    if (displayO[6] == displayO[4] &&
        displayO[6] == displayO[2] &&
        displayO[6] != '') {
      showWinDialog();
    }
    if (displayO[0] == displayO[4] &&
        displayO[0] == displayO[8] &&
        displayO[0] != '') {
      showWinDialog();
    }
  }

  showWinDialog() {}
}
